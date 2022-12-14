//
//  ProductView.swift
//  FurnishYourHome
//
//  Created by Andrei Mirica on 19.11.2022.
//

import SwiftUI

struct ProductView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "cart")
                .resizable()
                .scaledToFit()
                .frame(width: .infinity)
            
            Text("Product name")
                .bold()
                .font(.title)
                .padding(.leading)
            
            Text("Description")
                .font(.subheadline)
                .padding(.leading)
            
            Text("Price")
                .bold()
                .font(.largeTitle)
                .padding(.leading)
            
            Spacer()
            
            HStack() {
                Button {
                    
                } label: {
                    Text("Try it")
                        .padding()
                        .frame(width: .infinity, height: 44)
                }
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "cart")
                        .padding()
                        .frame(width: .infinity, height: 44)
                }
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                
            }
            .padding(16)
            
            
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
            .previewLayout(.sizeThatFits)
    }
}
