//
//  CartView.swift
//  FurnishYourHome
//
//  Created by Andrei Mirica on 19.11.2022.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cardManager: CardManager

    var body: some View {
        ScrollView {
            if !cardManager.products.isEmpty {
                LazyVStack {
                    ForEach(cardManager.products, id: \.furniture.fileName) { furniture, _ in
                        CardItemView(furniture: furniture)
                            .environmentObject(cardManager)
                            .frame(minHeight: 256)
                            .padding()
                    }
                }
            } else {
                EmptyCardView()
            }
        }.padding(.top, 1)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
