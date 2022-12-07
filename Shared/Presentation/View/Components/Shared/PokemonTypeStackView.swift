//
//  PokemonTypeStackView.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-12-02.
//

import SwiftUI

struct PokemonTypeStackView: View {
    
    @Binding var pokemonTypeIcons: [String]
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            VStack {
                Image(systemName: "bolt.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15, alignment: .center)
                    .foregroundColor(.yellow)
                Image(systemName: "ladybug.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15, alignment: .center)
                    .foregroundColor(.orange)
                Image(systemName: "moon.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15, alignment: .center)
                    .foregroundColor(.black)
            }
            VStack {
                Image(systemName: "leaf.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15, alignment: .center)
                    .foregroundColor(.green)
                Image(systemName: "drop.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15, alignment: .center)
                    .foregroundColor(.blue)
                Image(systemName: "flame.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15, alignment: .center)
                    .foregroundColor(.red)
            }
        }
    }
}
