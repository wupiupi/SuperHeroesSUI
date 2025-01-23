//
//  AppAction.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 23.01.25.
//

import Foundation

enum AppAction: Equatable {
    case heroesList(HeroesListAction)
    case favorites(FavoritesAction)
}
