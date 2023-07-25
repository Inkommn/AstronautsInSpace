//
//  NetworkManager.swift
//  AstronautsInSpace
//
//  Created by Shamkhan Mutuskhanov on 17.07.2023.
//

import Foundation
import Alamofire

enum Link: String {
    case astronautsDataUrl = "http://api.open-notify.org/astros.json"
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchAstronautData(from url: String, completion: @escaping (Result<AstronautData, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    guard let json = value as? [String: Any] else { return }
                    
                    if let astronautData = AstronautData(from: json) {
                        completion(.success(astronautData))
                    }
                case .failure(let error):
                    completion(.failure(error))
                    
                }
            }
    }
}

