//
//  EmptyCardView.swift
//  FurnitureAR
//
//  Created by Andrei Mirica on 19.01.2023.
//

import SwiftUI

struct EmptyCardView: View {
    var body: some View {
        ZStack {
            Color("emptyCard")
            VStack {
                Image("emptycart")
            }
        }
    }
}

struct EmptyCardView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyCardView()
    }
}
