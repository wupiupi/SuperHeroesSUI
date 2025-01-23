//
//  AppReducer.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 23.01.25.
//

import Foundation

let appReducer = Reducer<AppState, AppAction, AppEnvironment>.combine(
    heroesListReducer.pullback(
        state: \AppState.heroesList,
        action: /AppAction.heroesList,
        environment: { HeroesListEnvironment(networkManager: $0.networkManager) }
    ),
    favoritesReducer.pullback(
        state: \AppState.favorites,
        action: /AppAction.favorites,
        environment: { FavoritesEnvironment() }
    )
)
