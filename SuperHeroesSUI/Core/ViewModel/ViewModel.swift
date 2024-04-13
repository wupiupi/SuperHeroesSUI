//
//  ViewModel.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 13.04.24.
//

import Foundation

final class ViewModel: ObservableObject {
    @Published var heroes: [SuperheroInfo] = []
    
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
    
    func getPlaceholderImageName() -> String {
        let imageNumber = Int.random(in: 0...70)
        return "temp\(imageNumber)"
    }
}
