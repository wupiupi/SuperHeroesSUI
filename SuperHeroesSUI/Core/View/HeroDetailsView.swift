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
                    AsyncImage(url: hero.images?.lg?.url()) { image in
                        image
                            .resizable()
                            .frame(width: 250, height: 250)
                            .clipShape(Circle())
                        
                    } placeholder: {
                        Image(viewModel.getPlaceholderImageName(), bundle: nil)
                    }
                    
                    Divider()
                    
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
                        
                        VStack(alignment: .leading) {
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
                        }
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
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
                    .padding(.top, 20)
                }
            }
            .navigationTitle(hero.name ?? "")
        }
        .padding()
    }
}

#Preview {
    HeroDetailsView(
        hero: SuperheroInfo(
            id: 1,
            name: "Pablo",
            powerstats: Powerstat(
                intelligence: 100,
                strength: 100,
                speed: 100,
                durability: 100,
                power: 100,
                combat: 100
            ),
            appearance: Appearance(
                gender: "Man",
                race: "Human",
                height: ["100"],
                weight: ["100"],
                eyeColor: "Black",
                hairColor: "Black"
            ),
            biography: Biography(
                fullName: "Pablo",
                alterEgos: "Pablo",
                placeOfBitrh: "Minsk",
                firstAppearance: "Minsk",
                publisher: "Belarus",
                alignment: "left"
            ),
            images: ImageQuality(
                xs: "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/images/xs/1-a-bomb.jpg",
                sm: "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/images/sm/1-a-bomb.jpg",
                md: "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/images/md/1-a-bomb.jpg",
                lg: "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/images/lg/1-a-bomb.jpg"
            )
        ))
}
