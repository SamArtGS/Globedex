//
//  PokemonTypeStackView.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-12-02.
//

import SwiftUI

struct PokemonTypeStackView: View {
    
    @Binding var pokemonTypeIcons: Set<PokemonType>

    private let gridItemRow: [GridItem] = [
        GridItem(
            .fixed(15),
            spacing: 8,
            alignment: .topTrailing
        ),
        GridItem(
            .fixed(15),
            spacing: 8,
            alignment: .topTrailing
        ),
        GridItem(
            .fixed(15),
            spacing: 8,
            alignment: .topTrailing
        )
    ]
    
    var body: some View {
        LazyHGrid(rows: gridItemRow) {
            ForEach(pokemonTypeIcons.reversed().prefix(6), id: \.self) { poke in
                PokemonIconView(pokemonType: poke)
                    .frame(width: 15, height: 15, alignment: .center)
            }
        }
    }
}

struct PokemonIconView: View {
    
    var pokemonType: PokemonType
    
    var body: some View {
        Image(systemName: determinateImage(of: pokemonType))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(determinateColor(of: pokemonType))
    }
    
    func determinateColor(of pokemonType: PokemonType) -> Color {
        switch pokemonType {
        case .normal:
            return .gray
        case .fighting:
            return .brown
        case .flying:
            return .cyan
        case .poison:
            return .green
        case .ground:
            return .brown
        case .rock:
            return .purple
        case .bug:
            return .green
        case .ghost:
            return .white
        case .steel:
            return .gray
        case .fire:
            return .red
        case .water:
            return .blue
        case .grass:
            return .green
        case .electric:
            return .yellow
        case .psychic:
            return .white
        case .ice:
            return .cyan
        case .dragon:
            return .orange
        case .dark:
            return .black
        case .fairy:
            return .yellow
        }
    }
    
    func determinateImage(of type: PokemonType) -> String {
        switch type {
        case .normal:
            return "hand.thumbsup.fill"
        case .fighting:
            return "star.fill"
        case .flying:
            return "tornado"
        case .poison:
            return "testtube.2"
        case .ground:
            return "seal.fill"
        case .rock:
            return "alarm"
        case .bug:
            return "ladybug.fill"
        case .ghost:
            return "theatermasks.fill"
        case .steel:
            return "scalemass.fill"
        case .fire:
            return "flame.fill"
        case .water:
            return "drop.fill"
        case .grass:
            return "camera.macro"
        case .electric:
            return "bolt.fill"
        case .psychic:
            return "brain.head.profile"
        case .ice:
            return "snowflake"
        case .dragon:
            return "lizard.fill"
        case .dark:
            return "moon.fill"
        case .fairy:
            return "sparkles"
        }
    }
}
