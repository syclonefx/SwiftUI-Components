//
// BrowserManager.swift
// WebBrowser
// 
// Created by syclonefx on 10/4/26
// https://syclonefx.com
// https://github.com/syclonefx
// 

import SwiftUI
import WebKit

@Observable
class BrowserManager {
  let webPage: WebPage
  var url: URL? = nil
  var address: String = "https://apple.com"
  var canGoBack = false
  var canGoForward = false

  init(page: WebPage) {
    self.webPage = page
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
