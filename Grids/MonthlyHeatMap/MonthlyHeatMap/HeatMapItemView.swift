//
// HeatMapItemView.swift
// MonthlyHeatMap
//
// Created by syclonefx on 8/5/24
// https://syclonefx.com
// https://github.com/syclonefx
//

import SwiftUI

struct HeatMapItemView: View {
  var heatMapItem: HeatMapItem
  var color: Color = .gray
  var active: Bool {
    heatMapItem.weight > 0.25 ? true : false
  }
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 5)
        .fill(active ? color.opacity(heatMapItem.weight) : .secondary.opacity(0.5))
        .frame(width: 33, height: 23)
    }
  }
}

#Preview {
  HeatMapItemView(heatMapItem: MockData.examples(month: 8)[0])
}
