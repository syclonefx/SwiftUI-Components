//
// ContentView.swift
// Biomarker
//
// Created by syclonefx on 8/4/24
// https://syclonefx.com
// https://github.com/syclonefx
//

import SwiftUI

struct ContentView: View {
  @State private var readingCount: Double = 1
  var body: some View {
    BiomarkerView(
      readingCount: readingCount,
      minReading: 0,
      maxReading: 3,
      baseColor: .gray.opacity(0.5),
      progressColor: .red,
      icon: "drop",
      readingType: "Blood Glucose")
  }
}

#Preview {
  ContentView()
}
