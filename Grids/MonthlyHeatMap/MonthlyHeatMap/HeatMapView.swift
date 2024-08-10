//
// HeatMapView.swift
// MonthlyHeatMap
//
// Created by syclonefx on 8/5/24
// https://syclonefx.com
// https://github.com/syclonefx
//

import SwiftUI

struct HeatMapView: View {
  let columns = [GridItem(.adaptive(minimum: 28))]
  var color: Color = Color(red: 60 / 255, green: 238 / 255, blue: 73 / 255)
  var date = Date()
  var heatMapItems: [HeatMapItem]
  
  var title: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMMM yyyy"
    return dateFormatter.string(from: date)
  }
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(title)
      LazyVGrid(columns: columns, spacing: 5) {
        ForEach(heatMapItems) { item in
          HeatMapItemView(heatMapItem: item, color: color)
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
