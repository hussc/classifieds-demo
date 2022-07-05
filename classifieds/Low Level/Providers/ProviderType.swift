//
//  ReactiveProvider.swift
//  classifieds
//
//  Created by Hussein on 03/07/2022.
//

import Foundation
import Combine

protocol ProviderType: AnyObject {
    associatedtype Input
    associatedtype Response
    
    func publisher(for input: Input) -> AnyPublisher<Response, EndpointError>
}
