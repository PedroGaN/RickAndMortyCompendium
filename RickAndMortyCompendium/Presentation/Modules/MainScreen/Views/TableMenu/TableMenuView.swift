//
//  TableMenuView.swift
//  RickAndMortyCompendium
//
//  Created by pedro.garcia.local on 23/1/23.
//

import Foundation
import UIKit

protocol TableMenuViewDelegate: AnyObject {
    func handleApplySearchOptions(withOptions options: [Constants.SearchOptionType:String])
}

class TableMenuView: BaseView {
    
    // MARK: - Private Properties
    
    private weak var delegate: TableMenuViewDelegate?
    
    // MARK: - IBOutlets
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var searchMenuView: UIView!
    @IBOutlet weak var searchNameTextField: UITextField!
    @IBOutlet weak var searchStatusTextField: UITextField!
    @IBOutlet weak var searchSpeciesTextField: UITextField!
    @IBOutlet weak var searchGenderTextField: UITextField!
    
    // MARK: - Overriden Methods
    
    override func nibSetup() {
        if !setupView(nibName: String(describing: TableMenuView.self)).isNil() {
            setupUI()
            localizable()
        }
    }
    
    // MARK: - Public Methods
    
    public func setDelegate(_ delegate: TableMenuViewDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        setCorners(corners: ViewContants.corner.down, radius: ViewContants.cornerRadius.eight)
        applyButton.isHidden = true
        searchMenuView.isHidden = true
    }
    
    private func localizable() {
        searchButton.setTitle(string: "table_menu_search".localized)
        applyButton.setTitle(string: "table_menu_apply".localized)
        searchNameTextField.placeholder = "table_menu_search_name".localized
        searchStatusTextField.placeholder = "table_menu_search_status".localized
        searchSpeciesTextField.placeholder = "table_menu_search_species".localized
        searchGenderTextField.placeholder = "table_menu_search_gender".localized
    }
    
    private func getSearchOptions() -> [Constants.SearchOptionType:String] {
        var searchOptions: [Constants.SearchOptionType:String] = [:]
        if let name = searchNameTextField.getText() { searchOptions[.name] = name }
        if let status = searchNameTextField.getText() { searchOptions[.status] = status }
        if let species = searchNameTextField.getText() { searchOptions[.species] = species }
        if let gender = searchNameTextField.getText() { searchOptions[.gender] = gender }
        return searchOptions
        
    }
    
    // MARK: - IBActions
    
    @IBAction func applySearchOptionsAction(_ sender: Any) {
        delegate?.handleApplySearchOptions(withOptions: getSearchOptions())
    }
    
}
