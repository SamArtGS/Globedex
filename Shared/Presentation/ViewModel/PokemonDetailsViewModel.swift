//
//  PokemonDetailsViewModel.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-12-30.
//

import Foundation
import Combine

final class PokeonDetailsViewModel: ObservableObject {
    
    @Published var pokemon: Pokemon?
    @Published var type: [PokemonType] = .init()
    @Published var imageURL: String = .init()
    @Published var title: String = .init()
    @Published var weight: String = .init()
    @Published var height: String = .init()
    @Published var experience: String = .init()
    @Published var movements: [String] = .init()
    @Published var abilities: [String] = .init()
    @Published var chartData: [DataItem] = .init()
    @Published var greatDamage: [PokemonType] = .init()
    @Published var weakness: [PokemonType] = .init()
    @Published var defenses: [PokemonType] = .init()
    @Published var normalDamage: [PokemonType] = .init()
    
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
        } receiveValue: { arrayPokemon in
            self.pokemon = arrayPokemon.first
            self.setContent(from: arrayPokemon.first)
            self.setContentGraph(from: arrayPokemon.first)
        }
        .store(in: &cancellables)
    }
    
    private func setContent(from pokemon: Pokemon?) {
        guard let pokemon = pokemon else { return }
        imageURL = pokemon.imageName ?? ""
        title = String(format: "#%03d", pokemon.number) + " - " + pokemon.name.capitalized
        type = pokemon.type
        weight = "\(Int(pokemon.weight)) kg"
        height = "\(Int(pokemon.height)) m"
        experience = "\(pokemon.baseExperience) exp"
        movements = pokemon.moves
        abilities = pokemon.abilities
        greatDamage = pokemon.greatDamage
        weakness = pokemon.weakness
        defenses = pokemon.defenses
        normalDamage = pokemon.normalDamage
    }
    
    private func setContentGraph(from pokemon: Pokemon?) {
        guard let pokemon = pokemon else { return }
        chartData.append(DataItem(name: "Attack", value: pokemon.stadistics.attack))
        chartData.append(DataItem(name: "Defense", value: pokemon.stadistics.defense))
        chartData.append(DataItem(name: "S. Attack", value: pokemon.stadistics.specialAttack))
        chartData.append(DataItem(name: "S. Defense", value: pokemon.stadistics.specialDefense))
        chartData.append(DataItem(name: "Speed", value: pokemon.stadistics.speed))
    }
}
