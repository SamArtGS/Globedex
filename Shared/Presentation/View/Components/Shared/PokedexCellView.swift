//
//  PokemonGridView.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-11-27.
//

import SwiftUI

struct PokedexCellView: View {
    
    @ObservedObject var viewModel: PokemonCellViewModel
    @Binding var weakStrongToggle: Int

    var body: some View {
        VStack(alignment: .leading) {
          HStack(alignment: .center, spacing: 0) {
            VStack(alignment: .leading){
              setIconAndName(type: viewModel.pokemonTypeIcon.first ?? .normal, name: viewModel.pokemonNameLabel)
              PokemonAsyncImage(imageLink: viewModel.pokemonImageLink)
            }

            Spacer()
            
            VStack(alignment: .trailing, spacing: 3) {
              PokeballCatchedIcon()
              Text(viewModel.pokemonNumberLabel)
                .foregroundColor(.black)
                .font(.system(size: 12, weight: .semibold, design: .monospaced))
              Spacer()
              Text(weakStrongToggle == 0 ? "Strong" : "Weak")
                .foregroundColor(.black)
                .font(.system(size: 10, weight: .semibold, design: .default))
              PokemonTypeStackView(pokemonTypeIcons: $viewModel.weakStrongIcons)
            }
            .padding([.top,.trailing], 3)
          }
          PokemonStatsGraphsView(stadistics: $viewModel.pokemonStadistics)
        }
        .padding(.all, 5)
        .addBackgroundImage(with: "kanto", and: 10)
    }
    
    private func setIconAndName(type: PokemonType, name: String) -> some View {
      HStack(alignment: .center, spacing: 5) {
        
        ZStack(alignment: .center) {
          RoundedRectangle(cornerRadius: 20, style: .continuous)
            .frame(width: 20, height: 20, alignment: .center)
            .foregroundColor(.white)
          PokemonIconView(pokemonType: type)
            .frame(width: 12, height: 12, alignment: .center)
        }
        
        Text(name)
          .font(.system(size: 12, weight: .bold, design: .serif))
          .foregroundColor(.black)
        }
    }
    
    private func PokeballCatchedIcon() -> some View {
        ZStack {
          Circle()
            .frame(width: 35, height: 35, alignment: .center)
            .foregroundColor(.white)
          Image(viewModel.heartIcon)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 28, height: 28, alignment: .center)
            .foregroundColor(.red)
        }
    }
}
