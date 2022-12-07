//
//  PokemonType.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-11-28.
//

enum PokemonType {
    case normal
    case fighting
    case flying
    case poison
    case ground
    case rock
    case bug
    case ghost
    case steel
    case fire
    case water
    case grass
    case electric
    case psychic
    case ice
    case dragon
    case dark
    case fairy
    
    var superEfective: [PokemonType] {
        switch self {
        case .normal:
            return .init()
        case .fighting:
            return [.normal, .ice, .rock, .dark, .steel]
        case .flying:
            return [.fighting, .bug, .grass]
        case .poison:
            return [.grass, .fairy]
        case .ground:
            return [.poison, .rock, .steel, .fire, .electric]
        case .rock:
            return [.flying, .bug, .fire, .ice]
        case .bug:
            return [.grass, .psychic, .dark]
        case .ghost:
            return [.ghost, .psychic]
        case .steel:
            return [.ice, .rock, .fairy]
        case .fire:
            return [.bug, .steel, .grass, .ice]
        case .water:
            return [.ground, .rock, .fire]
        case .grass:
            return [.ground, .rock, .water]
        case .electric:
            return [.flying, .water]
        case .psychic:
            return [.fighting, .poison]
        case .ice:
            return [.flying, .ground, .grass, .dragon]
        case .dragon:
            return [.dragon]
        case .dark:
            return [.ghost, .psychic]
        case .fairy:
            return [.fighting, .dragon, .dark]
        }
    }
    
    var notVeryEfective: [PokemonType] {
        switch self {
        case .normal:
            return [.rock, .steel, .ghost]
        case .fighting:
            return [.flying, .poison, .psychic, .ghost]
        case .flying:
            return [.electric, .rock, .steel]
        case .poison:
            return [.poison, .ground, .rock, .ghost, .steel]
        case .ground:
            return [.bug, .grass, .flying]
        case .rock:
            return [.fighting, .ground, .steel]
        case .bug:
            return [.fighting, .flying, .poison, .ghost, .steel, .fire, .fairy]
        case .ghost:
            return [.dark, .normal]
        case .steel:
            return [.steel, .fire, .water, .electric]
        case .fire:
            return [.rock, .fire, .water, .dragon]
        case .water:
            return [.water, .grass, .dragon]
        case .grass:
            return [.flying, .poison, .bug, .steel, .fire, .grass, .dragon]
        case .electric:
            return [.grass, .electric, .dragon, .ground]
        case .psychic:
            return [.steel, .psychic, .dark]
        case .ice:
            return [.steel, .fire, .water, .ice]
        case .dragon:
            return [.steel]
        case .dark:
            return [.fighting, .dark, .fairy]
        case .fairy:
            return [.poison, .steel, .fire]
        }
    }
    
    var resistDamage: [PokemonType] {
        switch self {
        case .normal:
            return [.ghost]
        case .fighting:
            return [.rock, .bug, .dark]
        case .flying:
            return [.fighting, .bug, .grass, .ground]
        case .poison:
            return [.fighting, .poison, .bug, .grass, .fairy]
        case .ground:
            return [.poison, .rock, .electric]
        case .rock:
            return [.normal, .fire, .poison, .flying]
        case .bug:
            return [.fighting, .ground, .grass]
        case .ghost:
            return [.poison, .bug, .normal, .fighting]
        case .steel:
            return [.normal, .grass, .ice, .flying, .psychic,
                    .bug, .rock, .dragon, .steel, .fairy, .poison]
        case .fire:
            return [.bug, .steel, .grass, .ice, .fairy]
        case .water:
            return [.fire, .water, .ice, .steel]
        case .grass:
            return [.water, .grass, .electric, .ground]
        case .electric:
            return [.flying, .steel, .electric]
        case .psychic:
            return [.fighting, .psychic]
        case .ice:
            return [.ice]
        case .dragon:
            return [.fire, .water, .grass, .electric]
        case .dark:
            return [.ghost, .dark, .psychic]
        case .fairy:
            return [.fighting, .bug, .dark, .dragon]
        }
    }
    
    var weaknesses: [PokemonType] {
        switch self {
        case .normal:
            return [.fighting]
        case .fighting:
            return [.flying, .psychic, .fairy]
        case .flying:
            return [.rock, .electric, .ice]
        case .poison:
            return [.ground, .psychic]
        case .ground:
            return [.water, .grass, .ice]
        case .rock:
            return [.water, .grass, .fighting, .ground, .steel]
        case .bug:
            return [.flying, .rock, .fire]
        case .ghost:
            return [.ghost, .dark]
        case .steel:
            return [.fire, .fighting, .ground]
        case .fire:
            return [.ground, .rock, .water]
        case .water:
            return [.electric, .grass]
        case .grass:
            return [.flying, .poison, .bug, .fire, .ice]
        case .electric:
            return [.ground]
        case .psychic:
            return [.bug, .ghost, .dark]
        case .ice:
            return [.fighting, .rock, .steel, .fire]
        case .dragon:
            return [.ice, .dragon, .fairy]
        case .dark:
            return [.fighting, .bug, .fairy]
        case .fairy:
            return [.poison, .steel]
        }
    }
}

