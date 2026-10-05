//
// ContentView.swift
// WebBrowser
// 
// Created by syclonefx on 9/28/26
// https://syclonefx.com
// https://github.com/syclonefx
// 

import SwiftUI
import WebKit

struct ContentView: View {
  @FocusState private var isAddressFocused: Bool

  @State private var browserManager: BrowserManager

  init() {
    _browserManager = State(initialValue: BrowserManager())
  }

  var body: some View {
    @Bindable var browserManager = browserManager
    
    NavigationStack {
      // added to push the web content below the navigation bar
      Color.clear
        .frame(height: 0)
      BrowserView()
        .navigationTitle(browserManager.webPage.title)
        .environment(browserManager)
        .onChange(of: browserManager.webPage.url) { _, newURL in
          browserManager.updateNavigationState()
          guard !isAddressFocused, let newURL else { return }
          browserManager.address = newURL.absoluteString
        }
        .toolbar {
          ToolbarItemGroup(placement: .topBarLeading) {
            Button("Back", systemImage: "chevron.backward", action: browserManager.goBack)
              .disabled(!browserManager.canGoBack)

            if browserManager.canGoForward {
              Button("Forward", systemImage: "chevron.forward", action: browserManager.goForward)
            }
          }

          ToolbarItem(placement: .principal) {
            TextField("Address", text: $browserManager.address)
              .focused($isAddressFocused)
              .textCase(.lowercase)
              .onSubmit {
                var submittedAddress = browserManager.address.trimmingCharacters(
                  in: .whitespacesAndNewlines
                )

                if !submittedAddress.starts(with: "http://"),
                   !submittedAddress.starts(with: "https://") {
                  submittedAddress = "http://\(submittedAddress)"
                }

                guard let url = URL(string: submittedAddress),
                      url.host != nil else {
                  return
                }

                browserManager.address = submittedAddress
                browserManager.webPage.load(url)
                isAddressFocused = false
              }
          }
          ToolbarItemGroup(placement: .topBarTrailing) {
            Button("Refresh", systemImage: "arrow.clockwise", action: browserManager.refresh)
          }
        }
    }
  }
}

#Preview {
  ContentView()
}
