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
    
    let furnitureStyles = ["Contemporary", "Modern", "Retro", "Minimalist", "Vintage"]
    
    let topBrands = ["Ikea", "Ashley", "Bob's", "Value City"]
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Search by room")) {
                    TabView {
                        HomeType(imageName: "livingRoom", text: "Livingroom")
                        HomeType(imageName: "bathroom", text: "Bathroom")
                        HomeType(imageName: "bedroom", text: "Bedroom")
                        HomeType(imageName: "kitchen", text: "Kitchen")
                        HomeType(imageName: "workroom", text: "Workroom")
                    }
                    .frame(height: 480)
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
                        }
                    }
                }.headerProminence(.increased)
                
                Section(header: Text("Top brands")) {
                    LazyVGrid(columns: columns, spacing: 4) {
                        ForEach(topBrands, id: \.self) { style in
                            Text("\(style)")
                                .padding()
                                .foregroundColor(Color("yellow"))
                                .background(Color("darkBlue"))
                                .cornerRadius(30)
                        }
                    }
                }.headerProminence(.increased)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
