//
//  FurnitureModel.swift
//  FurnitureAR
//
//  Created by Andrei Mirica on 14.12.2022.
//

import Foundation

class FurnitureModel: ObservableObject {
    @Published var furnitureList: [Furniture] = []
    static let shared = FurnitureModel(furniturePreviewSize: CGSize(width: 128, height: 128))
    
    private init(furniturePreviewSize: CGSize) {
        
        furnitureList.append(Furniture(name: "Study desk", price: 300, fileName: "desk3", previewSize: furniturePreviewSize, category: .desk, roomType: .workroom, furnitureBrand: .ashley, furnitureStyle: .contemporary))
        furnitureList.append(Furniture(name: "Bathroom Drawers", price: 1000, fileName: "BathroomDrawers", previewSize: furniturePreviewSize, category: .sink, roomType: .bathroom, furnitureBrand: .bobs, furnitureStyle: .vintage))
        furnitureList.append(Furniture(name: "Futuristic Desk", price: 1000, fileName: "Desk", previewSize: furniturePreviewSize, category: .desk, roomType: .workroom, furnitureBrand: .ashley, furnitureStyle: .contemporary))
    }
    
    func filterByCategory(category: String, orderBy: String) -> [Furniture] {
        var categoryValue: Category

        switch category {
        case "Desks":
            categoryValue = .desk
        case "Beds":
            categoryValue = .bed
        case "Chairs":
            categoryValue = .chair
        case "Chouches":
            categoryValue = .couch
        case "Toilets":
            categoryValue = .toilet
        case "Sinks":
            categoryValue = .sink

        default:
            return []
        }
        
        let furnitures = furnitureList.filter { furniture in
            return furniture.category == categoryValue
        }
        
        let orderByValue = SortBy(rawValue: orderBy)
        
        switch orderByValue {
        case .relevance:
            return furnitures
            
        case .highToLow:
            return furnitures.sorted(by: { $0.price > $1.price })
            
        case .lowToHigh:
            return furnitures.sorted(by: { $0.price < $1.price })
            
        case .alphabetic:
            return furnitures.sorted(by: { $0.name < $1.name })
            
        default:
            return furnitures
        }
        
    }
}
