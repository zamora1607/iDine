//
//  FavouritesView.swift
//  iDine
//
//  Created by Ania on 21/06/2020.
//  Copyright © 2020 Zamora. All rights reserved.
//

import SwiftUI

struct FavouritesView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    static let favouritesIndexes = [0, 11, 14, 20, 7]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(0 ..< Self.favouritesIndexes.count) { index in
                        Text("Do something with sections")
                    }
                }
            }.navigationBarTitle(Text("Favourites"), displayMode: .inline)
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
