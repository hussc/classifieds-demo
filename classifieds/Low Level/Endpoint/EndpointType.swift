//
//  EndpointType.swift
//  classifieds
//
//  Created by Hussein on 03/07/2022.
//

import Foundation

/**
 Represents one Restful endpoint with typed response type,
 Other properties ( like the headers and so on ) are ommited
 As we don't generally need add more complexity to our implementation.
 */
protocol EndpointType {
    associatedtype Response: Decodable
    
    var method: EndpointMethod { get }
    
    var path: String { get }
    
    var baseURL: URL { get }
}
