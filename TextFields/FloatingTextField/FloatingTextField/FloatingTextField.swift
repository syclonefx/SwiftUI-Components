//
//  FloatingTextField.swift
//  FloatingTextField
//
//  Created by syclonefx on 4/14/24.
//

import SwiftUI

struct FloatingTextField: View {
  let title: String
  @Binding var text: String
  var keyboard: UIKeyboardType = .default

  private var isFloating: Bool {
    !text.isEmpty
  }

  var body: some View {
    TextField("", text: $text, axis: .vertical)
      .keyboardType(keyboard)
      .lineLimit(1...5)
      .overlay(alignment: .topLeading) {
        Text(title)
          .foregroundStyle(isFloating ? Color.primary : Color.gray)
          .offset(y: isFloating ? -18 : 0)
          .scaleEffect(
            isFloating ? 0.75 : 1,
            anchor: .leading
          )
          .allowsHitTesting(false)
      }
      .padding(.top, isFloating ? 15 : 0)
      .animation(.spring(response: 0.4, dampingFraction: 0.7), value: isFloating)
  }
}

#Preview {
  FloatingTextField(title: "Title", text: .constant("None"))
}
