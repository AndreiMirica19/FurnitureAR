//
//  ProductsView.swift
//  FurnitureAR
//
//  Created by Andrei Mirica on 29.12.2022.
//

import SwiftUI

struct ProductsView: View {
    let furnitureModel = FurnitureModel.shared
    @EnvironmentObject var cardManager: CardManager
    @State var categories: [String] = []
    var filterBy: FilterBy
    @State var furnitures: [Furniture] = []
    var filterValue: String
    
    var body: some View {
        List {
            ForEach(categories, id: \.self) { category in
                Section(header: Text(category)) {
                    
                    TabView {
                        ForEach(furnitureModel.filterBy(filter: filterBy, category: category, filterValue: filterValue), id: \.name) { furniture in
                            ProductView(furniture: furniture)
                                .frame(height: 516)
                                .environmentObject(cardManager)
                                .padding(.bottom)
                            
                        }.padding()
                    }.tabViewStyle(.page)
                        .frame(height: 528)
                    
                }.headerProminence(.increased)
            }
        }.onAppear {
            switch filterBy {
            case .room:
                categories = furnitureModel.getCategoriesFilteredByRoom(room: filterValue)
                    
            case .style:
                categories = furnitureModel.getCategoriesFilteredByStyle(style: filterValue)

            case .manufacturer:
                categories = furnitureModel.getCategoriesFilterdByBrand(brand: filterValue)
                
            case .category:
                categories = furnitureModel.getCategoriesFilteredByRoom(room: filterValue)
                
            }
        }
    }
    
    func displayProducts(category: Category) {
        
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView(filterBy: .room, filterValue: "")
    }
}
