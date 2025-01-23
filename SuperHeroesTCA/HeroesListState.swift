//
//  HeroesListState.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 23.01.25.
//

import Foundation

struct HeroesListState: Equatable {
    var heroes: [SuperheroInfo] = []
    var searchTerm: String = ""
}
