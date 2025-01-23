//
//  FavoritesReducer.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 23.01.25.
//

import Foundation

let favoritesReducer = Reducer<FavoritesState, FavoritesAction, FavoritesEnvironment> { state, action, _ in
    switch action {
    case let .toggleFavorite(hero):
        if let index = state.favoriteHeroes.firstIndex(where: { $0.id == hero.id }) {
            state.favoriteHeroes.remove(at: index)
        } else {
            state.favoriteHeroes.append(hero)
        }
        return .none
    }
}
