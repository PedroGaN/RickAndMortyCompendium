//
//  Constants.swift
//  RickAndMortyCompendium
//
//  Created by pedro.garcia.local on 23/1/23.
//

import Foundation

struct Constants {
    
    enum FetchType: Int {
        case characters = 0
        case locations = 1
        case episodes = 2
    }
    
    enum SearchOptionType {
        case name
        case status
        case species
        case gender
    }
    
}
