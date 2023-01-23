//
//  MainScreenViewController.swift
//  RickAndMortyCompendium
//
//  Created by pedro.garcia.local on 23/1/23.
//

import Foundation
import UIKit

protocol MainScreenViewControllerProtocol: BaseViewProtocol {}

class MainScreenViewController: BaseViewController<MainScreenPresenterProtocol>, MainScreenViewControllerProtocol {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    /// Table Menu Section
    @IBOutlet weak var tableMenuView: TableMenuView!
    /// Fetch Menu Section
    @IBOutlet weak var fetchMenuView: FetchMenuView!
    /// Fetched Info Table Section
    @IBOutlet weak var emptyListView: UIView!
    @IBOutlet weak var fetchedInfoTableView: UITableView!
    
    // MARK: - Overriden Methods
    
    override func setupUI() {
        setupInitialVisibility()
        backgroundImageView.image = UIImage(named: "img_location")
        fetchMenuView.setDelegate(self)
        tableMenuView.setDelegate(self)
    }
    
    // MARK: - Private Methods
    
    private func setupInitialVisibility() {
        tableMenuView.isHidden = true
        emptyListView.isHidden = false
        fetchedInfoTableView.isHidden = false
    }
    
}
