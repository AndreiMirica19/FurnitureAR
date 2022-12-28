//
//  ProductView.swift
//  FurnishYourHome
//
//  Created by Andrei Mirica on 19.11.2022.
//

import SwiftUI

struct ProductView: View {
    var name: String
    var price: Int
    var image: Image
    var manufacturer: String
    
    var body: some View {
        VStack(alignment: .center) {
            
            image
                .resizable()
                .frame(width: 156, height: 128)
                .scaledToFit()
                .cornerRadius(16)
            
            Divider()
                .frame(height: 2)
                .background(Color("lightBlue"))
            
            HStack {
                Text("Name")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("yellow"))
                Spacer()
                Text(name)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("yellow"))
            }.padding(.top)
            
            Divider()
                .frame(height: 2)
                .background(Color("lightBlue"))
            
            HStack {
                Text("Price")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("yellow"))
                
                Spacer()
                
                Text("\(price)$")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("yellow"))
            }
            
            Divider()
                .frame(height: 2)
                .background(Color("lightBlue"))
            
            HStack {
                Text("Brand")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("yellow"))
                
                Spacer()
                
                Text(manufacturer.capitalized)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("yellow"))
                
            }
            
            Divider()
                .frame(height: 2)
                .background(Color("lightBlue"))
   
            HStack {
                Button {
                    
                } label: {
                    Text("Try on")
                        .multilineTextAlignment(.leading)
                        .fontWeight(.semibold)
                        .font(.headline)
                        .foregroundColor(Color("rose"))
                }
                
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "cart.circle")
                        .resizable()
                        .frame(width: 44, height: 44)
                        .foregroundColor(Color("rose"))
                }
            }.padding(.top)
    
        }.padding()
            .background(Color("darkBlue"))
            .cornerRadius(25)
            .shadow(radius: 16)
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(name: "title", price: 20, image: Image(systemName: "cart"), manufacturer: "Ikea")
            .frame(width: 256, height: 360)
    }
}
