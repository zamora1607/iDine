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
            print("action")
        }) {
            HStack {
                Image(systemName: "heart")
                .padding(2)
                    .foregroundColor(.red)
            }
        }
    }
}

struct ItemDetails_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        NavigationView {
            ItemDetails(item: MenuItem.example).environmentObject(order)
        }
    }
}
