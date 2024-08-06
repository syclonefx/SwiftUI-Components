//
// Date+Ext.swift
// MonthlyHeatMap
// 
// Created by syclonefx on 8/5/24
// https://syclonefx.com
// https://github.com/syclonefx
// 

import Foundation

extension Date {
  var startOfMonth: Date {
    
    let calendar = Calendar(identifier: .gregorian)
    let components = calendar.dateComponents([.year, .month], from: self)
    
    return  calendar.date(from: components)!
  }
  
  var endOfMonth: Date {
    var components = DateComponents()
    components.month = 1
    components.second = -1
    return Calendar(identifier: .gregorian).date(byAdding: components, to: startOfMonth)!
  }
}
