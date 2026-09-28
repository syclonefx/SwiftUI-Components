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
  @State private var itemCount = 1
  var body: some View {
    VStack {
      BentoLayout {
        BentoTile {
          Image("avatar1")
            .resizable()
            .scaledToFill()
        }

        BentoTile {
          Text("Hello, World!")
        }

        BentoTile {
          Image("avatar2")
            .resizable()
            .scaledToFill()
        }

        BentoTile {
          Image("avatar3")
            .resizable()
            .scaledToFill()
        }
      }

      Spacer()

      BentoLayout(spacing: 8) {
        ForEach(0..<itemCount, id: \.self) { index in
          BentoTile {
            Text("\(index + 1)")
              .font(.largeTitle.bold())
          }
        }
      }
      .frame(maxWidth: 370)
      .animation(.bouncy, value: itemCount)
      Spacer()
      Stepper(
        "Items: \(itemCount)",
        value: $itemCount,
        in: 1...5
      )
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
