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
                    ForEach(0 ..< furnitureModel.furnitureList.count) { index in
                        furnitureModel.furnitureList[index].thumbnail.thumbnailImage
                            .cornerRadius(16)
                            .padding(4)
                            .onTapGesture {
                                placementObject = furnitureModel.furnitureList[index]
                            }
                    }
                }
            }
        }
    }
}

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

struct TryOnView_Previews: PreviewProvider {
    
    static var previews: some View {
        TryOnView(placementObject: nil)
    }
}
