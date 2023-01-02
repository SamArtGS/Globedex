//
//  TabBarView.swift
//  Globedex (iOS)
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-12-13.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var weakStrongToggle: Int = 0

    var body: some View {
        TabView {
          NavigationView { PokedexView(numberOfPokemons: .constant(50)) }
          .tabItem {
            Label("Pokedex", systemImage: "star.fill")
          }
          .navigationViewStyle(.stack)
          NavigationView { TrainerView() }
          .tabItem {
            Label("Trainer", systemImage: "figure.walk")
          }
        }
    }
    
    private func addItem() {
        print("Hola")
    }
}
