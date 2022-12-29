//
//  CatalogueView.swift
//  FurnitureAR
//
//  Created by Andrei Mirica on 27.12.2022.
//

import SwiftUI

struct CatalogueView: View {

    let categories = ["Chairs", "Beds", "Desks", "Couches", "Drawers", "Toilets", "Sinks"]
    @EnvironmentObject var cardManager: CardManager

    var body: some View {
        NavigationView {
            List(categories, id: \.self) { category in
                NavigationLink(destination: ProductsByCategoryView(category: category).environmentObject(cardManager)) {
                    Text(category)
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
