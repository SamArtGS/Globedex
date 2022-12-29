//
//  SliptView.swift
//  Globedex (iOS)
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-12-13.
//

import SwiftUI

struct SliptView: View {
    
    @State var whichPane: Int? = 0

    var body: some View {
        
        NavigationView {
          List {
            NavigationLink(destination: PokedexView(numberOfPokemons: .constant(50)), tag: 0, selection: $whichPane) {
              Label("Pokedex", systemImage: "star.fill")
            }
              NavigationLink(destination: TrainerView(), tag: 1, selection: $whichPane) {
              Label("Trainer", systemImage: "figure.walk")
            }
            .navigationTitle("Globedex")
            .navigationViewStyle(.columns)
          }
          PokedexView(numberOfPokemons: .constant(50))
        }
    }
}
