//
//  HeroCellView.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 13.04.24.
//

import SwiftUI

struct HeroCellView: View {
    @EnvironmentObject private var viewModel: ViewModel
    let hero: SuperheroInfo
    
    var body: some View {
        HStack {
            AsyncImage(url: hero.images?.md?.url()) { image in
                    image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                    .clipShape(Circle())
            } placeholder: {
                Image(viewModel.getPlaceholderImageName(), bundle: nil)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                    .clipShape(Circle())
            }
            
            Text(hero.name ?? "")
                .font(.title)
                .padding(.leading, 10)
        }
    }
}

#Preview {
    HeroCellView(
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
        )
    )
}
