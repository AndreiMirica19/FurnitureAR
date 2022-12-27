//
//  HomeType.swift
//  FurnitureAR
//
//  Created by Andrei Mirica on 27.12.2022.
//

import SwiftUI

struct HomeType: View {
    let imageName: String
    let text: String

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(height: 360)
                .scaledToFill()
            Text(text)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom, 48)
        }
    }
}

struct HomeType_Previews: PreviewProvider {
    static var previews: some View {
        HomeType(imageName: "livingRoom", text: "Living room")
            .frame(height: 450)
    }
}
