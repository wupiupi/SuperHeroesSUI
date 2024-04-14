//
//  HeroImageView.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 14.04.24.
//

import SwiftUI

struct HeroImageView: View {
    let imageURL: URL
    let radius: CGFloat
    
    var body: some View {
        AsyncImage(url: imageURL) { image in
            image
                .resizable()
                .clipShape(Circle())
                .frame(width: radius)
            
        } placeholder: {
            Circle()
                .foregroundStyle(.gray)
                .frame(width: radius)
        }
    }
}

#Preview {
    HeroImageView(
        imageURL: "https://www.memeatlas.com/images/wojaks/wojak-npc-bitcoin-helmet.jpg".url(),
        radius: 250
    )
}
