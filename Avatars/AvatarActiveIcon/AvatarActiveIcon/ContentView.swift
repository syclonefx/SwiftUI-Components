//
//  ContentView.swift
//  AvatarActiveIcon
//
//  Created by Chuck Perdue on 7/26/24.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    AvatarView(image: "me2", height: 150, backgroundColor: .gray, showActiveIndicator: true, indicatorAlignment: .topTrailing, iconImage: "camera", activeIndicatorColor: .green, iconColor: .black)
    
    AvatarView(image: "me2", height: 120, backgroundColor: .blue, showActiveIndicator: false)
  }
}

#Preview {
  ContentView()
}
