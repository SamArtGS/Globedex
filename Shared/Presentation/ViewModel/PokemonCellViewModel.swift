//
//  PokemonCellViewModel.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-11-30.
//

import Foundation
import Combine
import SwiftUI

final class PokemonCellViewModel: ObservableObject {

    //CGImage CoreGraphics
    #if os(iOS)
        typealias ImageUniversal = UIImage
    #endif
    #if os(macOS)
        typealias ImageUniversal = NSImage
    #endif

    @Published var pokemon: Pokemon?
    @Published var pokemonTypeIcon: [PokemonType] = .init()
    @Published var heartIcon: String = "pokeball-missing"
    @Published var pokemonNumberLabel: String = "#000"
    @Published var pokemonNameLabel: String = "Loading..."
    @Published var pokemonImageLink: String?
    @Published var weakStrongIcons: Set<PokemonType> = .init()
    @Published var pokemonStadistics: Pokemon.Stadistic = .init()
    @Published var pokemonBackgroundImage: String = ""
    @Published var weakStrongLabel: String = "Strong"
    
    private var cancellables = Set<AnyCancellable>()

    init(
        number: Int,
        useCase: DefaultGetPokemonUseCase<Int> = DefaultGetPokemonUseCase<Int>()
    ) {
        useCase.execute(with: number)
        .receive(on: DispatchQueue.main)
        .sink { response in
            switch response {
            case .finished:
                break
            case .failure(let error):
                print("Error \(error)")
            }
        } receiveValue: { pokemon in
            self.setContent(from: pokemon.first)
        }
        .store(in: &cancellables)
    }
    
    init(pokemon: Pokemon?){
        setContent(from: pokemon)
    }
    
    private func setContent(from pokemon: Pokemon?) {
        guard let pokemon = pokemon else { return }

        pokemonTypeIcon = pokemon.type
        pokemonNumberLabel = String(format: "#%03d", pokemon.number);
        heartIcon = pokemonTypeIcon.count.isMultiple(of: 2) ? "pokeball-missing" : ["icons8-pokeball", "icons8-superball", "icons8-mega_ball", "icons8-ultra_ball"].randomElement() as! String
        pokemonNameLabel = pokemon.name.capitalized
        
        pokemon.type.flatMap { $0.weaknesses }.forEach { weakStrongIcons.insert($0) }
        
        pokemonStadistics = pokemon.stadistics
        
        pokemonImageLink = pokemon.imageName
    }
}
