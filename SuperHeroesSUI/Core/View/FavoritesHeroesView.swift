//
//  FavoritesHeroesView.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 15.04.24.
//

import SwiftUI

struct FavoritesHeroesView: View {
    @EnvironmentObject private var viewVM: ViewModel
    
    var body: some View {
        NavigationStack {
            List(viewVM.favoriteHeroes) { hero in
                NavigationLink(destination: HeroDetailsView(hero: hero)) {
                    HeroCellView(hero: hero)
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("Heroes")
        }
    }
}

#Preview {
    FavoritesHeroesView()
}
