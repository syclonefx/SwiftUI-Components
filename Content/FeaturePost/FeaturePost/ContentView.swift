//
// ContentView.swift
// FeaturePost
//
// Created by syclonefx on 8/6/24
// https://syclonefx.com
// https://github.com/syclonefx
//

import SwiftUI

struct ContentView: View {
  let post = """
  In this edition: Bring your app to new markets, go behind the design with Lost in Play, and more.
  """
  let background = "post3_2x"
  let duration = "17m"
  
  var body: some View {
    VStack {
      FeatureView(date: Date(), title: "Hello Developer", post: post)
      
      VideoPost(background: background, duration: duration)
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
