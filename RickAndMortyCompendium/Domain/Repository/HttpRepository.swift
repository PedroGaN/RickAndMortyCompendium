//
//  HttpRepository.swift
//  RickAndMortyCompendium
//
//  Created by pedro.garcia.local on 23/1/23.
//

import Foundation

public protocol HttpRepository {
    
    func fetchCharacters(onSuccess: @escaping (_ success: CharactersDomainModel) -> Void,
                         onFailure: @escaping (_ error: Error) -> Void)
    
}
