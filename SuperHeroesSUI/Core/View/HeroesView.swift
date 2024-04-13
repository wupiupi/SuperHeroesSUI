//
//  HeroesView.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 13.04.24.
//

import SwiftUI

struct HeroesView: View {
    @EnvironmentObject private var viewVM: ViewModel
    
    private var heroes: [SuperheroInfo] {
        viewVM.heroes
    }
    
    var body: some View {
        NavigationStack {
            List(heroes) { hero in
                NavigationLink(destination: HeroDetailsView(hero: hero)){
                    HeroCellView(hero: hero)
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("Heroes")
        }
        .padding()
    }
}

#Preview {
    HeroesView()
}
