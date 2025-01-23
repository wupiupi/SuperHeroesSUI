//
//  HeroesListView.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 23.01.25.
//

import Foundation

struct HeroesListView: View {
    let store: Store<HeroesListState, HeroesListAction>
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                List(viewStore.heroes.filter { hero in
                    viewStore.searchTerm.isEmpty || hero.name.localizedCaseInsensitiveContains(viewStore.searchTerm)
                }) { hero in
                    Text(hero.name)
                }
                .navigationTitle("Heroes")
                .searchable(text: viewStore.binding(
                    get: \HeroesListState.searchTerm,
                    send: HeroesListAction.search
                ))
            }
            .onAppear {
                viewStore.send(.fetchHeroes)
            }
        }
    }
}
