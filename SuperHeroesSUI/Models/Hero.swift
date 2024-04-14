//
//  Hero.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 13.04.24.
//

import Foundation

struct SuperheroInfo: Decodable, Identifiable {
    let id: Int
    let name: String
    let powerstats: Powerstat?
    let appearance: Appearance?
    let biography: Biography?
    let images: ImageQuality?
    
    static func getMockSuperHero() -> SuperheroInfo {
        SuperheroInfo(
            id: 618,
            name: "Spider-Girl",
            powerstats: Powerstat.getMockPowestat(),
            appearance: Appearance.getMockAppearance(),
            biography: Biography.getMockBiography(),
            images: ImageQuality.getMockImageQuality()
        )
    }
}

// MARK: - Appearance
struct Appearance: Decodable {
    let gender, race: String?
    let height, weight: [String]?
    let eyeColor, hairColor: String?
    
    static func getMockAppearance() -> Appearance {
        Appearance(
            gender: "Female",
            race: "Human",
            height: ["5'7", "170 cm"],
            weight: ["119 lb", "54 kg"],
            eyeColor: "Blue",
            hairColor: "Brown"
        )
    }
}

// MARK: - Biography
struct Biography: Decodable {
    let fullName, alterEgos: String?
    let placeOfBitrh, firstAppearance, publisher, alignment: String?
    
    static func getMockBiography() -> Biography {
        Biography(
            fullName: "May 'Mayday' Parker",
            alterEgos: "No alter egos found.",
            placeOfBitrh: "New York City, New York",
            firstAppearance: "What If? Vol 2 #105 (February, 1998)",
            publisher: "Marvel Comics",
            alignment: "good"
        )
    }
}

// MARK: - ImageQuality
struct ImageQuality: Decodable {
    let xs: String?
    let sm: String?
    let md: String?
    let lg: String?
    
    static func getMockImageQuality() -> ImageQuality {
        ImageQuality(
            xs: "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/images/xs/618-spider-girl.jpg",
            sm: "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/images/sm/618-spider-girl.jpg",
            md: "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/images/md/618-spider-girl.jpg",
            lg: "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/images/lg/618-spider-girl.jpg"
        )
    }
}

// MARK: - Powerstat
struct Powerstat: Decodable {
    let intelligence, strength, speed, durability: Int?
    let power, combat: Int?
    
    static func getMockPowestat() -> Powerstat {
        Powerstat(
            intelligence: 100,
            strength: 100,
            speed: 100,
            durability: 100,
            power: 100,
            combat: 100
        )
    }
}

