//
//  PaginatedEndpointProvider.swift
//  classifieds
//
//  Created by Hussein on 03/07/2022.
//

import Foundation
import Combine

class PaginatedEndpointProvider<Endpoint: EndpointType>: ProviderType {
    typealias Input = Endpoint
    typealias Response = PaginatedResponseContainer<Endpoint.Response>
    
    func publisher(for input: Endpoint) -> AnyPublisher<PaginatedResponseContainer<Endpoint.Response>, EndpointError> {
        fatalError()
    }
}
