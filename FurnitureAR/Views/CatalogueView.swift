//
//  CatalogueView.swift
//  FurnishYourHome
//
//  Created by Andrei Mirica on 19.11.2022.
//

import SwiftUI

struct CatalogueView: View {
    
    let rows = [
        GridItem(.adaptive(minimum: 120)),
        GridItem(.adaptive(minimum: 120))
    ]
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Explore")) {
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: rows, alignment: .center, spacing: 16) {
                            ForEach(0..<10, id: \.self) { item in
                                CategoryView()
                                    .cornerRadius(16)
                                    .frame(width: 128)
                                    .onTapGesture {
                                        print("TEst")
                                    }
                            }
                        }
                        .padding(.bottom)
                        .frame(width: .infinity, height: 300)
                    }
                    .listRowInsets(EdgeInsets(top: 16, leading: 4, bottom: 16, trailing: 4))
                }.headerProminence(.increased)
                
                Section(header: Text("Type of home")) {
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: rows, alignment: .center, spacing: 16) {
                            ForEach(0..<10, id: \.self) { item in
                                CategoryView()
                                    .cornerRadius(16)
                                    .frame(width: 128)
                                    .onTapGesture {
                                        print("TEst")
                                    }
                            }
                        }
                        .padding(.bottom)
                        .frame(width: .infinity, height: 300)
                    }
                    .listRowInsets(EdgeInsets(top: 16, leading: 4, bottom: 16, trailing: 4))
                }.headerProminence(.increased)
            }
        }
    }
}

struct CatalogueView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogueView()
    }
}
