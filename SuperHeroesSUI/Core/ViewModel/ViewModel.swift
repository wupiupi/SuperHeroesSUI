//
//  ViewModel.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 13.04.24.
//

import Foundation

final class ViewModel: ObservableObject {
    @Published var heroes: [SuperheroInfo] = []
    @Published var favoriteHeroes: [SuperheroInfo] = []
        
    init() {
        fetchData()
    }
    
    private let networkManager = NetworkManager.shared
    
    func fetchData() {
        networkManager.fetchData(fromURL: Link.allHeroes.url) { result in
            switch result {
                case .success(let heroes):
                    self.heroes = heroes
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    func toggleFavoriteHero(_ hero: SuperheroInfo) {
        checkIsHeroFavorite(hero)
        ? favoriteHeroes.removeAll { $0.name == hero.name }
        : favoriteHeroes.append(hero)
    }
    
    func checkIsHeroFavorite(_ hero: SuperheroInfo) -> Bool {
        favoriteHeroes.contains(where: { $0.id == hero.id })
    }
}

