//
//  Furniture.swift
//  FurnitureAR
//
//  Created by Andrei Mirica on 27.11.2022.
//

import Foundation
import SwiftUI

struct Furniture: Equatable {
    static func == (lhs: Furniture, rhs: Furniture) -> Bool {
        lhs.furnitureBrand == rhs.furnitureBrand && lhs.name == rhs.name
    }
    
    var name: String
    var price: Int
    var category: Category
    var fileName: String
    var previewSize: CGSize
    var roomType: RoomType
    var furnitureBrand: FurnitureBrand
    var furnitureStyle: FurnitureStyle
   @ObservedObject var thumbnail = ThumbnailGenerator()
    
    init(name: String, price: Int, fileName: String, previewSize: CGSize, category: Category, roomType: RoomType, furnitureBrand: FurnitureBrand, furnitureStyle: FurnitureStyle) {
        self.name = name
        self.price = price
        self.fileName = fileName
        self.previewSize = previewSize
        self.category = category
        self.roomType = roomType
        self.furnitureBrand = furnitureBrand
        self.furnitureStyle = furnitureStyle
        self.thumbnail.generateThumbnail(for: fileName, size: previewSize)
    }
}
