//
//  Products.swift
//  FurnitureAR
//
//  Created by Andrei Mirica on 27.12.2022.
//

import SwiftUI

struct ProductsByCategoryView: View {
    let columns = [
        GridItem(.adaptive(minimum: 128)),
        GridItem(.adaptive(minimum: 128))
    ]
    
    let category: Category
    let furnitureModel = FurnitureModel.shared
    @State private var showingAlert = false
    @State var orderBy = "relevance"
    @EnvironmentObject var cardManager: CardManager
    
    var orderOptions = ["relevance", "low to high", "high to low", "alphabetic"]
    
    var body: some View {
        ScrollView {
            VStack {
                Text(category.rawValue)
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
                ProductView(furniture: furniture)
                    .frame(minHeight: 256)
                    .environmentObject(cardManager)
                Divider()
                
            }.padding()
        }
    }
}

struct ProductsByCategory_Previews: PreviewProvider {
    static var previews: some View {
        ProductsByCategoryView(category: .sink)
    }
}
