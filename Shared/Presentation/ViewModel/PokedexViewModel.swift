//
//  PokedexViewModel.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-11-29.
//

import Foundation
import Combine

final class PokedexViewModel: ObservableObject {
    
    @Published var queryName: String = ""
    @Published private(set) var pokemons: [Pokemon] = []
    private var cancellables = Set<AnyCancellable>()
    private let useCase = DefaultGetPokemonUseCase<String>()
    
    init() {
        $queryName
          .debounce(for: 0.5, scheduler: DispatchQueue.main)
          .map {
            self.useCase.execute(with: $0.lowercased())
            .replaceError(with: [])
          }
          .switchToLatest()
          .receive(on: DispatchQueue.main)
          .assign(to: &$pokemons)
    }
}