// MARK: - Static functions
extension PokemonType {
    static func superEfective(with type: PokemonType) -> [PokemonType] {
        switch type {
        case .normal:
            return .init()
        case .fighting:
            return [.normal, .ice, .rock, .dark, .steel]
        case .flying:
            return [.fighting, .bug, .grass]
        case .poison:
            return [.grass, .fairy]
        case .ground:
            return [.poison, .rock, .steel, .fire, .electric]
        case .rock:
            return [.flying, .bug, .fire, .ice]
        case .bug:
            return [.grass, .psychic, .dark]
        case .ghost:
            return [.ghost, .psychic]
        case .steel:
            return [.ice, .rock, .fairy]
        case .fire:
            return [.bug, .steel, .grass, .ice]
        case .water:
            return [.ground, .rock, .fire]
        case .grass:
            return [.ground, .rock, .water]
        case .electric:
            return [.flying, .water]
        case .psychic:
            return [.fighting, .poison]
        case .ice:
            return [.flying, .ground, .grass, .dragon]
        case .dragon:
            return [.dragon]
        case .dark:
            return [.ghost, .psychic]
        case .fairy:
            return [.fighting, .dragon, .dark]
        }
    }
    
    static func notVeryEfective(with type: PokemonType) -> [PokemonType] {
        switch type {
        case .normal:
            return [.rock, .steel, .ghost]
        case .fighting:
            return [.flying, .poison, .psychic, .ghost]
        case .flying:
            return [.electric, .rock, .steel]
        case .poison:
            return [.poison, .ground, .rock, .ghost, .steel]
        case .ground:
            return [.bug, .grass, .flying]
        case .rock:
            return [.fighting, .ground, .steel]
        case .bug:
            return [.fighting, .flying, .poison, .ghost, .steel, .fire, .fairy]
        case .ghost:
            return [.dark, .normal]
        case .steel:
            return [.steel, .fire, .water, .electric]
        case .fire:
            return [.rock, .fire, .water, .dragon]
        case .water:
            return [.water, .grass, .dragon]
        case .grass:
            return [.flying, .poison, .bug, .steel, .fire, .grass, .dragon]
        case .electric:
            return [.grass, .electric, .dragon, .ground]
        case .psychic:
            return [.steel, .psychic, .dark]
        case .ice:
            return [.steel, .fire, .water, .ice]
        case .dragon:
            return [.steel]
        case .dark:
            return [.fighting, .dark, .fairy]
        case .fairy:
            return [.poison, .steel, .fire]
        }
    }
    
    static func resistDamage(with type: PokemonType) -> [PokemonType] {
        switch type {
        case .normal:
            return [.ghost]
        case .fighting:
            return [.rock, .bug, .dark]
        case .flying:
            return [.fighting, .bug, .grass, .ground]
        case .poison:
            return [.fighting, .poison, .bug, .grass, .fairy]
        case .ground:
            return [.poison, .rock, .electric]
        case .rock:
            return [.normal, .fire, .poison, .flying]
        case .bug:
            return [.fighting, .ground, .grass]
        case .ghost:
            return [.poison, .bug, .normal, .fighting]
        case .steel:
            return [.normal, .grass, .ice, .flying, .psychic,
                    .bug, .rock, .dragon, .steel, .fairy, .poison]
        case .fire:
            return [.bug, .steel, .grass, .ice, .fairy]
        case .water:
            return [.fire, .water, .ice, .steel]
        case .grass:
            return [.water, .grass, .electric, .ground]
        case .electric:
            return [.flying, .steel, .electric]
        case .psychic:
            return [.fighting, .psychic]
        case .ice:
            return [.ice]
        case .dragon:
            return [.fire, .water, .grass, .electric]
        case .dark:
            return [.ghost, .dark, .psychic]
        case .fairy:
            return [.fighting, .bug, .dark, .dragon]
        }
    }
    
    static func weaknesses(with type: PokemonType) -> [PokemonType] {
        switch type {
        case .normal:
            return [.fighting]
        case .fighting:
            return [.flying, .psychic, .fairy]
        case .flying:
            return [.rock, .electric, .ice]
        case .poison:
            return [.ground, .psychic]
        case .ground:
            return [.water, .grass, .ice]
        case .rock:
            return [.water, .grass, .fighting, .ground, .steel]
        case .bug:
            return [.flying, .rock, .fire]
        case .ghost:
            return [.ghost, .dark]
        case .steel:
            return [.fire, .fighting, .ground]
        case .fire:
            return [.ground, .rock, .water]
        case .water:
            return [.electric, .grass]
        case .grass:
            return [.flying, .poison, .bug, .fire, .ice]
        case .electric:
            return [.ground]
        case .psychic:
            return [.bug, .ghost, .dark]
        case .ice:
            return [.fighting, .rock, .steel, .fire]
        case .dragon:
            return [.ice, .dragon, .fairy]
        case .dark:
            return [.fighting, .bug, .fairy]
        case .fairy:
            return [.poison, .steel]
        }
    }
}
