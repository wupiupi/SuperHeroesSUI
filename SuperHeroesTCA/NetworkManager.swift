//
//  NetworkManager.swift
//  SuperHeroesSUI
//
//  Created by Paul Makey on 23.01.25.
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
