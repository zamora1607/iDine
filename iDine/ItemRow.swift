//
//  ItemRow.swift
//  iDine
//
//  Created by Ania on 20/06/2020.
//  Copyright © 2020 Zamora. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    static let color: [String: Color] = ["V": .green, "G": .black, "D": .purple, "N": .red, "S": .blue]
    var item: MenuItem
    var body: some View {
        NavigationLink(destination: ItemDetails(item: item)){
            HStack {
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text("$\(item.price)")
                }.layoutPriority(1)
                
                Spacer()
                
                //string inself as identifier (cannot add protocol Identifiable)
                ForEach(item.restrictions, id: \.self) { restriction in
                    Text(restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(Self.color[restriction, default: .black])
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
