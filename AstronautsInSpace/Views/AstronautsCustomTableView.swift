//
//  AstronautsCustomTableView.swift
//  NetworkingHW
//
//  Created by Shamkhan Mutuskhanov on 18.07.2023.
//

import UIKit

final class AstronautsCustomTableView: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet var spaceStationLogo: UIImageView!
    @IBOutlet var astronautNameLabel: UILabel!
    @IBOutlet var astronautCraftLabel: UILabel!
    
    // MARK: - Public methods
    func configure(with person: Person) {
        astronautNameLabel.text = person.name
        
        switch person.craft {
        case "ISS":
            spaceStationLogo.image = UIImage(named: "ISS")
            astronautCraftLabel.text = "International Space Station"
        case "Tiangong":
            spaceStationLogo.image = UIImage(named: "Tiangong")
            astronautCraftLabel.text = person.craft
        default:
            break
        }
    }
}
