//
//  ClassifiedsEndpoint.swift
//  classifieds
//
//  Created by Hussein on 03/07/2022.
//

import Foundation

struct ClassifiedsEndpoint: EndpointType {
    typealias Response = [FieldItem]
    
    var baseURL: URL {
        URL(string: "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com")!
    }
    
    var path: String {
        "default/dynamodb-writer"
    }
    
    var method: EndpointMethod {
        .get
    }
}


