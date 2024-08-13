//
// VideoPost.swift
// FeaturePost
//
// Created by syclonefx on 8/12/24
// https://syclonefx.com
// https://github.com/syclonefx
//

import SwiftUI

struct VideoPost: View {
  @State private var isFavorite: Bool = false
  
  var background: String
  var duration: String
  
  var body: some View {
    Image(background)
      .resizable()
      .scaledToFit()
      .overlay(alignment: .topTrailing) {
        Button {
          withAnimation {
            isFavorite.toggle()
          }
        } label: {
          Image(systemName: "bookmark.fill")
            .offset(x: -10, y: 15)
            .font(.title)
            .foregroundStyle(isFavorite ? .white : .black.opacity(0.5))
        }
      }
      .overlay(alignment: .bottomTrailing) {
        PlayView(duration: duration)
          .offset(x: -10, y: -15)
      }
      .clipShape(RoundedRectangle(cornerRadius: 15))
  }
}

#Preview {
  ContentView()
}
