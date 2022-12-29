//
//  PokemonListView.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-12-26.
//

import SwiftUI

struct PokemonCollectionView: View {

    @Binding var numberOfPokemons: Int
    @Binding var weakStrongToggle: Int

    var body: some View {
      ScrollView {
        LazyVGrid(columns: Constants.columns) {
          ForEach(1..<numberOfPokemons, id: \.self) { index in
              PokedexCellView(
                viewModel: PokemonCellViewModel(number: index),
                weakStrongToggle: $weakStrongToggle
              )
              .frame(height: 200)
          }
        }
        #if os(macOS)
        .padding([.top, .bottom], 10)
        #endif
      }
    }
}
