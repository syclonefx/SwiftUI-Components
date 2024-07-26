//
//  ContentView.swift
//  SocialMediaProfile
//
//  Created by syclonefx on 7/25/24.
//  https://syclonefx.com

import SwiftUI

struct ContentView: View {
  @Environment(\.colorScheme) var colorScheme
  
  @State private var socialAccounts = ["github", "twitter", "facebook", "instagram", "reddit"]
  
  var topColor: Color {
    if colorScheme == .dark {
      return .gray.opacity(0.5)
    }
    return .cyan.opacity(0.3)
  }
  
  var bottomColor: Color {
    if colorScheme == .dark {
      return .white.opacity(0.5)
    }
    return .blue.opacity(0.7)
  }
  
  var body: some View {
    ZStack{
      LinearGradient(gradient: Gradient(stops: [
        .init(color: topColor, location: 0.4),
        .init(color: bottomColor, location: 0.8)
      ]), startPoint: .topLeading, endPoint: .bottomTrailing
      )
      .ignoresSafeArea()
      VStack(spacing: 5) {
        ProfileView(profileImage: "avatar1", name: "Michelle", title: "Lead Programmer", socialAccounts: socialAccounts)
        ProfileView(profileImage: "avatar2", name: "Sam", title: "UX/UI Lead", socialAccounts: socialAccounts)
        ProfileView(profileImage: "avatar3", name: "Stacey", title: "Marketing Manager", socialAccounts: socialAccounts)
      }
    }
  }
}

#Preview {
  ContentView()
}
