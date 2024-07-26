//
//  ContentView.swift
//  SocialMediaProfile
//
//  Created by syclonefx on 7/25/24.
//  https://syclonefx.com

import SwiftUI

struct ContentView: View {
  @State private var socialAccounts = ["twitter", "facebook", "instagram", "reddit"]
  var body: some View {
    VStack(spacing: 5) {
      ProfileView(profileImage: "avatar1", name: "Michelle", title: "Lead Programmer", socialAccounts: socialAccounts)
      ProfileView(profileImage: "avatar2", name: "Sam", title: "UX/UI Lead", socialAccounts: socialAccounts)
      ProfileView(profileImage: "avatar3", name: "Stacey", title: "Marketing Manager", socialAccounts: socialAccounts)
    }
  }
}

#Preview {
  ContentView()
}
