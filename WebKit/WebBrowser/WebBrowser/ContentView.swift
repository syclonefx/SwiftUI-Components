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

  @State private var webPage = WebPage()
  @State private var address = "https://apple.com"

  @State private var canGoBack = false
  @State private var canGoForward = false

  var body: some View {
    NavigationStack {
      Color.clear
        .frame(height: 0)
      WebView(webPage)
        .onAppear{
          webPage.load(URL(string: address))
        }
        .onChange(of: webPage.url) { _, newURL in
          updateNavigationState()
          guard !isAddressFocused, let newURL else { return }
          address = newURL.absoluteString
        }
        .onChange(of: webPage.isLoading) {
          updateNavigationState()
        }
        .safeAreaInset(edge: .top) {
          if webPage.isLoading {
            ProgressView(value: webPage.estimatedProgress)
              .progressViewStyle(.linear)
          }
        }
        .toolbar {
          ToolbarItemGroup(placement: .topBarLeading) {
            Button("Back", systemImage: "chevron.backward", action: goBack)
              .disabled(!canGoBack)

            if canGoForward {
              Button("Forward", systemImage: "chevron.forward", action: goForward)
            }
          }

          ToolbarItem(placement: .principal) {
            TextField("Address", text: $address)
              .focused($isAddressFocused)
              .textCase(.lowercase)
              .onSubmit {
                var submittedAddress = address.trimmingCharacters(
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

                address = submittedAddress
                webPage.load(url)
                isAddressFocused = false
              }
          }
          ToolbarItemGroup(placement: .topBarTrailing) {
            Button("Refresh", systemImage: "arrow.clockwise", action: refresh)
          }
        }
    }
  }

  func goBack() {
    guard let page = webPage.backForwardList.backList.last else { return }
    webPage.load(page)
  }

  func goForward() {
    guard let page = webPage.backForwardList.forwardList.first else { return }
    webPage.load(page)
  }

  func refresh() {
    webPage.reload()
  }

  func updateNavigationState() {
    let list = webPage.backForwardList
    canGoBack = !list.backList.isEmpty
    canGoForward = !list.forwardList.isEmpty
  }
}

#Preview {
  ContentView()
}
