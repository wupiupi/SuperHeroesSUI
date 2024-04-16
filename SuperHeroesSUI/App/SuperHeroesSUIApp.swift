//
//  SuperHeroesSUIApp.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 13.04.24.
//

import SwiftUI

@main
struct SuperHeroesSUIApp: App {
    @StateObject private var contentViewVM = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                FavoritesHeroesView()
                    .tabItem {
                        Label("Favorites", systemImage: "star")
                    }
                HeroesListView()
                    .tabItem {
                        Label("Heroes", systemImage: "figure.roll")
                    }
            }
            .environmentObject(contentViewVM)
        }
    }
}
