//
//  HeroDetailsView.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 13.04.24.
//

import SwiftUI

struct HeroDetailsView: View {
    @EnvironmentObject private var viewModel: ViewModel
    let hero: SuperheroInfo
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                VStack {
                    HeroImageView(
                        imageURL: (hero.images?.sm?.url())!,
                        radius: 250
                    )
                    
                    Divider()
                    
                    HeroInfoView(hero: hero)
                }
            }
            .navigationTitle(hero.name ?? "")
        }
        .padding()
    }
}

// MARK: - Hero Info View
struct HeroInfoView: View {
    let hero: SuperheroInfo
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Biography")
                .font(.title)
                .fontWeight(.black)
            
            Divider()
            
            Text("""
            Full name: \(hero.biography?.fullName ?? "")
            Alter egos: \(hero.biography?.alterEgos ?? "")
            First appearance: \(hero.biography?.firstAppearance ?? "")
            Place of birth: \(hero.biography?.placeOfBitrh ?? "")
            """)
            .font(.title3)
            .foregroundStyle(.secondary)
            
            Divider()
            
            Text("Appearance")
                .font(.title)
                .fontWeight(.black)
            
            Divider()
            
            Text("""
                Eye color: \(hero.appearance?.eyeColor ?? "")
                Hair color: \(hero.appearance?.hairColor ?? "")
                Gender: \(hero.appearance?.gender ?? "")
                Race: \(hero.appearance?.race ?? "")
                """)
            .font(.title3)
            .foregroundStyle(.secondary)
            
            Divider()
            
            Text("Powerstats")
                .font(.title)
                .fontWeight(.black)
            
            Divider()
            
            Text("""
            Combat: \(hero.powerstats?.combat ?? 0)
            Durability: \(hero.powerstats?.durability ?? 0)
            Intelligence: \(hero.powerstats?.intelligence ?? 0)
            Power: \(hero.powerstats?.power ?? 0)
            Speed: \(hero.powerstats?.speed ?? 0)
            Strength: \(hero.powerstats?.strength ?? 0)
            """)
            .font(.title3)
            .foregroundStyle(.secondary)
        }
    }
}

// MARK: - Preview
#Preview {
    HeroDetailsView(hero: SuperheroInfo.getMockSuperHero())
}
