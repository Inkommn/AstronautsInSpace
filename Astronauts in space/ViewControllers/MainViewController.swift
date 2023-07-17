//
//  MainViewController.swift
//  Astronauts in space
//
//  Created by Shamkhan Mutuskhanov on 13.07.2023.
//

import UIKit

struct AstronautData: Codable {
    let number: Int
    let people: [Person]
    let message: String
}

struct Person: Codable {
    let name: String
    let craft: String
}


final class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getPeopleInSpace() {
        guard let url = URL(string: "http://api.open-notify.org/astros.json") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Error 418")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let astronautData = try decoder.decode(AstronautData.self, from: data)
                print("People: \(astronautData.number), Massage: \(astronautData.message)")
                
                astronautData.people.forEach {
                    print($0)
                }
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    @IBAction func peopleInSpaceButtonTapped() {
        getPeopleInSpace()
    }
}

