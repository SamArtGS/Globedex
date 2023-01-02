//
//  TrainerView.swift
//  Globedex (iOS)
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-12-26.
//

import SwiftUI

struct TrainerView: View {

    @State private var downloadAmount = 100.0

    var body: some View {
        ScrollView(showsIndicators: false){
          LazyVStack(alignment: .leading, spacing: 10) {
              ZStack(alignment: .bottomLeading) {
                    Image("kanto")
                      .resizable()
                      .frame(height: 300)
                    HStack {
                        Circle()
                            .frame(width: 100, height: 100, alignment: .center)
                        VStack(alignment: .leading) {
                            Text("Samuel Garrido")
                                .font(.system(size: 24, weight: .heavy, design: .rounded))
                                .foregroundColor(.white)
                            Text("Blanche")
                                .icon{
                                    Image(systemName: "circle.fill")
                                }
                                .font(.system(size: 14, weight: .bold, design: .default))
                                .foregroundColor(.white)
                            ProgressView(value: downloadAmount, total: 100) {
                                Text("Nivel 21")
                                    .font(.system(size: 18, weight: .heavy, design: .monospaced))
                                .foregroundColor(.white)
                                .icon {
                                    Image(systemName: "star.fill")
                                }
                            }
                        }
                        VStack(alignment: .trailing){
                          Image(systemName: "square.and.arrow.up")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20)
                                .foregroundColor(.white)
                        }
                    }
                    .padding([.leading, .bottom, .trailing], 15)
                }
                Text("Insignias")
                  .font(.system(size: 24, weight: .bold, design: .rounded))
                  .padding(.leading, 10)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(alignment: .center, spacing: 10) {
                        ForEach(0..<10) { _ in
                            Circle()
                                .frame(width: 60, height: 60)
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                }
                Text("Colección")
                  .font(.system(size: 24, weight: .bold, design: .rounded))
                  .padding([.leading, .bottom], 10)
                ForEach(0..<100){ i in
                  PokemonCatchList()
                        .padding(.horizontal, 10)
                }
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TrainerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TrainerView()
        }
    }
}
