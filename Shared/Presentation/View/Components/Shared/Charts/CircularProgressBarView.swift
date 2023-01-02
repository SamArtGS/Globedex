//
//  CircularProgressBarView.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-12-02.
//

import SwiftUI

struct CircularProgressBarView: View {
    @Binding var value: Float
    @Binding var maxValue: Float
    @Binding var textGraph: String

    init(value: Binding<Float>, maxValue: Binding<Float>  = .constant(150), textGraph: Binding<String>) {
        self._value = value
        self._maxValue = maxValue
        self._textGraph = textGraph
    }

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 3)
                .opacity(0.3)
                .foregroundColor(.white)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.value/self.maxValue, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees: 270.0))
            Text(textGraph)
                .font(.system(size: 10, weight: .medium, design: .rounded))
                .foregroundColor(.white)
        }
    }
}
