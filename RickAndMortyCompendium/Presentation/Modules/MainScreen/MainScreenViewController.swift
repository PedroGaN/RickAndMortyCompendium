//
//  MainScreenViewController.swift
//  RickAndMortyCompendium
//
//  Created by pedro.garcia.local on 23/1/23.
//

import Foundation
import UIKit

protocol MainScreenViewControllerProtocol: BaseViewProtocol {
    func setTableCharactersInfo(_ info: [CharacterInfoCellViewModel]?)
}

class MainScreenViewController: BaseViewController<MainScreenPresenterProtocol> {
    
    // MARK: - Internal Properties
    
    var charactersTableDataSource: CharactersDataSource?
    
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
        setNoDataVisibility()
        backgroundImageView.image = UIImage(named: "img_location")
        fetchMenuView.setDelegate(self)
        tableMenuView.setDelegate(self)
    }
    
    // MARK: - Overriden BaseViewProtocol
    
    override func showLoading() {
        super.showLoading()
        view.isUserInteractionEnabled = false
    }
    
    override func hideLoading() {
        super.hideLoading()
        view.isUserInteractionEnabled = true
    }
    
    // MARK: - Private Methods
    
    private func setNoDataVisibility() {
        emptyListView.isHidden = false
        tableMenuView.isHidden = true
        fetchedInfoTableView.isHidden = true
    }
    
    // MARK: - Internal Methods
    
    func setFetchedDataVisibility() {
        emptyListView.isHidden = true
        //tableMenuView.isHidden = false
        fetchedInfoTableView.isHidden = false
    }
    
    func setupTableForCharactersData(withCharacterDataSource dataSource: CharactersDataSource?) {
        fetchedInfoTableView.register(CharacterInfoCell.nib, forCellReuseIdentifier: CharacterInfoCell.identifier)
        fetchedInfoTableView.dataSource = charactersTableDataSource
        fetchedInfoTableView.delegate = charactersTableDataSource
        fetchedInfoTableView.reloadData()
    }
    
}
