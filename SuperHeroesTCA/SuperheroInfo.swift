//
//  SuperheroInfo.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 23.01.25.
//

import Foundation

struct SuperheroInfo: Decodable, Identifiable, Equatable {
    let id: Int
    let name: String
    let powerstats: Powerstat?
    let appearance: Appearance?
    let biography: Biography?
    let images: ImageQuality?

    static func getMockSuperHero() -> SuperheroInfo {
        SuperheroInfo(
            id: 1,
            name: "Spider-Man",
            powerstats: Powerstat(intelligence: 85, strength: 55, speed: 67, durability: 75, power: 74, combat: 90),
            appearance: Appearance(gender: "Male", race: "Human", height: ["5'10", "178 cm"], weight: ["165 lb", "75 kg"], eyeColor: "Hazel", hairColor: "Brown"),
            biography: Biography(fullName: "Peter Parker", alterEgos: "No alter egos found.", placeOfBitrh: "New York City", firstAppearance: "Amazing Fantasy #15", publisher: "Marvel Comics", alignment: "good"),
            images: ImageQuality(xs: "", sm: "", md: "", lg: "")
        )
    }
}

struct Powerstat: Decodable, Equatable {
    let intelligence, strength, speed, durability, power, combat: Int
}

struct Appearance: Decodable, Equatable {
    let gender, race: String?
    let height, weight: [String]?
    let eyeColor, hairColor: String?
}

struct Biography: Decodable, Equatable {
    let fullName, alterEgos, placeOfBitrh, firstAppearance, publisher, alignment: String?
}

struct ImageQuality: Decodable, Equatable {
    let xs, sm, md, lg: String?
}
