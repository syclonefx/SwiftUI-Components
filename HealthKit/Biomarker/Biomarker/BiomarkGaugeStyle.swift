//
// BiomarkGaugeStyle.swift
// Biomarker
// 
// Created by syclonefx on 8/4/24
// https://syclonefx.com
// https://github.com/syclonefx
// 

import SwiftUI

struct BioMarkGaugeStyle: GaugeStyle {
  var baseColor: Color = .gray.opacity(0.5)
  var progressColor: Color = .red
  func makeBody(configuration: Configuration) -> some View {
    ZStack {
      /// base circle
      Circle()
        .stroke(baseColor, lineWidth: 5)
      /// progress circle
      Circle()
        .trim(from: 0, to: configuration.value)
        .stroke(progressColor, lineWidth: 5)
        .rotationEffect(.degrees(-90))
      VStack {
        configuration.currentValueLabel
      }
    }
    .frame(width: 100, height: 100)
  }
}
