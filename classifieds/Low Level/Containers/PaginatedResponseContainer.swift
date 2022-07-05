//
//  PaginatedResponseContainer.swift
//  classifieds
//
//  Created by Hussein on 03/07/2022.
//

import Foundation


struct PaginatedResponseContainer<ContentType>: ResponseContainerType {
    let results: ContentType
    let pagination: Pagination
}

extension PaginatedResponseContainer: Decodable where ContentType: Decodable { }
extension PaginatedResponseContainer: Encodable where ContentType: Encodable { }
