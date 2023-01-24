//
//  CharacterInfoCellViewModel.swift
//  RickAndMortyCompendium
//
//  Created by pedro.garcia.local on 24/1/23.
//

import Foundation
import UIKit

struct CharacterInfoCellViewModel {
    let characterImageURL: String
    let name: String
    let gender: String
    let species: String
    let status: String
    let id: Int
    let type: String
    let origin: String
    let currentLocation: String
    
    init(characterImageURL: String,
         name: String,
         gender: String,
         species: String,
         status: String,
         id: Int,
         type: String,
         origin: String,
         currentLocation: String) {
        self.name = name
        self.gender = gender
        self.species = species
        self.status = status
        self.id = id
        self.type = type
        self.origin = origin
        self.currentLocation = currentLocation
        self.characterImageURL = characterImageURL
    }
}
