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
                Circle()
                    .foregroundStyle(.gray)
                    .frame(width: 50)
            }
            
            Text(hero.name)
                .font(.title)
                .padding(.leading, 10)
        }
    }
}

#Preview {
    HeroCellView(hero: SuperheroInfo.getMockSuperHero())
}
