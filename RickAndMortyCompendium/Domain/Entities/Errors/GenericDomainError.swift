//
//  GenericDomainError.swift
//  RickAndMortyCompendium
//
//  Created by pedro.garcia.local on 23/1/23.
//

import Foundation

public enum ErrorDomainType {
    case parse
    case fileNotFound
    case unknown
}

public struct GenericDomainError: Error {

    public let type: ErrorDomainType
    public let description: String

    public init(type: ErrorDomainType = .unknown, description: String = "") {
        self.type = type
        self.description = description
    }

}
