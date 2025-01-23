//
//  HeroesListReducerTests.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 23.01.25.
//

import Foundation
import XCTest
import ComposableArchitecture

final class HeroesListReducerTests: XCTestCase {
    func testFetchHeroesSuccess() {
        let mockNetworkManager = NetworkManagerMock(fetchResult: .success([SuperheroInfo.getMockSuperHero()]))
        let store = TestStore(
            initialState: HeroesListState(),
            reducer: heroesListReducer,
            environment: HeroesListEnvironment(networkManager: mockNetworkManager)
        )

        store.send(.fetchHeroes)

        store.receive(.fetchHeroesResponse(.success([SuperheroInfo.getMockSuperHero()]))) {
            $0.heroes = [SuperheroInfo.getMockSuperHero()]
        }
    }

    func testSearchHeroes() {
        let state = HeroesListState(heroes: [SuperheroInfo.getMockSuperHero()])
        let store = TestStore(
            initialState: state,
            reducer: heroesListReducer,
            environment: HeroesListEnvironment(networkManager: NetworkManagerMock(fetchResult: .success([])))
        )

        store.send(.search("Spider")) {
            $0.searchTerm = "Spider"
        }
    }
}
