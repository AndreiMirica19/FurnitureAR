//
//  ProductView.swift
//  FurnishYourHome
//
//  Created by Andrei Mirica on 19.11.2022.
//

import SwiftUI

struct ProductView: View {
    
    @EnvironmentObject var cardManager: CardManager
    var furniture: Furniture
    
    var body: some View {
            VStack(alignment: .center) {
                if let image = furniture.thumbnail.thumbnailImage {
                    image
                    
                        .resizable()
                        .frame(width: 156, height: 128)
                        .scaledToFit()
                        .cornerRadius(16)
                }
                
                Divider()
                    .frame(height: 2)
                    .background(Color("lightBlue"))
                
                HStack {
                    Text("Name")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("yellow"))
                    Spacer()
                    Text(furniture.name)
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
                    
                    Text("\(furniture.price)$")
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
                    
                    Text(furniture.furnitureBrand.rawValue.capitalized)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("yellow"))
                    
                }
                
                Divider()
                    .frame(height: 2)
                    .background(Color("lightBlue"))
                
                HStack {
                    NavigationLink(destination: {
                        TryOnSingleProduct(furniture: furniture)
                    }, label: {
                        Text("Try on")
                            .multilineTextAlignment(.leading)
                            .fontWeight(.semibold)
                            .font(.headline)
                            .foregroundColor(Color("rose"))
                    })
                    
                    Spacer()
                    Button {
                        if !cardManager.containsProduct(furniture: furniture) {
                            cardManager.products.append((furniture, 1))
                        }
                        
                    } label: {
                        Image(systemName: cardManager.containsProduct(furniture: furniture) ? "checkmark.seal.fill" : "cart.circle")
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
        ProductView(furniture: Furniture(name: "name", price: 333, fileName: "", previewSize: CGSize(width: 128, height: 128), category: .sink, roomType: .bathroom, furnitureBrand: .bobs, furnitureStyle: .vintage))
            .frame(width: 256, height: 360)
    }
}
