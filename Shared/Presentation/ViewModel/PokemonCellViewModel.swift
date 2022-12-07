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

    @Published var pokemonTypeIcons: [String] = []
    @Published var heartIcon: String = "pokeball-missing"
    @Published var pokemonNumberLabel: String = "#000"
    @Published var pokemonNameLabel: String = "Loading..."
    @Published var pokemonImageLink: String?
    @Published var weakStrongStringsIcons: [String] = .init()
    @Published var pokemonStadistics: Pokemon.Stadistic = .init()
    @Published var pokemonBackgroundImage: String = ""
    @Published var weakStrongLabel: String = "Strong"
    
    private var cancellables = Set<AnyCancellable>()

    init(
        name: String,
        useCase: DefaultGetPokemonUseCase<String> = DefaultGetPokemonUseCase<String>()
    ) {
        useCase.execute(with: name)
        .receive(on: DispatchQueue.main)
        .sink { response in
            switch response {
            case .finished:
                print("Sucess!")
            case .failure(let error):
                print("Error \(error)")
            }
        } receiveValue: { pokemon in
            print(pokemon)
        }
        .store(in: &cancellables)
    }

    init(
        number: Int,
        useCase: DefaultGetPokemonUseCase<Int> = DefaultGetPokemonUseCase<Int>()
    ) {
        useCase.execute(with: number)
        .receive(on: DispatchQueue.main)
        .sink { response in
            switch response {
            case .finished:
                print("Sucess!")
            case .failure(let error):
                print("Error \(error)")
            }
        } receiveValue: { pokemon in
            self.setContent(from: pokemon)
        }
        .store(in: &cancellables)
    }
    
    private func setContent(from pokemon: Pokemon) {
        pokemonTypeIcons = pokemon.type.map{ PokemonType.getImageName(from: $0) }
        pokemonNumberLabel = String(format: "#%03d", pokemon.number);
        heartIcon = pokemonTypeIcons.count.isMultiple(of: 2) ? "pokeball-missing" : ["icons8-pokeball", "icons8-superball", "icons8-mega_ball", "icons8-ultra_ball"].randomElement() as! String
        pokemonNameLabel = pokemon.name.capitalized
        
        pokemon.type.flatMap { $0.weaknesses }.forEach { weakStrongStringsIcons.append($0.rawValue) }
        
        pokemonStadistics = pokemon.stadistics
        
        pokemonImageLink = pokemon.imageName
    }
}
