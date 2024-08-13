//
// PlayView.swift
// FeaturePost
// 
// Created by syclonefx on 8/6/24
// https://syclonefx.com
// https://github.com/syclonefx
// 

import SwiftUI

struct PlayView: View {
  var duration: String
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 15)
        .fill(.black.opacity(0.5))
        .frame(width: 90, height: 45)
      HStack {
        Image(systemName: "arrowtriangle.right.fill")
          .resizable()
          .scaledToFit()
          .foregroundStyle(.white)
          .frame(width: 20)
        Text(duration)
          .font(.title2)
          .foregroundStyle(.white)
      }
    }
  }
}

#Preview {
  ContentView()
}
