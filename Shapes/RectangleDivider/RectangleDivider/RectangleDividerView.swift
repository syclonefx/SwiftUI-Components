//
//  RectangleDividerView.swift
//  RectangleDivider
//
//  Created by syclonefx on 4/15/24.
//  Paul Hudson
//  https://www.hackingwithswift.com

import SwiftUI

struct RectangleDividerView: View {
  var body: some View {
    Rectangle()
      .frame(height: 2)
      .foregroundStyle(.black)
      .padding(.vertical)
  }
}

#Preview {
  RectangleDividerView()
}
