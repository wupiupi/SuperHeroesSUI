//
//  Link.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 23.01.25.
//

import Foundation

enum Link {
    case allHeroes

    var url: URL {
        switch self {
        case .allHeroes:
            return URL(string: "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.2.0/api/all.json")!
        }
    }
}
