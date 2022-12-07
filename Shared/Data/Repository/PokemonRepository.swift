//
//  PokemonRepository.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-11-28.
//

import Foundation
import Combine

enum PokemonAPIError: Error {
    case urlError
    case internetError
    case coreDataError
}

enum PokemonFetchErrors: Error {
    case notFound
    case connectionIssues
    case localStorageIssues
    case custom(String)
}

protocol PokemonRepository {
    func getPokemon(by value: String) -> AnyPublisher<Pokemon, Error>
}

class DefaultPokemonRepository: PokemonRepository {

    private let remoteRepository: RemoteRepository
    // private let localRepository: LocalRepository
    
    init(
        remoteRepository: RemoteRepository = RemoteRepository()
//        localRepository: LocalRepository = LocalRepository()
    ){
        self.remoteRepository = remoteRepository
    }
    
    func getPokemon(by value: String) -> AnyPublisher<Pokemon, Error> {
        remoteRepository.getPokemon(with: value)
    }
}
