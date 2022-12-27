//
//  ARViewExtension.swift
//  FurnitureAR
//
//  Created by Andrei Mirica on 14.12.2022.
//

import Foundation
import RealityKit
import UIKit

extension ARView {

    func enableObjectRemoval() {
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(recognizer:)))
        self.addGestureRecognizer(longPressGestureRecognizer)
    }
    
    @objc func handleLongPress(recognizer: UILongPressGestureRecognizer) {
        let location = recognizer.location(in: self)
        
        if let entity = self.entity(at: location) {
            if let anchorEntity = entity.anchor {
                anchorEntity.removeFromParent()
            }
        }
    }
}
