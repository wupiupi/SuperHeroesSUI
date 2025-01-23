//
//  FavoritesView.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 23.01.25.
//

import Foundation

struct FavoritesView: View {
    let store: Store<FavoritesState, FavoritesAction>
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                List(viewStore.favoriteHeroes) { hero in
                    Text(hero.name)
                }
                .navigationTitle("Favorites")
            }
        }
    }
}
