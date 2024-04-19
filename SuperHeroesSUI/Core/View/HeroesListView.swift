//
//  HeroesListView.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 13.04.24.
//

import SwiftUI

struct HeroesListView: View {
    @EnvironmentObject private var viewVM: ViewModel
    @State private var searchTerm = ""
        
    private var filteredHeroes: [SuperheroInfo] {
        guard !searchTerm.isEmpty else { return viewVM.heroes }
        return viewVM.heroes.filter { $0.name.localizedCaseInsensitiveContains(searchTerm) }
    }
    
    var body: some View {
        NavigationStack {
            if !viewVM.heroes.isEmpty {
                List(filteredHeroes) { hero in
                    NavigationLink(destination: HeroDetailsView(hero: hero)) {
                        HeroCellView(hero: hero)
                    }
                    
                }
                .navigationTitle("Heroes")
            } else {
                ConnectionLostView()
            }
        }
        .listStyle(.plain)
        .searchable(text: $searchTerm, prompt: "Search Heroes")
        .padding()
    }
}

struct ConnectionLostView: View {
    var body: some View {
        VStack {
            Image("ConnectionLost", bundle: nil)
                .resizable()
                .frame(width: 250, height: 250)
            
            Text("Please, check your internet connection, skuf")
                .font(.title)
        }
    }
}
