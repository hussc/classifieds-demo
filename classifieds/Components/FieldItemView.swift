//
//  FieldItemView.swift
//  classifieds
//
//  Created by Hussein on 03/07/2022.
//

import SwiftUI

struct FieldItemView: View {
    @ObservedObject var viewModel: FieldItemViewModel
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.white
                .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0.0, y: 0.0)
            HStack(spacing: 15) {
                
                AsyncImage(
                    url: viewModel.image, content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                    }, placeholder: {
                        ProgressView()
                    })
                    .frame(width: 60, height: 60)
                    .scaledToFit()
                    .clipped()
                
                VStack(alignment: .leading, spacing: 3) {
                    Text(viewModel.title)
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)
                    Text(viewModel.subtitle)
                        .font(.system(size: 12, weight: .light, design: .rounded))
                        .foregroundColor(.secondary)
                    Text(viewModel.price)
                        .font(.system(size: 12, weight: .light, design: .rounded))
                        .foregroundColor(.green)
                }
            }
            .padding()
        }
        .padding()
    }
}

struct FieldItemView_Previews: PreviewProvider {
    static var previews: some View {
        FieldItemView(viewModel: .init(fieldItem: .sampleItem()))
    }
}
