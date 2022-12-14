//
//  ThumbnailGenerator.swift
//  FurnitureAR
//
//  Created by Andrei Mirica on 27.11.2022.
//
import QuickLookThumbnailing
import Foundation
import SwiftUI
import Combine
import UIKit

class ThumbnailGenerator: ObservableObject {
    @Published var thumbnailImage: [Image] = []
    
    func generateThumbnail(for resource: String, withExtension: String = "usdz", size: CGSize) {
        
        guard let url = Bundle.main.url(forResource: resource, withExtension: withExtension) else {
            print("Error..")
            return
        }
        
        let scale = UIScreen.main.scale
        
        let request = QLThumbnailGenerator.Request(fileAt: url,
                                                   size: size,
                                                   scale: scale,
                                                   representationTypes: .all)
        
        let generator = QLThumbnailGenerator.shared
        
        generator.generateRepresentations(for: request) { (thumbnail, type, error) in
            DispatchQueue.main.async {
                if thumbnail == nil || error != nil {
                    print ("Error generating thumbnail: \(error?.localizedDescription)")
                    return
                } else {
                    self.thumbnailImage.append(Image(uiImage: thumbnail!.uiImage))
                }
            }
        }
        
    }
}
