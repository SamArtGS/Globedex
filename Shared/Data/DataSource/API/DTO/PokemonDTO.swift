//
//  PokemonDTO.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-11-28.
//

import Foundation

struct PokemonDTO {
    let id: Int
    let name: String
    let types: [PokeType]
    let abilities: [Ability]
    let baseExperience: Int
    let height: Float
    let weight: Float
    let order: Int
    let sprites: Sprite
    let moves: [Move]
    let stats: [Stadistic]
}

extension PokemonDTO {

    struct PokeType {
        let slot: Int
        let type: TypeNameURL

        struct TypeNameURL {
            let name: String
            let url: String
        }
    }

    struct Ability {
        let ability: AbilityNameURL
        let isHidden: Bool
        let slot: Int

        struct AbilityNameURL {
            let name: String
            let url: String
        }
    }

    struct Sprite {
        let backDefault: String?
        let backFemale: String?
        let backShiny: String?
        let backShinyFemale: String?
        let frontDefault: String?
        let frontFemale: String?
        let frontShiny: String?
        let frontShinyFemale: String?
        let other: OtherSprites?

        struct OtherSprites {
            let dreamWorld: DreamWorld?
            let home: Home?
            let officialArtWork: OfficialArtWork?

            struct DreamWorld {
                let frontDefault: String?
                let frontFemale: String?
            }

            struct Home {
                let frontDefault: String?
                let frontFemale: String?
                let frontShiny: String?
                let frontShinyFemale: String?
            }

            struct OfficialArtWork {
                let frontDefault: String?
            }
        }
    }

    struct Move {
        let move: MoveNameURL
        struct MoveNameURL {
            let name: String
            let url: String
        }
    }

    struct Stadistic {
        let baseStat: Int
        let effort: Int
        let stat: StadisticNameURL

        struct StadisticNameURL {
            let name: String
            let url: String
        }
    }

}







