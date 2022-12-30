//
//  ARViewContainer.swift
//  FurnitureAR
//
//  Created by Andrei Mirica on 30.12.2022.
//

import Foundation
import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    @Binding var placementModel: Furniture?

    func makeUIView(context: Context) -> ARView {
 
        let arView = ARView(frame: .zero)
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
   
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            config.sceneReconstruction = .mesh
        }
 
        arView.session.run(config)
        arView.enableObjectRemoval()
        return arView
   
    }

    func updateUIView(_ uiView: ARView, context: Context) {
        guard var placementModel = placementModel else {
            return
        }
        
        placementModel.fileName += ".usdz"
        
        guard let modelEntity = try? ModelEntity.loadModel(named: placementModel.fileName) else {
            return
        }
        
        let anchorEntity = AnchorEntity()
        anchorEntity.addChild(modelEntity)
        modelEntity.generateCollisionShapes(recursive: true)
        
        uiView.installGestures([.translation, .rotation, .scale], for: modelEntity)
        uiView.scene.addAnchor(anchorEntity)
    }
}
