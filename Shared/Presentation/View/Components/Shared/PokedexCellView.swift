//
//  PokemonGridView.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-11-27.
//

import SwiftUI

struct PokemonCellView: View {
    
    @Binding var sizeContainer: CGSize
    @State var progressRotation: Double = 0.0
    @StateObject var viewModel: PokemonCellViewModel

    var body: some View {
        ZStack(alignment: .leading) {

          Image("kanto")
            .resizable()
            .blur(radius: 10)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                  .stroke(.gray, lineWidth: 1)
            )
            .padding(1)

            VStack(alignment: .leading) {
              HStack(alignment: .center, spacing: 0) {
                VStack(alignment: .leading){
                  HStack(alignment: .center, spacing: 5) {
                    ZStack(alignment: .center){
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .frame(width: 20, height: 20, alignment: .center)
                            .foregroundColor(.white)
                        Image(systemName: viewModel.pokemonTypeIcons.first ?? "ellipsis")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 12, height: 12, alignment: .center)
                            .foregroundColor(.blue)
                    }
                    Text(viewModel.pokemonNameLabel)
                      .font(.system(size: 12, weight: .bold, design: .serif))
                      .foregroundColor(.black)
                  }
                  .padding(.leading, 5)
                        
                  AsyncImage(
                    url: URL(string: viewModel.pokemonImageLink ?? ""),
                    content: { image in
                      image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        
                    }, placeholder: {
                        Image("icons8-fight_pokemon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .rotationEffect(.degrees(progressRotation))
                        .onAppear {
                            withAnimation(.linear(duration: 1).repeatForever(autoreverses: false).speed(2)) {
                                progressRotation = 360.0
                            }
                        }
                        
                        
                    }
                  )
                  Spacer()
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 3) {
                  
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
                  Text(viewModel.pokemonNumberLabel)
                    .foregroundColor(.black)
                    .font(.system(size: 12, weight: .semibold, design: .monospaced))
                  Spacer()
                  Text("Weak")
                    .foregroundColor(.black)
                    .font(.system(size: 10, weight: .semibold, design: .default))
                    typeStack
                  Spacer()
                }
                .padding([.top,.trailing], 3)
                }
                
                HStack(alignment: .center) {
                    Spacer()
                    ProgressBar(progress: $viewModel.pokemonStadistics.hp, textGraph: .constant("HP"))
                        .frame(width: 18, height: 18, alignment: .leading)
                    ProgressBar(progress: $viewModel.pokemonStadistics.attack, textGraph: .constant("AT"))
                        .frame(width: 18, height: 18, alignment: .leading)
                    ProgressBar(progress: $viewModel.pokemonStadistics.defense, textGraph: .constant("DF"))
                        .frame(width: 18, height: 18, alignment: .leading)
                    ProgressBar(progress: $viewModel.pokemonStadistics.specialAttack, textGraph: .constant("SA"))
                        .frame(width: 18, height: 18, alignment: .leading)
                    ProgressBar(progress: $viewModel.pokemonStadistics.specialDefense, textGraph: .constant("SD"))
                        .frame(width: 18, height: 18, alignment: .leading)
                    ProgressBar(progress: $viewModel.pokemonStadistics.speed, textGraph: .constant("SP"))
                        .frame(width: 18, height: 18, alignment: .leading)
                    Spacer()
                }
            }
            .padding(.all, 5)
        }
        .frame(width: sizeContainer.width, height: sizeContainer.height, alignment: .center)
    }
    
    private var typeStack: some View {
        
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

struct ProgressBar: View {
    @Binding var progress: Float
    @Binding var textGraph: String
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 3)
                .opacity(0.3)
                .foregroundColor(.white)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress/250, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees: 270.0))
            Text(textGraph)
                .font(.system(size: 10, weight: .medium, design: .rounded))
        }
    }
}

struct PokemonCellView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PokemonCellView(sizeContainer: .constant(
                CGSize(
                    width: 180,
                    height: 200
                )
            ),
            viewModel: PokemonCellViewModel(number: 1))
        }
    }
}
