//
//  FieldListingView.swift
//  classifieds
//
//  Created by Hussein on 03/07/2022.
//

import SwiftUI

struct FieldListingView: View {
    @State var isSheetPresented: Bool = false
    @State var itemDetailSelection: FieldItem?
    
    @ObservedObject var viewModel: ListingViewModel = .init()
    
    var body: some View {
        NavigationView {
            bodyForStateView()
                .navigationBarTitle("Classifieds")
        }
    }
    
    func bodyForStateView() -> some View {
        switch viewModel.state {
        case .idle, .loading:
            let items = Array(repeating: FieldItem.sampleItem(), count: 5)
            return AnyView(bodyForContentState(for: items)
                .redacted(reason: .placeholder))
        case .failure(let error):
            return AnyView(
                ErrorView(error: error){
                    self.performTheLoad()
                }
            )
        case .content(let items):
            return AnyView(bodyForContentState(for: items))
        case .empty:
            return AnyView(ErrorView(error: EmptyError(), retryAction: {
                self.performTheLoad()
            }))
        }
    }
    
    func bodyForContentState(for viewModels: [FieldItem]) -> some View {
        ScrollView {
            VStack(spacing: -15) {
                ForEach(viewModels) { item in
                    FieldItemView(viewModel: .init(fieldItem: item)).onTapGesture {
                        self.itemDetailSelection = item
                    }
                }
            }
        }
        .sheet(item: $itemDetailSelection, content: { item in
            FieldItemDetailsView(viewModel: .init(fieldItem: item))
        })
    }
    
    func performTheLoad(){
        viewModel.performTheLoad()
    }
}

extension FieldListingView {
    struct EmptyError: LocalizedError {
        var errorDescription: String? { "No data was found" }
    }
}

struct FieldListingView_Previews: PreviewProvider {
    static var previews: some View {
        FieldListingView()
    }
}
