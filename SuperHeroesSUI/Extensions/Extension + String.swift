//
//  Extension + String.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 13.04.24.
//

import Foundation

extension String {
    func url() -> URL {
        URL(string: self)!
    }
}
