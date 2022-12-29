//
//  PokemonStatsGraphsView.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-12-27.
//

import SwiftUI

struct PokemonStatsGraphsView: View {

    @Binding var stadistics: Pokemon.Stadistic

    var body: some View {
        HStack(alignment: .center, spacing: 7) {
          Spacer()
          CircularProgressBarView(
            value: $stadistics.hp,
            textGraph: .constant("HP")
          )
          .frame(width: 18, height: 18, alignment: .center)
          CircularProgressBarView(
            value: $stadistics.attack,
            textGraph: .constant("AT")
          )
          .frame(width: 18, height: 18, alignment: .center)
          CircularProgressBarView(
            value: $stadistics.defense,
            textGraph: .constant("DF")
          )
          .frame(width: 18, height: 18, alignment: .center)
          CircularProgressBarView(
            value: $stadistics.specialAttack,
            textGraph: .constant("SA")
          )
          .frame(width: 18, height: 18, alignment: .center)
          CircularProgressBarView(
            value: $stadistics.specialDefense,
            textGraph: .constant("SD")
          )
          .frame(width: 18, height: 18, alignment: .center)
          CircularProgressBarView(
            value: $stadistics.speed,
            textGraph: .constant("SP")
          )
          .frame(width: 18, height: 18, alignment: .center)
          Spacer()
        }
    }
}
