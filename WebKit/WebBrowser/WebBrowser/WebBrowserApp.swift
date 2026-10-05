//
// WebBrowserApp.swift
// WebBrowser
//
// Created by syclonefx on 9/28/26
// https://syclonefx.com
// https://github.com/syclonefx
//

import SwiftUI

@main
struct WebBrowserApp: App {
  @FocusedValue(BrowserManager.self) var browserManager
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(browserManager)
    }
  }
}
