//
//  BarChartView.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-12-28.
//

import SwiftUI

struct DataItem: Identifiable {
    let id = UUID()
    let name: String
    let value: Float
}

struct BarChartView: View {
    var data: [DataItem]
    var maxValue: CGFloat
    var body: some View {
      GeometryReader { gr in
        ChartAreaView(data: data, maxValue: maxValue)
      }
    }
}

struct ChartAreaView: View {
    
    var data: [DataItem]
    var maxValue: CGFloat

    var body: some View {
      GeometryReader { gr in
        let fullBarHeight = gr.size.height * 0.90
          ZStack {
            VStack {
              HStack(spacing:0) {
                ForEach(data) { item in
                    BarView(
                      name: item.name,
                      value: Double(item.value),
                      maxValue: maxValue,
                      fullBarHeight: Double(fullBarHeight))
                }
              }
              .padding(4)
            }
          }
        }
    }
}

struct BarView: View {
    var name: String
    var value: Double
    var maxValue: Double
    var fullBarHeight: Double
    var body: some View {
      let barHeight = (Double(fullBarHeight) / maxValue) * value
      VStack {
        Spacer()
          ZStack {
            VStack {
              Spacer()
                RoundedRectangle(cornerRadius:5.0)
                  .fill(Color.blue)
                  .animation(.linear, value: value)
                  .frame(height: CGFloat(barHeight), alignment: .trailing)
                }
                VStack {
                  Spacer()
                  Text("\(value, specifier: "%.0F")")
                    .font(.footnote)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                }
          }
          Text(name)
            .font(.system(size: 12, weight: .light, design: .serif))
        }
        .padding(.horizontal, 4)
  }
}
