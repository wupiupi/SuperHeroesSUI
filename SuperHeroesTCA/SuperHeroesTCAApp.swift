//
//  SuperHeroesTCAApp.swift .swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 23.01.25.
//

import Foundation

@main
struct SuperHeroesTCAApp: App {
    let store = Store(
        initialState: AppState(),
        reducer: appReducer,
        environment: AppEnvironment(
            networkManager: NetworkManager.shared
        )
    )
    var body: some Scene {
        WindowGroup {
            TabView {
                FavoritesView(store: store.scope(
                    state: \AppState.favorites,
                    action: AppAction.favorites
                ))
                .tabItem { Label("Favorites", systemImage: "star") }

                HeroesListView(store: store.scope(
                    state: \AppState.heroesList,
                    action: AppAction.heroesList
                ))
                .tabItem { Label("Heroes", systemImage: "figure.roll") }
            }
        }
    }
}
