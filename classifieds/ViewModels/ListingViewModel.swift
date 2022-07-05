//
//  ListingViewModel.swift
//  classifieds
//
//  Created by Hussein on 03/07/2022.
//

import Foundation
import Combine

class ListingViewModel: ObservableObject {
    @Published private(set) var state = ViewModelState<[FieldItem]>.idle
    
    private var cancellables = Set<AnyCancellable>()
    private var provider: HTTPEndpointProvider<ClassifiedsEndpoint>
    
    init() {
        self.state = .idle
        self.provider = .init()
        self.performTheLoad()
    }
    
    func performTheLoad(){
        state = .loading
        
        provider.publisher(for: .init()).sink { (result) in
            if case .failure(let error) = result {
                self.state = .failure(error)
            }
        } receiveValue: { (items) in
            self.state = .content(items)
        }.store(in: &cancellables)
    }
}
