//
// ContentView.swift
// MonthlyHeatMap
//
// Created by syclonefx on 8/5/24
// https://syclonefx.com
// https://github.com/syclonefx
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    HeatMapView(date: Date())
    .padding()
  }
}

#Preview {
  ContentView()
}

struct MockData {
  static func examples(month: Int) -> [HeatMapItem] {
    let calendar = Calendar.current
    
    var heatMapItems: [HeatMapItem] = []
    let dateComponents = calendar.dateComponents([.day, .month, .year], from: Date())
    var components = DateComponents()
    components.month = month
    components.day = 1
    components.year = dateComponents.year
    
    guard let date = calendar.date(from: components) else { return heatMapItems }
    if let range = calendar.range(of: .day, in: .month, for: date) {
      for number in range {
        components.day = number
        if let newDate = calendar.date(from: components) {
          let item = HeatMapItem(date: newDate, weight: Double.random(in: 0...1))
          heatMapItems.append(item)
        }
      }
    }
    return heatMapItems
  }
}
