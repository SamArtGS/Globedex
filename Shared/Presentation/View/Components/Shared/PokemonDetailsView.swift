//
//  PokemonDetailsView.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-12-28.
//

import SwiftUI

struct PokemonDetailsView: View {

    @StateObject var viewModel: PokeonDetailsViewModel

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                ZStack(alignment: .bottom) {
                    LinearGradient(colors: [.red, .orange], startPoint: .leading, endPoint: .trailing)
                        .frame(height: 400, alignment: .center)
                    VStack(alignment: .center, spacing: 30) {
                        PokemonAsyncImage(imageLink: viewModel.imageURL)
                          .frame(width: 150, height: 150, alignment: .center)
                        HStack(alignment: .center, spacing: 25) {
                            Text(viewModel.weight)
                            .icon(size: 18) {
                              Image(systemName: "scalemass.fill")
                            }
                            Text(viewModel.height)
                            .icon(size: 24) {
                              Image(systemName: "ruler.fill")
                            }
                            Text(viewModel.experience)
                            .icon(size: 24) {
                              Image(systemName: "gamecontroller.fill")
                            }
                        }
                    }
                    .padding(.bottom, 20)
                }
                Text("Tipo")
                    .font(.system(size: 24, weight: .bold, design: .default))
                
                .padding([.leading, .trailing], 15)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))], alignment: .center) {
                    ForEach(viewModel.type, id: \.self) { type in
                        typeBadge(type: type)
                    }
                }
                
                .padding([.leading, .trailing], 15)
                Text("Estadísticas")
                    .font(.system(size: 24, weight: .bold, design: .default))
                
                .padding([.leading, .trailing], 15)
                BarChartView(data: viewModel.chartData, maxValue: 140)
                  .frame(height: 200, alignment: .center)
                
                .padding([.leading, .trailing], 15)
                HStack(alignment: .top, spacing: 40) {
                    VStack(alignment: .center, spacing: 10){
                        Text("Movements")
                            .font(.system(size: 24, weight: .bold, design: .default))
                        ForEach(viewModel.movements, id: \.self) { move in
                            Text(move)
                        }
                    }
                    VStack(alignment: .center, spacing: 10){
                        Text("Abilities")
                            .font(.system(size: 24, weight: .bold, design: .default))
                        ForEach(viewModel.abilities, id: \.self) { move in
                            Text(move)
                        }
                    }
                }
                
                .padding([.leading, .trailing], 15)
                HStack(alignment: .top, spacing: 10) {
                    VStack(alignment: .center, spacing: 10){
                        Text("Efective")
                            .font(.system(size: 16, weight: .bold, design: .default))
                        ForEach(Set(viewModel.greatDamage).reversed(), id: \.self) { type in
                            typeBadge(type: type)
                        }
                    }
                    VStack(alignment: .center, spacing: 10){
                        Text("Weakness")
                            .font(.system(size: 16, weight: .bold, design: .default))
                        ForEach(Set(viewModel.weakness).reversed(), id: \.self) { type in
                            typeBadge(type: type)
                        }
                    }
                    VStack(alignment: .center, spacing: 10){
                        Text("Defense")
                            .font(.system(size: 16, weight: .bold, design: .default))
                        ForEach(Set(viewModel.defenses).reversed(), id: \.self) { type in
                            typeBadge(type: type)
                        }
                    }
                    VStack(alignment: .center, spacing: 10){
                        Text("Normal")
                            .font(.system(size: 16, weight: .bold, design: .default))
                        ForEach(Set(viewModel.normalDamage).reversed(), id: \.self) { type in
                            typeBadge(type: type)
                        }
                    }
                }
                .padding([.leading, .trailing], 15)
                .padding(.top, 20)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationTitle(viewModel.title)
    }
    
    private func typeBadge(type: PokemonType) -> some View {
      ZStack{
        RoundedRectangle(cornerRadius: 30, style: .circular)
          .foregroundColor(.white)
          .overlay(
              RoundedRectangle(cornerRadius: 30)
                .stroke(.gray, lineWidth: 1)
          )
          .frame(height: 30)
        HStack(alignment: .center, spacing: 5) {
          PokemonIconView(pokemonType: type)
            .frame(width: 12)
          Text(type.rawValue)
            .font(.system(size: 14, weight: .bold, design: .rounded))
            .foregroundColor(.black)
        }
      }
    }
}

struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsView(viewModel: PokeonDetailsViewModel(number: 4))
    }
}
