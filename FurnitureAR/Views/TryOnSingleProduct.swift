//
//  TryOnSingleProduct.swift
//  FurnitureAR
//
//  Created by Andrei Mirica on 30.12.2022.
//

import SwiftUI

struct TryOnSingleProduct: View {
    var furniture: Furniture
    @State var placementObject: Furniture?
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ARViewContainer(placementModel: $placementObject)
                HStack {
                    furniture.thumbnail.thumbnailImage
                        .cornerRadius(16)
                        .padding(4)
                        .onTapGesture {
                            placementObject = furniture
                        }
                }
            }.toolbar(.hidden, for: .tabBar)
        }
    }
}

struct TryOnSingleProduct_Previews: PreviewProvider {
    static var previews: some View {
        TryOnSingleProduct(furniture: Furniture(name: "", price: 22, fileName: "", previewSize: CGSize(width: 18, height: 18), category: .sink, roomType: .kitchen, furnitureBrand: .bobs, furnitureStyle: .vintage))
    }
}
