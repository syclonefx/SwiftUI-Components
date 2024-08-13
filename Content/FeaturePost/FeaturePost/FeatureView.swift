//
// FeatureView.swift
// FeaturePost
//
// Created by syclonefx on 8/6/24
// https://syclonefx.com
// https://github.com/syclonefx
//

import SwiftUI

struct FeatureView: View {
  var date: Date
  var title: String
  var post: String
  
  var dateHeader: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMMM yyyy"
    return dateFormatter.string(from: date)
  }
  
  var body: some View {
    VStack(spacing: 0) {
      Image("feature")
        .resizable()
        .scaledToFit()
      ZStack {
        Image("feature")
          .resizable()
          .scaledToFit()
          .blur(radius: 50)
          .rotationEffect(.degrees(180))
        VStack(alignment: .leading, spacing: 15) {
          Text(dateHeader)
            .font(.title3)
            .textCase(.uppercase)
            .foregroundStyle(.white.opacity(0.50))
          Text(title)
            .font(.largeTitle)
            .bold()
            .foregroundStyle(.white)
          Text(post)
            .font(.title2)
            .foregroundStyle(.white.opacity(0.50))
        }
        .frame(maxWidth: .infinity)
        .padding()
        .padding(.bottom, 10)
        .background(.black.opacity(0.25))
      }
    }
    .background(Color(red: 25 / 255, green: 60 / 255, blue: 131 / 255))
    .clipShape(RoundedRectangle(cornerRadius: 15))
  }
}

#Preview {
  ContentView()
}
