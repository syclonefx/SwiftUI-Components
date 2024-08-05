//
// BiomarkerView.swift
// Biomarker
//
// Created by syclonefx on 8/4/24
// https://syclonefx.com
// https://github.com/syclonefx
//

import SwiftUI

struct BiomarkerView: View {
  @State private var readingCount: Double = 1
  var minReading: Double = 0
  var maxReading: Double = 3
  var baseColor: Color = .gray.opacity(0.5)
  var progressColor: Color = .red
  var icon: String
  var readingType: String
  
  var gaugeValue: Double {
    readingCount / maxReading
  }
  
  var gaugeRange: ClosedRange<Double> {
    minReading...maxReading
  }
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 25)
        .stroke(baseColor, lineWidth: 3)
        .frame(width: 175, height: 175)
      VStack {
        Gauge(value: gaugeValue) { }
      currentValueLabel: {
        HStack(spacing: 0) {
          Image(systemName: "plus")
            .foregroundStyle(progressColor)
          ZStack {
            Image(systemName: icon)
              .resizable()
              .scaledToFit()
              .foregroundStyle(.red)
            Image(systemName: "\(icon).fill")
              .resizable()
              .scaledToFit()
              .foregroundStyle(progressColor.opacity(0.5))
          }
          .frame(height: 20)
        }
        
        HStack(spacing: 0) {
          Text("\(String(format: "%.0f", readingCount))")
          Text("/\(String(format: "%.0f", maxReading))")
            .foregroundStyle(.secondary)
        }
      }
      .gaugeStyle(BioMarkGaugeStyle())
        
        Text(readingType)
        Text("At least \(String(format: "%.0f", maxReading))x/day")
          .font(.caption)
          .foregroundStyle(.secondary)
      }
    }
  }
  
  init(readingCount: Double, minReading: Double, maxReading: Double, baseColor: Color, progressColor: Color, icon: String, readingType: String) {
    _readingCount = State(initialValue: readingCount)
    self.minReading = minReading
    self.maxReading = maxReading
    self.baseColor = baseColor
    self.progressColor = progressColor
    self.icon = icon
    self.readingType = readingType
  }
}

#Preview {
  ContentView()
}
