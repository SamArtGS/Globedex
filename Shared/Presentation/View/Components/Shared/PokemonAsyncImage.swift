//
//  PokemonAsyncImage.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-12-28.
//

import SwiftUI

struct PokemonAsyncImage: View {

    var imageLink: String?
    
    var body: some View {
        AsyncImage(
          url: URL(string: imageLink ?? ""),
          content: { image in
            image
              .resizable()
              .aspectRatio(contentMode: .fit)
          },
          placeholder: {
            Image("icons8-fight_pokemon")
              .resizable()
              .aspectRatio(contentMode: .fit)
          }
        )
    }
}
