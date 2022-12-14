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
    
    var models = ["desk3", "BathroomDrawers", "Desk"]
    @ObservedObject var thumbnailGenerator = ThumbnailGenerator()
    @State var placementObject: String?
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer(placementModel: $placementObject)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    if thumbnailGenerator.thumbnailImage.count >= models.count {
                        ForEach (0 ..< self.thumbnailGenerator.thumbnailImage.count)  { index in
                            thumbnailGenerator.thumbnailImage[index].onTapGesture {
                                placementObject = "d"
                            }
                        }
                    }
                }
            }
        }.onAppear {
            for model in models {
                thumbnailGenerator.generateThumbnail(for: model, size: CGSize(width: 120, height: 120))
            }
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
   @Binding var placementModel: String?
    
    func makeUIView(context: Context) -> ARView {
     
        let arView = ARView(frame: .zero)
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            config.sceneReconstruction = .mesh
        }
        
        arView.session.run(config)
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        guard let placementModel = placementModel else {
            return
        }

        let modelEntity = try! ModelEntity.loadModel(named: "desk3.usdz")
        let anchorEntity = AnchorEntity(plane: .any)
        anchorEntity.addChild(modelEntity)
        
        uiView.scene.addAnchor(anchorEntity)
    }
    
}

struct TryOnView_Previews: PreviewProvider {

    static var previews: some View {
        TryOnView(placementObject: nil)
    }
}
