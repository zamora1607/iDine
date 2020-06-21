//
//  FavouritesView.swift
//  iDine
//
//  Created by Ania on 21/06/2020.
//  Copyright © 2020 Zamora. All rights reserved.
//

import SwiftUI

struct FavouritesView: View {
    @EnvironmentObject var favourites: Favourites
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(favourites.items) { item in
                        ItemRow(item: item)
                    }
                }
            }.navigationBarTitle("Favourites")
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static let favourites = Favourites()
    static var previews: some View {
        FavouritesView().environmentObject(favourites)
    }
}
