//
//  ContentView.swift
//  classifieds
//
//  Created by Hussein on 03/07/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        FieldListingView(viewModel: .init())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
