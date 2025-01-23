//
//  HeroesListAction.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 23.01.25.
//

import Foundation

enum HeroesListAction: Equatable {
    case fetchHeroes
    case fetchHeroesResponse(Result<[SuperheroInfo], NetworkError>)
    case search(String)
}
