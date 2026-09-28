//
// BentoTitle.swift
// BentoLayout
// 
// Created by syclonefx on 9/28/26
// https://syclonefx.com
// https://github.com/syclonefx
// 

import SwiftUI

struct BentoTile<Content: View>: View {
  let content: Content
  var fillColor: Color

  init(fillColor: Color? = nil, @ViewBuilder content: () -> Content) {
    self.fillColor = fillColor ?? .secondary.opacity(0.2)
    self.content = content()
  }

  var body: some View {
    RoundedRectangle(cornerRadius: 16)
      .fill(fillColor)
      .overlay {
        content
      }
      .clipShape(.rect(cornerRadius: 16))
  }
}

#Preview {
  ContentView()
}
