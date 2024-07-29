//
// RectangleDivider.swift
// DateTimeProductPicker
// 
// Created by syclonefx on 7/28/24
// https://syclonefx.com
// https://github.com/syclonefx
// 

import SwiftUI

extension ShapeStyle where Self == Color {
  // https://www.hackingwithswift.com/
  static var darkBackground: Color {
    Color(red: 1.2, green: 1.2, blue: 1.2)
  }
  
  static var lightBackground: Color {
    Color(red: 0.2, green: 0.2, blue: 0.2)
  }
}

struct RectangleDivider: View {
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View {
    Rectangle()
      .frame(height: 1.0)
      .foregroundStyle(colorScheme == .dark ? .lightBackground : .darkBackground)
  }
}

#Preview {
    RectangleDivider()
}
