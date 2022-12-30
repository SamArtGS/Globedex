//
//  ViewModifiers.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-12-28.
//

import SwiftUI

struct StatsViewStack: ViewModifier {
    func body(content: Content) -> some View {
        content
    }
}

struct RoundedBackgroundImage: ViewModifier {
    
    var imageName: String
    var cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        ZStack(alignment: .center) {
          Image(imageName)
            .resizable()
            .blur(radius: 10)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                  .stroke(.gray, lineWidth: 1)
            )
            content
        }
    }
}

struct LabelWithImage: ViewModifier {
    var image: () -> Image
    var size: CGFloat
    func body(content: Content) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 5) {
            image()
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size)
            content
        }
    }
}


extension View {
    func addBackgroundImage(with name: String, and radius: Int) -> some View {
        modifier(RoundedBackgroundImage(imageName: name, cornerRadius: CGFloat(radius)))
    }
    func icon(size: CGFloat = 12, content: @escaping () -> Image) -> some View {
        modifier(LabelWithImage(image: content, size: size))
    }
}
