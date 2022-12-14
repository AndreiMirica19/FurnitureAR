//
//  ContentView.swift
//  FurnitureAR
//
//  Created by Andrei Mirica on 27.11.2022.
//

import SwiftUI
import RealityKit

struct ContentView : View {
        var body: some View {
            TabView {
                CatalogueView()
                    .tabItem {
                        Label("Catalogue", systemImage: "book")
                    }
                TryOnView()
                    .tabItem {
                        Label("Try on", systemImage: "camera")
                    }
                CartView()
                    .tabItem {
                        Label("Cart", systemImage: "cart")
                    }
            }
        }
    }

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
