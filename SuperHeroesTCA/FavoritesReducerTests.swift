//
//  FavoritesReducerTests.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 23.01.25.
//

import Foundation
import XCTest
import ComposableArchitecture

final class FavoritesReducerTests: XCTestCase {
    func testToggleFavorite() {
        let store = TestStore(
            initialState: FavoritesState(),
            reducer: favoritesReducer,
            environment: FavoritesEnvironment()
        )

        let hero = SuperheroInfo.getMockSuperHero()

        // Add hero to favorites
        store.send(.toggleFavorite(hero)) {
            $0.favoriteHeroes = [hero]
        }

        // Remove hero from favorites
        store.send(.toggleFavorite(hero)) {
            $0.favoriteHeroes = []
        }
    }
}
