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
    
    let fetchCharactersInteractor: FetchCharactersInteractor
    /// Limited fetch for lack of cache
    var fetchCharactersIterations: Int = .zero
    
    var characters: [CharactersResultsDomainModel]?
    var loadedCharacters: Bool = false
    var downloadedCharacterImages: Bool = false
    
    // MARK: - Initializer
    
    init(view: MainScreenViewControllerProtocol,
         router: MainWireframeProtocol,
         fetchCharactersInteractor: FetchCharactersInteractor) {
        self.fetchCharactersInteractor = fetchCharactersInteractor
        super.init(view: view, router: router)
    }
    
    // MARK: - Private Methods
    
    private func handleFetchCharacters(forPage pageURL: String? = nil) {
        if let _ = characters,
           loadedCharacters {
            hideLoading()
            getView()?.setTableCharactersInfo(getCharacterModels(characters))
        } else {
            fetchCharactersInteractor.execute(pageURL, onSuccess: { [weak self] characters in
                self?.setCharacters(characters.results)
                /// Limited fetch for lack of cache
                self?.fetchCharactersIterations += 1
                if let nextPageURL = characters.info.next,
                   /// Limited fetch for lack of cache
                   self?.fetchCharactersIterations ?? .zero <= 3 {
                    self?.handleFetchCharacters(forPage: nextPageURL)
                } else {
                    self?.hideLoading()
                    self?.loadedCharacters = true
                    self?.getView()?.setTableCharactersInfo(self?.getCharacterModels(self?.characters))
                }
            }, onFailure: { [weak self] error in
                print(error)
            }).disposed(by: self.disposeBag)
        }
    }
    
    private func setCharacters(_ charactersInfo: [CharactersResultsDomainModel]) {
        if let _ = characters {
            characters?.append(contentsOf: charactersInfo)
        } else {
            characters = charactersInfo
        }
    }
    
    private func getCharacterModels(_ characters: [CharactersResultsDomainModel]?) -> [CharacterInfoCellViewModel] {
        var characterModel: [CharacterInfoCellViewModel] = []
        if let _ = characters {
            showLoading()
            characters?.forEach({ character in
                characterModel.append(CharacterInfoCellViewModel(characterImageURL: character.image,
                                                                 name: character.name,
                                                                 gender: character.gender,
                                                                 species: character.species,
                                                                 status: character.status,
                                                                 id: character.id,
                                                                 type: character.type,
                                                                 origin: character.origin.name,
                                                                 currentLocation: character.location.name))
            })
            hideLoading()
            return characterModel
        } else {
            return characterModel
        }
    }
    
    // MARK: - Protocol
    
    func handleFetchData(for type: Constants.FetchType) {
        showLoading()
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
