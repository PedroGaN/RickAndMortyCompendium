//
//  MainScreenPresenter.swift
//  RickAndMortyCompendium
//
//  Created by pedro.garcia.local on 23/1/23.
//

import Foundation

protocol MainScreenPresenterProtocol: BasePresenterProtocol {
    func handleFetchData(for type: Constants.FetchType)
    func handleSearchOption(withOptions: [Constants.SearchOptionType:String])
}

class MainScreenPresenter: BasePresenter<MainScreenViewControllerProtocol, MainWireframeProtocol>,
                           MainScreenPresenterProtocol {
    
    // MARK: - Private Properties
    
    //let fetchCharactersInteractor: FetchCharactersInteractor
    
    // MARK: - Initializer
    
    init(view: MainScreenViewControllerProtocol,
         router: MainWireframeProtocol) {
         fetchCharactersInteractor: FetchCharactersInteractor) {
        self.fetchCharactersInteractor = fetchCharactersInteractor
        super.init(view: view, router: router)
    }
    
    // MARK: - Private Methods
    
    private func handleFetchCharacters() {
        fetchCharactersInteractor.execute(onSuccess: { [weak self] characters in
            print(characters)
        }, onFailure: { [weak self] error in
            print(error)
        }).disposed(by: self.disposeBag)
    }
    
    // MARK: - Protocol
    
    func handleFetchData(for type: Constants.FetchType) {
        switch type {
        case .characters:
            handleFetchCharacters()
        case .locations: print("Locations")
        case .episodes: print("Episodes")
        }
    }
    
    func handleSearchOption(withOptions: [Constants.SearchOptionType:String]) {
        print("OK")
    }
    
}
