//
//  AstronautsTableViewController.swift
//  NetworkingHW
//
//  Created by Shamkhan Mutuskhanov on 18.07.2023.
//

import UIKit

final class AstronautsTableViewController: UITableViewController {
    
    // MARK: - Private properties
    private var astronautsData: AstronautData?
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAstronautsData()
        tableView.rowHeight = 150
        tableView.separatorStyle = .none
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        astronautsData?.people.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        guard let cell = cell as? AstronautsCustomTableView else { return UITableViewCell() }
        guard let astronaut = astronautsData?.people[indexPath.row] else { return UITableViewCell() }
        
        cell.configure(with: astronaut)
        return cell
    }
}

    // MARK: - API
extension AstronautsTableViewController {
    private func getAstronautsData() {
        NetworkManager.shared.fetch(AstronautData.self, from: Link.astronautsDataUrl.rawValue) { [weak self] result in
            switch result {
            case .success(let astronautsInfo):
                self?.astronautsData = astronautsInfo
                self?.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
   
