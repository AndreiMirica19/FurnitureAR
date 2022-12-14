//
//  CategoryView.swift
//  FurnishYourHome
//
//  Created by Andrei Mirica on 19.11.2022.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "cart")
                .resizable()
                .scaledToFit()
                .padding()
                .foregroundColor(.white)
      
            
            Text("Descrition")
                .font(.subheadline)
                .padding(.leading)
                .padding(.bottom)
                .foregroundColor(.white)
        }
        .background(.mint)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
