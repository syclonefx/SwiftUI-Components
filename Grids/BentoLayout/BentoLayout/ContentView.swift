//
// ContentView.swift
// BentoLayout
//
// Created by syclonefx on 8/10/24
// https://syclonefx.com
// https://github.com/syclonefx
//

import SwiftUI

struct ContentView: View {
  @State private var views: [ContainerView] = []
  var body: some View {
    ScrollView {
      VStack {
        buildView()
        
        Button("Add View") {
          views.append(ContainerView())
        }
        .disabled(views.count >= 5)
      }
      .padding()
    }
  }
  @ViewBuilder func buildView() -> some View {
    switch views.count {
      case 1:
        views[0]
          .frame(width: 370, height: 370)
      case 2:
        Grid(horizontalSpacing: 2) {
          GridRow {
            views[0]
              .frame(width: 185, height: 185)
            views[1]
              .frame(width: 185, height: 185)
          }
        }
      case 3:
        Grid(horizontalSpacing: 2) {
          GridRow {
            views[0]
              .frame(width: 185, height: 185)
              .gridCellColumns(2)
            Grid(horizontalSpacing: 2) {
              GridRow {
                views[1]
                  .frame(width: 185, height: 90)
              }
              GridRow {
                views[1]
                  .frame(width: 185, height: 90)
              }
            }
          }
        }
      case 4:
        Grid(horizontalSpacing: 2) {
          GridRow {
            views[0]
            .frame(width: 185, height: 185)
            .gridCellColumns(2)
            Grid(horizontalSpacing: 2) {
              GridRow {
                views[1]
                  .frame(width: 185, height: 90)
                  .gridCellColumns(2)
              }
              GridRow {
                views[2]
                  .frame(width: 90, height: 90)
                views[3]
                  .frame(width: 90, height: 90)
              }
            }
          }
        }
      case 5:
        Grid(horizontalSpacing: 2) {
          GridRow {
            views[0]
              .frame(width: 185, height: 185)
              .gridCellColumns(2)
            Grid(horizontalSpacing: 2) {
              GridRow {
                views[1]
                  .frame(width: 90, height: 90)
                views[2]
                  .frame(width: 90, height: 90)
              }
              GridRow {
                views[3]
                  .frame(width: 90, height: 90)
                views[4]
                  .frame(width: 90, height: 90)
              }
            }
          }
        }
      default:
        ContentUnavailableView("Add a view", systemImage: "photo")
    }
  }
}

#Preview {
  ContentView()
}

protocol JournalView: View {
  associatedtype Content: View
  
  var body: ComponentView<Content> { get }
}

struct ComponentView<Content: View>: View {
  @ViewBuilder var content: () -> Content
  var body: some View {
    content()
  }
}

struct ContainerView: JournalView {
  var body: ComponentView<some View> {
    ComponentView {
      RoundedRectangle(cornerRadius: 12)
    }
  }
}



