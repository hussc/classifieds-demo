//
//  EndpointProvider.swift
//  classifieds
//
//  Created by Hussein on 03/07/2022.
//

import Foundation
import Combine

/**
 Provides a publisher for given endpoint, the publisher only valid for one endpoint and it's response type,
 It's initially made reactive way without cancellation in mind
 
 The provider is binded (typed) to specific endpoint and it's response type.
 */
protocol EndpointProvider: ProviderType where Response == Endpoint.Response, Input == Endpoint {
    associatedtype Endpoint: EndpointType
}
