//
//  CatalogueView.swift
//  FurnitureAR
//
//  Created by Andrei Mirica on 27.12.2022.
//

import SwiftUI

struct CatalogueView: View {

    @EnvironmentObject var cardManager: CardManager

    var body: some View {
        NavigationView {
            List(Category.allCases, id: \.self) { category in
                NavigationLink(destination: ProductsByCategoryView(category: category).environmentObject(cardManager)) {
                    Text(category.rawValue)
                }
            }
        }
    }
}

struct CatalogueView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogueView()
    }
}
