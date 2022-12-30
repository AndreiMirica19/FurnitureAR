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
        furnitureList.append(Furniture(name: "Bathroom Drawers", price: 1000, fileName: "BathroomDrawers", previewSize: furniturePreviewSize, category: .sink, roomType: .bathroom, furnitureBrand: .ashley, furnitureStyle: .vintage))
        furnitureList.append(Furniture(name: "Futuristic Desk", price: 1000, fileName: "Desk", previewSize: furniturePreviewSize, category: .desk, roomType: .workroom, furnitureBrand: .bobs, furnitureStyle: .contemporary))
    }
    
    func filterByCategory(category: Category, orderBy: String) -> [Furniture] {

        
        let furnitures = furnitureList.filter { furniture in
            return furniture.category == category
        }
        
        let orderByValue = OrderBy(rawValue: orderBy)
        
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
    
    func getCategoriesFilteredByRoom(room: String) -> [Category] {
        let room = RoomType(rawValue: room)

        let furniture = furnitureList.filter { furniture in
            return furniture.roomType == room
        }

        return Array(Set(furniture.map { $0.category }))
    }
    
    func getCategoriesFilteredByStyle(style: String) -> [Category] {
        let style = FurnitureStyle(rawValue: style)
        
        let furniture = furnitureList.filter { furniture in
            return furniture.furnitureStyle == style
        }
        
        return Array(Set(furniture.map { $0.category }))
    }
    
    func getCategoriesFilterdByBrand(brand: String) -> [Category] {
        let brand = FurnitureBrand(rawValue: brand)
        
        let furniture = furnitureList.filter { furniture in
            return furniture.furnitureBrand == brand
        }
        
        return Array(Set(furniture.map { $0.category }))
    }
    
    func filterBy(filter: FilterBy, category: Category, filterValue: String) -> [Furniture] {
        let filteredFurniture = filterByCategory(category: category, orderBy: "Relevance")

        switch filter {
        case .room:
            return filteredFurniture.filter({
                return $0.roomType == RoomType(rawValue: filterValue)
            })
        
        case .style:
            return filteredFurniture.filter({ $0.furnitureStyle == FurnitureStyle(rawValue: filterValue) })
            
        case .manufacturer:
            return filteredFurniture.filter({ $0.furnitureBrand == FurnitureBrand(rawValue: filterValue) })
            
        default:
            return filteredFurniture
        }
    }
}
