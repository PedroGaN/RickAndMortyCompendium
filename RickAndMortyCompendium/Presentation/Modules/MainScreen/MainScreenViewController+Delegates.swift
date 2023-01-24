//
//  MainScreenViewController+Delegates.swift
//  RickAndMortyCompendium
//
//  Created by pedro.garcia.local on 23/1/23.
//

import Foundation
import UIKit

// MARK: - FetchMenuViewDelegate

extension MainScreenViewController: FetchMenuViewDelegate {
    
    func handleFetchData(for type: Constants.FetchType) {
        getPresenter()?.handleFetchData(for: type)
    }
    
}

// MARK: - TableMenuViewDelegate

extension MainScreenViewController: TableMenuViewDelegate {
    
    func handleApplySearchOptions(withOptions options: [Constants.SearchOptionType : String]) {
        getPresenter()?.handleSearchOption(withOptions: options)
    }
    
}
