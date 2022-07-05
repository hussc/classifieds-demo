//
//  FieldItemDetailsView.swift
//  classifieds
//
//  Created by Hussein on 03/07/2022.
//

import SwiftUI

struct FieldItemDetailsView: View {
    @ObservedObject var viewModel: FieldItemDetailsViewModel
        
    init(viewModel: FieldItemDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            AsyncImage(
                url: viewModel.image,
                transaction: .init(animation: .spring())) { phase in
                    switch phase {
                    case .empty:
                        ProgressView().progressViewStyle(.circular)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxHeight: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .clipped()
                    case .failure:
                        Text("Unknown error. Please try again. \n")
                            .foregroundColor(.red)
                    @unknown default:
                        Text("Unknown error. Please try again.")
                            .foregroundColor(.red)
                    }
                    
                }.frame(height: 200)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(viewModel.title)
                    .font(.system(size: 28, weight: .heavy, design: .rounded))
                Text(viewModel.price)
                    .font(.system(size: 21, weight: .regular, design: .rounded))
                    .foregroundColor(.accentColor)
                Text(viewModel.subtitle)
                    .font(.system(size: 18, weight: .regular, design: .rounded))
                    .lineLimit(nil)
            }
            
            Spacer()
        }.padding()
    }
}

struct FieldItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FieldItemDetailsView(viewModel: .init(fieldItem: .sampleItem()))
    }
}
