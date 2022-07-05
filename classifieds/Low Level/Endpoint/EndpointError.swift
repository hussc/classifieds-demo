//
//  EndpointError.swift
//  classifieds
//
//  Created by Hussein on 03/07/2022.
//

import Foundation

enum EndpointError: LocalizedError {
    case underlying(Error)
    case mapping(Error)
    
    var errorDescription: String? {
        switch self {
        case .underlying(let error):
            dump(error)
            return error.localizedDescription
        case .mapping(let error):
            print(error.localizedDescription)
            dump(error)
            return error.localizedDescription
        }
    }
}
