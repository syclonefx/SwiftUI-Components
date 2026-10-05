//
// WebBrowserApp.swift
// WebBrowser
//
// Created by syclonefx on 9/28/26
// https://syclonefx.com
// https://github.com/syclonefx
//

import SwiftUI
import WebKit

@main
struct WebBrowserApp: App {
  @FocusedValue(BrowserManager.self) var browserManager
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(\.openURL, OpenURLAction { url in
          guard let browserManager else {
            return .systemAction(url)
          }
          browserManager.openURL(url)
          return .handled
        })
    }
  }
}
