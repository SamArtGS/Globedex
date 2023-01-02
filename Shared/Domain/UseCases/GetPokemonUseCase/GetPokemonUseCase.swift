//
//  GetPokemonDataUseCase.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-11-28.
//

import Foundation
import Combine

class DefaultGetPokemonUseCase<Value: Hashable>: GetPokemonUseCase {

    let repository: PokemonRepository

    required init(repository: PokemonRepository = DefaultPokemonRepository()) {
        self.repository = repository
    }

    func execute(with value: Value) -> AnyPublisher<[Pokemon], Error> {
        repository.getPokemon(by:"\(value)")
    }
}
