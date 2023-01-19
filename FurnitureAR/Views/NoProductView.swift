//
//  NoProductView.swift
//  FurnitureAR
//
//  Created by Andrei Mirica on 19.01.2023.
//

import SwiftUI

struct NoProductView: View {
    var body: some View {
        VStack {
            Image("noProducts")
            Text("We apologize, but unfortunately there are no products currently available in this category.")
                .multilineTextAlignment(.center)
                .font(.title)
                .fontWeight(.bold)
                .padding()
        }
    }
}

struct NoProductView_Previews: PreviewProvider {
    static var previews: some View {
        NoProductView()
    }
}
