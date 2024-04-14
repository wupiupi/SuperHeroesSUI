//
//  HeroesView.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 13.04.24.
//

import SwiftUI

struct HeroesView: View {
    @EnvironmentObject private var viewVM: ViewModel
    @State private var searchTerm = ""
    
    private var heroes: [SuperheroInfo] {
        viewVM.heroes
    }
    
    private var filteredHeroes: [SuperheroInfo] {
        guard !searchTerm.isEmpty else { return heroes }
        return heroes.filter { $0.name.localizedCaseInsensitiveContains(searchTerm) }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredHeroes) { hero in
                NavigationLink(destination: HeroDetailsView(hero: hero)) {
                    HeroCellView(hero: hero)
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("Heroes")
        }
        .searchable(text: $searchTerm, prompt: "Search Heroes")
        .padding()
    }
}

#Preview {
    HeroesView()
}
