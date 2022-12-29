//
//  PokedexView.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-12-28.
//

import SwiftUI

struct PokedexView: View {
    
    @Binding var numberOfPokemons: Int
    @State private var weakStrongToggle: Int = 0
    @StateObject var viewModel = PokedexViewModel()
    
    var body: some View {
        PokemonGridSearchView()
        #if os(iOS)
        .navigationBarTitle("Pokedex", displayMode: .large)
        #endif
        .searchable(
            text: $viewModel.queryName,
          placement: Constants.placements.0
        )
        .toolbar {
          ToolbarItem(placement: Constants.placements.1) {
            Button(action: addItem) {
              Label("User", systemImage: "speaker.fill")
            }
          }
          ToolbarItem(placement: Constants.placements.2){
            Picker("Attack", selection: $weakStrongToggle) {
              Text("Strong").tag(0)
              Text("Weak").tag(1)
            }
            .pickerStyle(.segmented)
          }
       }
    }
    
    func PokemonGridSearchView() -> some View {
      if viewModel.queryName.isEmpty {
        return AnyView(
            PokemonCollectionView(
                        numberOfPokemons: $numberOfPokemons,
                        weakStrongToggle: $weakStrongToggle)
        )
      } else {
        return AnyView(
            PokedexCellView(
                viewModel: PokemonCellViewModel(pokemon: viewModel.pokemons.first),
                weakStrongToggle: $weakStrongToggle
            )
        )
      }
    }
}

extension PokedexView {
    private func addItem() {
        print("Hola")
    }
}
