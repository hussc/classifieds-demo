//
//  HTTPEndpointProvider.swift
//  classifieds
//
//  Created by Hussein on 03/07/2022.
//

import Foundation
import Combine

class HTTPEndpointProvider<Endpoint: EndpointType>: EndpointProvider {
    typealias Input = Endpoint
    typealias Response = Endpoint.Response
    
    func publisher(for endpoint: Endpoint) -> AnyPublisher<Endpoint.Response, EndpointError> {
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        let session = URLSession.shared
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return session.dataTaskPublisher(for: urlRequest)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      (200..<300).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                
                return element.data
            }
            .decode(type: ResponseContainer<Response>.self, decoder: decoder)
            .mapError { .mapping($0) }
            .compactMap { $0.results }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

extension EndpointType {
    func publisher() -> AnyPublisher<Self.Response, EndpointError> {
        HTTPEndpointProvider().publisher(for: self)
    }
}
