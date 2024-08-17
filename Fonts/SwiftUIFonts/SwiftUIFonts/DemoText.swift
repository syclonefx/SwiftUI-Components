//
// DemoText.swift
// SwiftUIFonts
// 
// Created by syclonefx on 8/16/24
// https://syclonefx.com
// https://github.com/syclonefx
// 

import SwiftUI

struct DemoText: View {
  @Environment(\.colorScheme) var colorScheme
  
  let font: Font
  @Binding var text: String
  @Binding var fontWeight: Font.Weight
  
  var fontName: String {
    switch font {
      case .largeTitle:
        return "Large Title"
      case .title:
        return "Title"
      case .title2:
        return "Title 2"
      case .title3:
        return "Title 3"
      case .headline:
        return "Headline"
      case .callout:
        return "Callout"
      case .subheadline:
        return "Sub Headline"
      case .footnote:
        return "Footnote"
      case .caption:
        return "Caption"
      case .caption2:
        return "Caption 2"
      default:
        return "Unknown"
    }
  }
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(fontName)
          .font(.headline)
          .foregroundStyle(colorScheme == .dark ? .yellow : .primary)
        Text(text == "" ? "Enter Some Text" : text)
          .font(font)
          .fontWeight(fontWeight)
          .foregroundStyle(text == "" ? .secondary : .primary)
      }
      Spacer()
    }
  }
}

#Preview {
    ContentView()
}
