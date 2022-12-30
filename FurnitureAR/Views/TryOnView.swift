//
//  TryOnView.swift
//  FurnishYourHome
//
//  Created by Andrei Mirica on 19.11.2022.
//

import SwiftUI
import RealityKit
import ARKit

struct TryOnView: View {

    @ObservedObject var furnitureModel = FurnitureModel.shared
    @State var placementObject: Furniture?

    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer(placementModel: $placementObject)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(furnitureModel.furnitureList, id: \.fileName) { furniture in
                        furniture.thumbnail.thumbnailImage
                            .cornerRadius(16)
                            .padding(4)
                            .onTapGesture {
                                placementObject = furniture
                            }
                    }
                }
            }
        }
    }
}

struct TryOnView_Previews: PreviewProvider {
    
    static var previews: some View {
        TryOnView(placementObject: nil)
    }
}
