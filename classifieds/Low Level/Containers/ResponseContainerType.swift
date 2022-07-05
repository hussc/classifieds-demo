//
//  ResponseContainerType.swift
//  classifieds
//
//  Created by Hussein on 03/07/2022.
//

import Foundation

protocol ResponseContainerType {
    associatedtype ContentType
    
    var results: ContentType { get }
}
