//
//  FieldItem.swift
//  classifieds
//
//  Created by Hussein on 03/07/2022.
//

import Foundation

struct FieldItem: Codable, Identifiable {
    let uid: String
    let name: String?
    
    let price: String?
    let createdAt: String?
    
    var id: String { uid }
    
    let imageIds: [String]?
    let imageUrls: [String]?
    let imageUrlsThumbnails: [String]?
}
