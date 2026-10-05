//
// BrowserView.swift
// WebBrowser
//
// Created by syclonefx on 10/4/26
// https://syclonefx.com
// https://github.com/syclonefx
//

import SwiftUI
import WebKit

struct BrowserView: View {
  @Environment(BrowserManager.self) var browserManager
  @Environment(\.openURL) private var openURL
  
//  @State private var browserManager: BrowserManager
//  @State private var webPage: WebPage
//
//  init() {
//    let webPage = WebPage()
//    _webPage = State(initialValue: webPage)
//    _browserManager = State(initialValue: BrowserManager(page: webPage))
//  }
  
  var body: some View {
    @Bindable var browserManger = browserManager

    WebView(browserManager.webPage)
      .scrollBounceBehavior(.basedOnSize, axes: [.vertical, .horizontal])
      .webViewLinkPreviews(.enabled)
      .webViewBackForwardNavigationGestures(.enabled)
      .webViewTextSelection(.enabled)
      .webViewElementFullscreenBehavior(.enabled)
      .onAppear{
        browserManager.webPage.load(URL(string: browserManager.address))
      }
      .onChange(of: browserManager.webPage.isLoading) {
        browserManager.updateNavigationState()
      }
      .safeAreaInset(edge: .top) {
        if browserManager.webPage.isLoading {
          ProgressView(value: browserManager.webPage.estimatedProgress)
            .progressViewStyle(.linear)
        }
      }
  }
}

#Preview {
  BrowserView()
}
