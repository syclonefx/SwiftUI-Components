//
//  FloatingNumericTextField.swift
//  FloatingTextField
//
//  Created by syclonefx on 4/24/24.
//

import SwiftUI

struct FloatingNumericTextField: View {
//  @State var textFieldOffset: Double = .zero
  let title: String
  let value: Binding<String>
  let text = ""
  var keyboard = UIKeyboardType.default
  
  var body: some View {
    ZStack(alignment: .leading) {
      Text(title)
        .foregroundStyle(value.wrappedValue.isEmpty ?  Color(.gray) : .primary)
        .offset(y: value.wrappedValue.isEmpty ? 0 : -25)
        .scaleEffect(value.wrappedValue.isEmpty ? 1 : 0.75, anchor: .leading)
      TextField("", text: value)
//        .textFieldStyle(RoundedBorderTextFieldStyle())
        .keyboardType(.decimalPad)
    }
    .padding(.top, 15)
    .animation(.spring(response: 0.4, dampingFraction: 0.3), value: UUID())
  }
}

#Preview {
  FloatingNumericTextField(title: "Amount", value: .constant(""))
}
