//
//  NetworkManager.swift
//  AstronautsInSpace
//
//  Created by Shamkhan Mutuskhanov on 17.07.2023.
//

import Foundation

enum Link: String {
    case astronautsDataUrl = "http://api.open-notify.org/astros.json"
}

enum NetworkError: Error {
    case noData
    case invalidUrl
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetch<T: Decodable>(_ type: T.Type, from url: String, completion: @escaping (Result<T, NetworkError>)-> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error desctiption")
                return
            }
            
            do {
                let type = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(type))
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

