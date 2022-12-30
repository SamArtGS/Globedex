//
//  Pokemon.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-11-28.
//

import Foundation

struct Pokemon: Identifiable {
    let id: UUID
    let number: Int
    let name: String
    let type: [PokemonType]
    let baseExperience: Int
    let weight: Float
    let height: Float
    let abilities: [String]
    let moves: [String]
    var stadistics: Stadistic
    let imageName: String?

    var weakness: [PokemonType] {
        type.flatMap { $0.weaknesses }
    }

    var defenses: [PokemonType] {
        type.flatMap { $0.resistDamage }
    }

    var greatDamage: [PokemonType] {
        type.flatMap { $0.superEfective }
    }

    var normalDamage: [PokemonType] {
        type.flatMap { $0.notVeryEfective }
    }
    
    struct Stadistic {
        var hp: Float = .zero
        var attack: Float = .zero
        var defense: Float = .zero
        var specialAttack: Float = .zero
        var specialDefense: Float = .zero
        var speed: Float = .zero
    }
}

