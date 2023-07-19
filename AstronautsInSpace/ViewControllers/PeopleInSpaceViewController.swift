//
//  MainViewController.swift
//  AstronautsInSpace
//
//  Created by Shamkhan Mutuskhanov on 13.07.2023.
//

import UIKit

final class PeopleInSpaceViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var peopleInSpaceIndicator: UIActivityIndicatorView!
    @IBOutlet var astronautsLabel: UILabel!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        peopleInSpaceIndicator.hidesWhenStopped = true
        peopleInSpaceIndicator.startAnimating()
        getNumberOfPeopleInSpace()
    }
    
    // MARK: - Private methods
   private func getNumberOfPeopleInSpace() {
        NetworkManager.shared.fetch(AstronautData.self, from: Link.astronautsDataUrl.rawValue) { [weak self] result in
            switch result {
            case .success(let astronautsNumber):
                self?.astronautsLabel.text = String(astronautsNumber.people.count)
                self?.peopleInSpaceIndicator.stopAnimating()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

