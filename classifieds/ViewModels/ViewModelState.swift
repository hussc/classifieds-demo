//
//  ViewModelState.swift
//  classifieds
//
//  Created by Hussein on 03/07/2022.
//

import Foundation

enum ViewModelState<T> {
    case idle
    case loading
    case failure(Error)
    case content(T)
    case empty
    
    var isLoading: Bool {
        if case .idle = self {
            return true
        }
        
        if case .loading = self {
            return true
        }
        
        return false
    }
}
