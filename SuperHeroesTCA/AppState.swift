//
//  AppState.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 23.01.25.
//

import Foundation

struct AppState: Equatable {
    var heroesList = HeroesListState()
    var favorites = FavoritesState()
}
