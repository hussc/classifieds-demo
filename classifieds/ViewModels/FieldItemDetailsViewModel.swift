//
//  FieldItemDetailsViewModel.swift
//  classifieds
//
//  Created by Hussein on 03/07/2022.
//

import Foundation
import Combine

class FieldItemDetailsViewModel: ObservableObject {
    @Published var title: String
    @Published var subtitle: String
    @Published var price: String
    @Published var image: URL?
        
    private var fieldItem: FieldItem
    private var cancellables = Set<AnyCancellable>()
    
    init(fieldItem: FieldItem){
        self.fieldItem = fieldItem
        
        self.title = fieldItem.name ?? ""
        self.subtitle = fieldItem.createdAt ?? ""
        self.price = fieldItem.price ?? ""
        self.image = URL(string: fieldItem.imageUrlsThumbnails?.first ?? "")
    }
}
