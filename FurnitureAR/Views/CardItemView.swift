//
//  CardItemView.swift
//  FurnitureAR
//
//  Created by Andrei Mirica on 29.12.2022.
//

import SwiftUI

struct CardItemView: View {
    var furniture: Furniture
    @EnvironmentObject var cardManager: CardManager

    var body: some View {
        VStack {
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
                Button {
                    cardManager.substractQuantity(furniture: furniture)

                } label: {
                    Image(systemName: cardManager.getQuantityOfProduct(furniture: furniture) ?? 0 > 1 ? "minus.circle" : "trash.circle")
                        .resizable()
                        .frame(width: 44, height: 44)
                        .foregroundColor(Color("rose"))
                }
                
                Spacer()
                
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 44, height: 44)

                    if let quantity = cardManager.getQuantityOfProduct(furniture: furniture) {
                        Text("\(quantity)")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
                
                Spacer()
                
                Button {
                    cardManager.addQuantity(furniture: furniture)
                } label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 44, height: 44)
                        .foregroundColor(Color("rose"))
                }

            }
        }.padding()
            .background(Color("darkBlue"))
            .cornerRadius(25)
            .shadow(radius: 16)
        
    }
}

struct CardItemView_Previews: PreviewProvider {
    static var previews: some View {
        let furniture = Furniture(name: "Shelf", price: 300, fileName: "", previewSize: CGSize(width: 128, height: 128), category: .sink, roomType: .bathroom, furnitureBrand: .bobs, furnitureStyle: .minimalist)
        CardItemView(furniture: furniture)
            .frame(width: 256, height: 360)
    }
}
