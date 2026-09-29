//
//  FloatingNumericTextField.swift
//  FloatingTextField
//
//  Created by syclonefx on 4/24/24.
//

import SwiftUI

struct FloatingNumericTextField: View {
  let title: String
  @Binding var value: Double?

  @FocusState private var isFocused: Bool

  private var shouldFloatLabel: Bool {
    isFocused || value != nil
  }

  var body: some View {
    ZStack(alignment: .leading) {
      Text(title)
        .foregroundStyle(shouldFloatLabel ? Color.primary : Color.gray)
        .offset(y: shouldFloatLabel ? -25 : 0)
        .scaleEffect(
          shouldFloatLabel ? 0.75 : 1,
          anchor: .leading
        )
        .allowsHitTesting(false)

      TextField("", value: $value, format: .number)
        .keyboardType(.decimalPad)
        .focused($isFocused)
    }
    .padding(.top, 15)
    .animation(
      .spring(response: 0.4, dampingFraction: 0.7),
      value: shouldFloatLabel
    )
  }
}

#Preview {
  FloatingNumericTextField(title: "Amount", value: .constant(23))
}
