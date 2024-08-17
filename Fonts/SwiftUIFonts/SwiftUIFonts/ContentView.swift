//
// ContentView.swift
// SwiftUIFonts
//
// Created by syclonefx on 8/16/24
// https://syclonefx.com
// https://github.com/syclonefx
//

import SwiftUI

enum FontWeight: String, CaseIterable, Identifiable {
  var id: Self { self }
  
  case regular, medium, semiBold, bold, heavy, black, light, thin, ultraLight
}

struct ContentView: View {
  @Environment(\.colorScheme) var colorScheme
  
  @State private var text: String = "Hello, World!"
  @State private var fontWeightValue: FontWeight = .regular
  
  @State private var fontWeight: Font.Weight = .regular
  
  var body: some View {
      ScrollView {
        VStack(alignment: .leading, spacing: 10) {
          DemoText(font: .largeTitle, text: $text, fontWeight: $fontWeight)
          DemoText(font: .title, text: $text, fontWeight: $fontWeight)
          DemoText(font: .title2, text: $text, fontWeight: $fontWeight)
          DemoText(font: .title3, text: $text, fontWeight: $fontWeight)
          DemoText(font: .headline, text: $text, fontWeight: $fontWeight)
          DemoText(font: .callout, text: $text, fontWeight: $fontWeight)
          DemoText(font: .subheadline, text: $text, fontWeight: $fontWeight)
          DemoText(font: .footnote, text: $text, fontWeight: $fontWeight)
          DemoText(font: .caption, text: $text, fontWeight: $fontWeight)
          DemoText(font: .caption2, text: $text, fontWeight: $fontWeight)
        }
        .padding()
      }
      .scrollBounceBehavior(.basedOnSize)
      .scrollIndicators(.hidden)
    
      VStack(alignment: .leading) {
        TextField("Demo Text", text: $text)
          .textFieldStyle(.roundedBorder)
        
        Picker("Font Weight", selection: $fontWeightValue) {
          ForEach(FontWeight.allCases) {
            Text($0.rawValue).tag($0.id)
          }
        }
        .tint(colorScheme == .dark ? .yellow : .primary)
        .onChange(of: fontWeightValue) {
          switch fontWeightValue {
            case .regular:
              fontWeight = .regular
            case .medium:
              fontWeight = .medium
            case .semiBold:
              fontWeight = .semibold
            case .heavy:
              fontWeight = .heavy
            case .bold:
              fontWeight = .bold
            case .black:
              fontWeight = .black
            case .thin:
              fontWeight = .thin
            case .light:
              fontWeight = .light
            case .ultraLight:
              fontWeight = .ultraLight
          }
        }
      }
    .padding()
  }
}

#Preview {
  ContentView()
}
