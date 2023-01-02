//
//  Protocols.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-11-28.
//

import Foundation
import Combine

protocol GetPokemonUseCase {
    associatedtype Query: Equatable
    var repository: PokemonRepository { get }
    init(repository: PokemonRepository)
    func execute(with: Query) -> AnyPublisher<[Pokemon], Error>
}
