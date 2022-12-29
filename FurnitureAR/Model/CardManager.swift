//
//  CardModel.swift
//  FurnitureAR
//
//  Created by Andrei Mirica on 28.12.2022.
//

import Foundation

class CardManager: ObservableObject {
    @Published var products: [(furniture: Furniture, quantity: Int)] = []
    
    func getQuantityOfProduct(furniture: Furniture) -> Int? {
        products.first(where: { $0.furniture == furniture })?.quantity
    }
    
    func addQuantity(furniture: Furniture) {
        guard let index = products.firstIndex(where: { $0.furniture == furniture }) else {
            return
        }
        
        products[index].quantity += 1
    }
    
    func substractQuantity(furniture: Furniture) {
        guard let index = products.firstIndex(where: { $0.furniture == furniture }) else {
            return
        }
        
        products[index].quantity -= 1
        
        if products[index].quantity == 0 {
            products.remove(at: index)
        }
    }
    
    func containsProduct(furniture: Furniture) -> Bool {
        products.contains(where: { $0.furniture == furniture })
    }
}
