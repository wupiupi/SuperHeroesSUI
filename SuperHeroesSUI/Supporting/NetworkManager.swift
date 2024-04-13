//
//  NetworkManager.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 13.04.24.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case noErrorDescription
    case noData
    
    var description: String {
        switch self {
            case .decodingError:
                "Decoding error was occured"
            case .noErrorDescription:
                "No error description"
            case .noData:
                "No data"
        }
    }
}

enum Link {
    case allHeroes
    
    var url: URL {
        switch self {
            case .allHeroes:
                URL(string: "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.2.0/api/all.json")!
        }
    }
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(fromURL url: URL, completion: @escaping(Result<[SuperheroInfo], Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error ?? "No error description")
                return
            }
            
            do {
                let encodedData = try JSONDecoder().decode([SuperheroInfo].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(encodedData))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
