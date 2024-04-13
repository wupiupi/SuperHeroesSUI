//
//  Hero.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 13.04.24.
//

import Foundation

struct SuperheroInfo: Decodable, Identifiable {
    let id: Int
    let name: String?
    let powerstats: Powerstat?
    let appearance: Appearance?
    let biography: Biography?
    let images: ImageQuality?
}

// MARK: - Appearance
struct Appearance: Decodable {
    let gender, race: String?
    let height, weight: [String]?
    let eyeColor, hairColor: String?
}

// MARK: - Biography
struct Biography: Decodable {
    let fullName, alterEgos: String?
    let placeOfBitrh, firstAppearance, publisher, alignment: String?
}

// MARK: - ImageQuality
struct ImageQuality: Decodable {
    let xs: String?
    let sm: String?
    let md: String?
    let lg: String?
}

// MARK: - Powerstat
struct Powerstat: Decodable {
    let intelligence, strength, speed, durability: Int?
    let power, combat: Int?
}

