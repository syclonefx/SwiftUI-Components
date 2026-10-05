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
  @State private var webPage: WebPage

  init() {
    let webPage = WebPage()
    _webPage = State(initialValue: webPage)
    _browserManager = State(initialValue: BrowserManager(page: webPage))
  }

  var body: some View {
    NavigationStack {
      Color.clear
        .frame(height: 0)
      BrowserView()
        .navigationTitle(browserManager.webPage.title)
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
