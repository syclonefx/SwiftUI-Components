//
//  ContentView.swift
//  RectangleDivider
//
//  Created by syclonefx on 4/15/24.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      RectangleDividerView()
      Text("Hello, world!")
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
