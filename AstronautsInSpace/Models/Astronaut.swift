//
//  Astronaut.swift
//  AstronautsInSpace
//
//  Created by Shamkhan Mutuskhanov on 17.07.2023.
//

struct AstronautData: Codable {
    let number: Int
    let people: [Person]
}

struct Person: Codable {
    let name: String
    let craft: String
}
