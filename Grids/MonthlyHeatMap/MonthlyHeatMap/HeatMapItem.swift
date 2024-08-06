//
// HeatMapItem.swift
// MonthlyHeatMap
// 
// Created by syclonefx on 8/5/24
// https://syclonefx.com
// https://github.com/syclonefx
// 

import Foundation

struct HeatMapItem: Identifiable {
  let id: UUID = UUID()
  let date: Date
  let weight: Double
}
