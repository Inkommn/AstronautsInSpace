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

extension AstronautData {
    init?(from astronautData: [String: Any]) {
        guard let number = astronautData["number"] as? Int,
              let peopleData = astronautData["people"] as? [[String: Any]] else {
            return nil
        }

        let people = peopleData.compactMap { Person(from: $0) }
        self.init(number: number, people: people)
    }
}

extension Person {
    init?(from astronautData: [String: Any]) {
        guard let name = astronautData["name"] as? String,
              let craft = astronautData["craft"] as? String else {
            return nil
        }
        self.init(name: name, craft: craft)
    }
}
