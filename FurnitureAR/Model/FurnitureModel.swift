//
//  FurnitureModel.swift
//  FurnitureAR
//
//  Created by Andrei Mirica on 14.12.2022.
//

import Foundation

class FurnitureModel: ObservableObject {
    @Published var furnitureList: [Furniture] = []
    
    init(furniturePreviewSize: CGSize) {
        
        furnitureList.append(Furniture(name: "desk", price: 1000, fileName: "desk3", previewSize: furniturePreviewSize))
        furnitureList.append(Furniture(name: "Bathroom Drawers", price: 1000, fileName: "BathroomDrawers", previewSize: furniturePreviewSize))
        furnitureList.append(Furniture(name: "Desk", price: 1000, fileName: "Desk", previewSize: furniturePreviewSize))
    }
}
