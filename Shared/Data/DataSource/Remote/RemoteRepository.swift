//
//  RemoteRepository.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-11-28.
//

import Foundation
import Combine

class RemoteRepository {

    let baseURL: String = "https://pokeapi.co/api/v2/pokemon"

    func getPokemon(with name: String) -> AnyPublisher<[Pokemon], Error> {
        guard let url = URL(string: baseURL)?.appendingPathComponent(name) else {
            return Fail(error: PokemonAPIError.urlError).eraseToAnyPublisher()
        }
        let dataTask = URLSession.shared.dataTaskPublisher(for: url)
            .map{ $0.data }
            .mapError { _ in PokemonAPIError.internetError }
            .decode(type: PokemonDTO.self, decoder: JSONDecoder())
            .compactMap {
                self.mappingPokemonDTO(pokemonDTO: $0)
            }
            .eraseToAnyPublisher()
        return dataTask
    }

    private func mappingPokemonDTO(pokemonDTO: PokemonDTO) -> [Pokemon] {
        let typesString: [String] = pokemonDTO.types.map(\.type.name)
        let typesEnum: [PokemonType] = PokemonType.allCases.filter { typesString.contains($0.rawValue) }
        let abilities: [String] = pokemonDTO.abilities.map(\.ability.name)
        let moves: [String] = pokemonDTO.moves.map(\.move.name)
        let stadistic: Pokemon.Stadistic = Pokemon.Stadistic(
            hp: Float(pokemonDTO.stats.filter{ $0.stat.name == "hp" }.compactMap{ $0.baseStat }.first ?? 0),
            attack: Float(pokemonDTO.stats.filter{ $0.stat.name == "attack" }.compactMap{ $0.baseStat }.first ?? 0),
            defense: Float(pokemonDTO.stats.filter{ $0.stat.name == "defense" }.compactMap{ $0.baseStat }.first ?? 0),
            specialAttack: Float(pokemonDTO.stats.filter{ $0.stat.name == "special-attack" }.compactMap{ $0.baseStat }.first ?? 0),
            specialDefense: Float(pokemonDTO.stats.filter{ $0.stat.name == "special-defense" }.compactMap{ $0.baseStat }.first ?? 0),
            speed: Float(pokemonDTO.stats.filter{ $0.stat.name == "speed" }.compactMap{ $0.baseStat }.first ?? 0)
        )
        let image: String? = pokemonDTO.sprites.other?.officialArtWork?.frontDefault
        
        return .init(arrayLiteral: .init(
            id: .init(),
            number: pokemonDTO.id,
            name: pokemonDTO.name,
            type: typesEnum,
            baseExperience: pokemonDTO.baseExperience,
            weight: pokemonDTO.weight,
            height: pokemonDTO.height,
            abilities: abilities,
            moves: moves,
            stadistics: stadistic,
            imageName: image
        ))
    }
}
