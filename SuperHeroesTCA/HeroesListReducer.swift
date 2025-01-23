//
//  HeroesListReducer.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 23.01.25.
//

import Foundation

let heroesListReducer = Reducer<HeroesListState, HeroesListAction, HeroesListEnvironment> { state, action, environment in
    switch action {
    case .fetchHeroes:
        return environment.networkManager.fetchHeroes()
            .receive(on: DispatchQueue.main)
            .catchToEffect()
            .map(HeroesListAction.fetchHeroesResponse)

    case let .fetchHeroesResponse(.success(heroes)):
        state.heroes = heroes
        return .none

    case let .fetchHeroesResponse(.failure(error)):
        print("Error fetching heroes: \(error)")
        return .none

    case let .search(term):
        state.searchTerm = term
        return .none
    }
}
