//
//  ResponseContainer.swift
//  classifieds
//
//  Created by Hussein on 03/07/2022.
//

import Foundation

/**
 Intermediate representation of data while transfered between the backend and the frontend,
 The client of the networking API generally won't need to know about the container of the result,
 instead, the metadata associated with the response are needed for more decitions regarding the status code and errors returned ( validation of the response ).
 
 But here, other meta information are omitted and I've kept this plain container without performing actual validation on the data.
 */
struct ResponseContainer<ContentType>: ResponseContainerType {
    let results: ContentType
}

extension ResponseContainer: Decodable where ContentType: Decodable { }
extension ResponseContainer: Encodable where ContentType: Encodable { }
