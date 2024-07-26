//
//  FloatingTextField.swift
//  FloatingTextField
//
//  Created by syclonefx on 4/14/24.
//

import SwiftUI

struct FloatingTextField: View {
  @State var textFieldOffset: Double = .zero
  let title: String
  let text: Binding<String>
  var keyboard = UIKeyboardType.default
  
  var body: some View {
    ZStack(alignment: .leading) {
      Text(title)
        .foregroundStyle(text.wrappedValue.isEmpty ? Color(.gray) : .primary)
        .offset(y: text.wrappedValue.isEmpty ? 0 : -textFieldOffset)
        .scaleEffect(text.wrappedValue.isEmpty ? 1 : 0.75, anchor: .leading)
      TextField("", text: text, axis: .vertical)
        .keyboardType(keyboard)
        .lineLimit(0...5)
        .getSize { offset in
          print("0,offset.height,\(offset.height),textFieldOffset,\(textFieldOffset)")
          textFieldOffset = offset.height
          if offset.height < 25 { // one line
            textFieldOffset = offset.height //- 3
            print("1,offset.height,\(offset.height),textFieldOffset,\(textFieldOffset)")
          } else if offset.height > 25 && offset.height <= 44  { // two lines
            textFieldOffset = offset.height //- 3
            print("2,offset.height,\(offset.height),textFieldOffset,\(textFieldOffset)")
          } else if offset.height > 65 && offset.height <= 87 { // three lines
            textFieldOffset = offset.height - 8
            print("3,offset.height,\(offset.height),textFieldOffset,\(textFieldOffset)")
          } else if offset.height > 87 && offset.height <= 102 { // four lines
            textFieldOffset = offset.height - 16
            print("4,offset.height,\(offset.height),textFieldOffset,\(textFieldOffset)")
          } else if offset.height > 102 { // five lines
            textFieldOffset = offset.height - 24
            print("5,offset.height,\(offset.height),textFieldOffset,\(textFieldOffset)")
          }
        }
    }
    .padding(.top, 15)
    .animation(.spring(response: 0.4, dampingFraction: 0.3), value: UUID())
  }
}

#Preview {
  FloatingTextField(title: "Title", text: .constant("None"))
}
