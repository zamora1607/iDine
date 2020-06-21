//
//  ItemDetails.swift
//  iDine
//
//  Created by Ania on 21/06/2020.
//  Copyright © 2020 Zamora. All rights reserved.
//

import SwiftUI

struct ItemDetails: View {
    
    @EnvironmentObject var order: Order
    @EnvironmentObject var favourites: Favourites
    
    @State private var isFavourite = false
    
    var item: MenuItem
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .font(.caption)
                    .padding(4)
                    .background(Color.black)
                    .foregroundColor(.white)
                .offset(x: -5, y: -5)
            }
            
            Text(item.description)
                .padding()
            
            Button("Order this") {
                self.order.add(item: self.item)
            }
            .font(.some(Font.callout))
            .padding(5)
            .background(Color.blue)
            .foregroundColor(.white)
            .padding(5)
            .border(Color.blue, width: 3)
            
            
            Spacer()
        }.navigationBarTitle(Text(item.name), displayMode: .inline)
        .navigationBarItems(trailing: favButton)
    }
    
    var favButton: some View {
        Button(action: {
            if self.favourites.items.contains(self.item) {
                self.favourites.remove(item: self.item)
            } else {
                self.favourites.add(item: self.item)
            }
            self.isFavourite.toggle()
        }) {
            HStack {
                if isFavourite {
                    Image(systemName: "heart.fill")
                        .padding(2)
                        .foregroundColor(.red)
                } else {
                    Image(systemName: "heart")
                      .padding(2)
                      .foregroundColor(.red)
                }
            }
        }
    }
}

struct ItemDetails_Previews: PreviewProvider {
    static let order = Order()
    static let favourites = Favourites()
    static var previews: some View {
        NavigationView {
            ItemDetails(item: MenuItem.example).environmentObject(order).environmentObject(favourites)
        }
    }
}
