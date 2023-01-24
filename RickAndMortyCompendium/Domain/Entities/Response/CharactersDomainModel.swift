//
//  CharactersDomainModel.swift
//  RickAndMortyCompendium
//
//  Created by pedro.garcia.local on 23/1/23.
//

import Foundation

// MARK: - CharactersDomainModel

public struct CharactersDomainModel {

    let info: CharactersInfoDomainModel
    let results: [CharactersResultsDomainModel]
    
}

// MARK: - CharactersInfoDomainModel

public struct CharactersInfoDomainModel {

    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

// MARK: - CharactersResultsDomainModel

public struct CharactersResultsDomainModel {

    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: BaseInfoDomainModel
    let location: BaseInfoDomainModel
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
}

// MARK: - BaseInfoDomainModel

public struct BaseInfoDomainModel {

    let name: String
    let url: String
    
}
