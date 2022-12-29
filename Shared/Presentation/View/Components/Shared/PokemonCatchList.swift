//
//  PokemonCatchList.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-12-26.
//

import SwiftUI

struct PokemonCatchList: View {
   
    // @Binding var pokemon: Pokemon
    
    var body: some View {
        ZStack{
          RoundedRectangle(cornerRadius: 15)
            .frame(height: 100)
            .foregroundColor(.mint)
          HStack(spacing: 10) {
              
            Image("squirtle")
              .resizable()
              .frame(width: 80, height: 80)
              .aspectRatio(contentMode: .fit)
              
            VStack(alignment: .leading) {
              Text("Bulbasaur")
                .font(.system(size: 18, weight: .bold, design: .serif))
                .fixedSize()
              HStack(alignment: .firstTextBaseline, spacing: 10) {
                Text("30/Dic/2022")
                  .font(.system(size: 12, weight: .light, design: .serif))
                  .fixedSize()
                  .icon {
                    Image(systemName: "calendar")
                  }
                Text("Villaher, Tab.")
                  .font(.system(size: 12, weight: .light, design: .serif))
                  .fixedSize()
                  .icon {
                    Image(systemName: "location.fill")
                  }
              }
              PokemonStatsGraphsView(
                stadistics: .constant(
                  .init(
                    hp: 10,
                    attack: 10,
                    defense: 10,
                    specialAttack: 10,
                    specialDefense: 10,
                    speed: 10))
              )
            }
              
            Spacer()

            VStack(alignment: .trailing) {
              Text("#001")
                .font(.system(size: 18, weight: .bold, design: .monospaced))
              Spacer()
              Image("icons8-ultra_ball")
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .aspectRatio(contentMode: .fit)
            }
          }
          .padding(10)
        }
    }
}

struct PokemonCatchList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCatchList()
            .frame(width: .infinity, height: 60, alignment: .center)
    }
}
