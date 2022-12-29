//
//  CatalogueView.swift
//  FurnishYourHome
//
//  Created by Andrei Mirica on 19.11.2022.
//

import SwiftUI

struct HomeView: View {
    
    let columns = [
        GridItem(.adaptive(minimum: 128)),
        GridItem(.adaptive(minimum: 128))
    ]
    
    @EnvironmentObject var cardManager: CardManager
    
    let furnitureStyles = ["Contemporary", "Modern", "Retro", "Minimalist", "Vintage"]
    
    let topBrands = ["Ikea", "Ashley", "Bob's", "Value City"]
    
    @State var filterBy = FilterBy.room
    @State var filterValue = ""
    @State var isShowingFurniture = false
    @State var path: [FilterData] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                List {
                    Section(header: Text("Search by room")) {
                        TabView {
                            ForEach(RoomType.allCases, id: \.self) { room in
                                HomeType(imageName: room.rawValue.lowercased(), text: room.rawValue)
                                    .foregroundColor(.black)
                                    .onTapGesture {
                                        path.append(FilterData(filterBy: .room, filterValue: room.rawValue))
                                    }
                            }
                            
                        }.frame(height: 480)
                        .tabViewStyle(PageTabViewStyle())
                        .indexViewStyle(.page(backgroundDisplayMode: .always))
                    }.headerProminence(.increased)
                    
                    Section(header: Text("Style")) {
                        LazyVGrid(columns: columns, spacing: 4) {
                            ForEach(furnitureStyles, id: \.self) { style in
                                Text("\(style)")
                                    .padding()
                                    .foregroundColor(Color("yellow"))
                                    .background(Color("darkBlue"))
                                    .cornerRadius(30)
                                    .onTapGesture {
                                        path.append(FilterData(filterBy: .style, filterValue: style))
                                    }
                            }
                        }
                    }.headerProminence(.increased)
                    
                    Section(header: Text("Top brands")) {
                        LazyVGrid(columns: columns, spacing: 4) {
                            ForEach(FurnitureBrand.allCases, id: \.self) { brand in
                                Text("\(brand.rawValue)")
                                    .padding()
                                    .foregroundColor(Color("yellow"))
                                    .background(Color("darkBlue"))
                                    .cornerRadius(30)
                                    .onTapGesture {
                                        path.append(FilterData(filterBy: .manufacturer, filterValue: brand.rawValue))
                                    }
                            }
                        }
                    }.headerProminence(.increased)
                }
            }.navigationDestination(for: FilterData.self) { filter in
                ProductsView(filterBy: filter.filterBy, filterValue: filter.filterValue)
            }
        }
    }
}

struct FilterData: Hashable {
    var filterBy: FilterBy
    var filterValue: String
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
