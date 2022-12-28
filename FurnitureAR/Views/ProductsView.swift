//
//  Products.swift
//  FurnitureAR
//
//  Created by Andrei Mirica on 27.12.2022.
//

import SwiftUI

struct ProductsView: View {
    let columns = [
        GridItem(.adaptive(minimum: 128)),
        GridItem(.adaptive(minimum: 128))
    ]
    
    let category: String
    let furnitureModel = FurnitureModel.shared
    @State private var showingAlert = false
    @State var orderBy = "relevance"
    
    var orderOptions = ["relevance", "low to high", "high to low", "alphabetic"]
    
    var body: some View {
        ScrollView {
            VStack {
                Text(category)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                .padding(.top)
                
                Picker("Sort by", selection: $orderBy) {
                    ForEach(self.orderOptions, id: \.self) { sort in
                        Text("Sort by \(sort.capitalized)")
                    }
                    
                }

            }

            ForEach(furnitureModel.filterByCategory(category: category, orderBy: orderBy), id: \.name) { furniture in
                if let thumbnail = furniture.thumbnail.thumbnailImage {
                    ProductView(name: furniture.name, price: furniture.price, image: thumbnail, manufacturer: furniture.furnitureBrand.rawValue)
                        .frame(minHeight: 256)
                    Divider()
                }
            }.padding()
        }
    }
}

struct Products_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView(category: "Sinks")
    }
}
