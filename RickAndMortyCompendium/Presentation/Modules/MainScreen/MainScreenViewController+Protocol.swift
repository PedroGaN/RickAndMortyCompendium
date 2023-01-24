//
//  MainScreenViewController+Protocol.swift
//  RickAndMortyCompendium
//
//  Created by pedro.garcia.local on 24/1/23.
//

import Foundation
import UIKit

extension MainScreenViewController: MainScreenViewControllerProtocol {
    
    // MARK: - Protocol
    
    func setTableCharactersInfo(_ info: [CharacterInfoCellViewModel]?) {
        if !(info?.isEmpty ?? true) {
            setFetchedDataVisibility()
            if let _ = charactersTableDataSource {
                charactersTableDataSource?.setData(info)
                setupTableForCharactersData(withCharacterDataSource: charactersTableDataSource)
            } else {
                charactersTableDataSource = CharactersDataSource()
                setTableCharactersInfo(info)
            }
        } else {
            
        }
    }
    
}
