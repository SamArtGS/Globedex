//
//  PokemonDTODecode.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-11-28.
//

import Foundation

extension PokemonDTO: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case types = "types"
        case abilities = "abilities"
        case baseExperience = "base_experience"
        case height = "height"
        case weight = "weight"
        case order = "order"
        case sprites = "sprites"
        case moves = "moves"
        case stats = "stats"
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        types = try container.decode([PokeType].self, forKey: .types)
        abilities = try container.decode([Ability].self, forKey: .abilities)
        baseExperience = try container.decode(Int.self, forKey: .baseExperience)
        height = try container.decode(Float.self, forKey: .height)
        weight = try container.decode(Float.self, forKey: .weight)
        order = try container.decode(Int.self, forKey: .order)
        sprites = try container.decode(Sprite.self, forKey: .sprites)
        moves = try container.decode([Move].self, forKey: .moves)
        stats = try container.decode([Stadistic].self, forKey: .stats)
    }
}

extension PokemonDTO.PokeType: Decodable {
    private enum CodingKeys: String, CodingKey {
        case slot = "slot"
        case type = "type"
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        slot = try container.decode(Int.self, forKey: .slot)
        type = try container.decode(TypeNameURL.self, forKey: .type)
    }
}

extension PokemonDTO.PokeType.TypeNameURL: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        url = try container.decode(String.self, forKey: .url)
    }
}

extension PokemonDTO.Ability: Decodable {
    private enum CodingKeys: String, CodingKey {
        case ability = "ability"
        case isHidden = "is_hidden"
        case slot = "slot"
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        ability = try container.decode(AbilityNameURL.self, forKey: .ability)
        isHidden = try container.decode(Bool.self, forKey: .isHidden)
        slot = try container.decode(Int.self, forKey: .slot)
    }
}

extension PokemonDTO.Ability.AbilityNameURL: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        url = try container.decode(String.self, forKey: .url)
    }
}

extension PokemonDTO.Sprite: Decodable {
    private enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
        case other = "other"
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        backDefault = try container.decode(String.self, forKey: .backDefault)
        backFemale = try container.decode(String.self, forKey: .backFemale)
        backShiny = try container.decode(String.self, forKey: .backShiny)
        backShinyFemale = try container.decode(String.self, forKey: .backShinyFemale)
        frontDefault = try container.decode(String.self, forKey: .frontDefault)
        frontFemale = try container.decode(String.self, forKey: .frontFemale)
        frontShiny = try container.decode(String.self, forKey: .frontShiny)
        frontShinyFemale = try container.decode(String.self, forKey: .frontShinyFemale)
        other = try container.decode(OtherSprites.self, forKey: .other)
    }
}

extension PokemonDTO.Sprite.OtherSprites: Decodable {
    private enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case home = "home"
        case artwork = "official-artwork"
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        dreamWorld = try container.decodeIfPresent(DreamWorld.self, forKey: .dreamWorld)
        home = try container.decodeIfPresent(Home.self, forKey: .home)
        officialArtWork = try container.decodeIfPresent(OfficialArtWork.self, forKey: .artwork)
    }
}

extension PokemonDTO.Sprite.OtherSprites.DreamWorld: Decodable {
    private enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        frontDefault = try container.decodeIfPresent(String.self, forKey: .frontDefault)
        frontFemale = try container.decodeIfPresent(String.self, forKey: .frontFemale)
    }
}

extension PokemonDTO.Sprite.OtherSprites.Home: Decodable {
    private enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        frontDefault = try container.decodeIfPresent(String.self, forKey: .frontDefault)
        frontFemale = try container.decodeIfPresent(String.self, forKey: .frontFemale)
        frontShiny = try container.decodeIfPresent(String.self, forKey: .frontShiny)
        frontShinyFemale = try container.decodeIfPresent(String.self, forKey: .frontShinyFemale)
    }
}

extension PokemonDTO.Sprite.OtherSprites.OfficialArtWork: Decodable {
    private enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        frontDefault = try container.decodeIfPresent(String.self, forKey: .frontDefault)
    }
}

extension PokemonDTO.Move: Decodable {
    private enum CodingKeys: String, CodingKey {
        case move = "move"
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        move = try container.decode(MoveNameURL.self, forKey: .move)
    }
}

extension PokemonDTO.Move.MoveNameURL: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        url = try container.decode(String.self, forKey: .url)
    }
}

extension PokemonDTO.Stadistic: Decodable {
    private enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort = "effort"
        case stat = "stat"
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        baseStat = try container.decode(Int.self, forKey: .baseStat)
        effort = try container.decode(Int.self, forKey: .effort)
        stat = try container.decode(StadisticNameURL.self, forKey: .stat)
    }
}

extension PokemonDTO.Stadistic.StadisticNameURL: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        url = try container.decode(String.self, forKey: .url)
    }
}
