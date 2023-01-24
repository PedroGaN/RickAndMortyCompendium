//
//  CharactersDataSource.swift
//  RickAndMortyCompendium
//
//  Created by pedro.garcia.local on 24/1/23.
//

import UIKit

class CharactersDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Private Properties
    
    private var characters: [CharacterInfoCellViewModel]? = nil
    
    override init() {
        super.init()
    }
    
    /// If one text is NSAttributedString all text need to be of that class
    func setData(_ characters: [CharacterInfoCellViewModel]?) {
        if let _ = characters {
            self.characters = characters
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /// If you are going to work with this DataSource you have to add the tag of the controlled tables. You have to do this calling the setData method
        if let rowQty = characters?.count {
            return rowQty
        } else { return .zero }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterInfoCell.identifier) as? CharacterInfoCell ?? CharacterInfoCell()
        if let characters = characters {
            cell.bind(withModel: characters[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.3) {
            tableView.performBatchUpdates(nil)
        }
    }
    
}
