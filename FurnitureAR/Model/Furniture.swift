//
//  Furniture.swift
//  FurnitureAR
//
//  Created by Andrei Mirica on 27.11.2022.
//

import Foundation
import SwiftUI

struct Furniture {
    var name: String
    var price: Int
    var fileName: String
    var previewSize: CGSize
   @ObservedObject var thumbnail = ThumbnailGenerator()
    
    init(name: String, price: Int, fileName: String, previewSize: CGSize) {
        self.name = name
        self.price = price
        self.fileName = fileName
        self.previewSize = previewSize
        self.thumbnail.generateThumbnail(for: fileName, size: previewSize)
    }
}
