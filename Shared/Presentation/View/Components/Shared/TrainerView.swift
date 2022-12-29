//
//  TrainerView.swift
//  Globedex (iOS)
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-12-26.
//

import SwiftUI

struct TrainerView: View {
    var body: some View {
        ScrollView(showsIndicators: false){
          LazyVStack(alignment: .leading, spacing: 10) {
              ZStack(alignment: .bottomLeading) {
                    Image("kanto")
                      .resizable()
                      .frame(height: 160)
                    HStack {
                        Circle()
                            .frame(width: 100, height: 100, alignment: .center)
                        VStack {
                            Text("Samuel")
                            Text("Level 1")
                        }
                        Spacer()
                        VStack(alignment: .trailing){
                          Image(systemName: "star")
                        }
                    }
                    .padding([.leading, .bottom], 8)
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
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct TrainerView_Previews: PreviewProvider {
    static var previews: some View {
        TrainerView()
    }
}
