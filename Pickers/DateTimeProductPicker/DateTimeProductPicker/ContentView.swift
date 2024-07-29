//
// ContentView.swift
// DateTimeProductPicker
//
// Created by syclonefx on 7/28/24
// https://syclonefx.com
// https://github.com/syclonefx
//

import SwiftUI

struct ContentView: View {
  @Environment(\.colorScheme) var colorScheme
//  @Namespace private var animation
    
  @State private var selectedDate: Date = Date()
  @State private var selectedProduct = Product.products()[0]
  @State private var showingDatePicker = false
  @State private var showingTimePicker = false
  @State private var showingProductPicker = false
  
  private var duration: Double = 0.3
  let products = Product.products()
  
  var darkModeColor: Color {
    colorScheme == .dark ? .yellow : .blue
  }
  
  var body: some View {
    VStack {
      GroupBox {
        HStack {
          Text("Date")
          
          Spacer()
          
          Button("\(selectedDate.formatted(date: .long, time: .omitted))") {
            withAnimation {
              if showingTimePicker { showingTimePicker = false }
              if showingProductPicker { showingProductPicker = false }
              showingDatePicker.toggle()
            }
          }
          .foregroundStyle(showingDatePicker ? darkModeColor : .primary)
          .buttonStyle(.borderedProminent)
          .tint(.secondary.opacity(0.2))
        }
        .drawingGroup()
        
        if showingDatePicker {
          DatePicker(selection: $selectedDate, in: ...Date(), displayedComponents: .date) {
            Text("Date")
          }
          .datePickerStyle(.graphical)
          .tint(darkModeColor)
        }
        
        Divider()
        
        HStack {
          Text("Time")
          
          Spacer()
          
          Button("\(selectedDate.formatted(date: .omitted, time: .shortened))") {
            withAnimation {
              if showingDatePicker { showingDatePicker = false }
              if showingProductPicker { showingProductPicker = false }
              showingTimePicker.toggle()
            }
          }
          .foregroundStyle(showingTimePicker ? darkModeColor : .primary)
          .buttonStyle(.borderedProminent)
          .tint(.secondary.opacity(0.2))
        }
        .drawingGroup()
        
        if showingTimePicker {
          DatePicker(selection: $selectedDate, in: ...Date(), displayedComponents: .hourAndMinute) {
            Text("Time")
          }
          .labelsHidden()
          .datePickerStyle(.wheel)
        }
        
        Divider()
        
        HStack {
          Text("Product")
          
          Spacer()
          
          Button(selectedProduct.name) {
            withAnimation {
              if showingDatePicker { showingDatePicker = false }
              if showingTimePicker { showingTimePicker = false }
              showingProductPicker.toggle()
            }
          }
          .foregroundStyle(showingProductPicker ? darkModeColor : .primary)
          .buttonStyle(.borderedProminent)
          .tint(.secondary.opacity(0.2))
        }
        .drawingGroup()
        
        if showingProductPicker {
          Picker("Select a product", selection: $selectedProduct, content: {
            ForEach(products) { product in
              Text(product.name).tag(product)
            }
          })
          .pickerStyle(.wheel)
        }
      }
      .scrollBounceBehavior(.basedOnSize)
      
      Divider()
      
      VStack {
        Text(selectedProduct.name)
          .font(.title)
          .bold()
        Image(selectedProduct.image)
          .resizable()
          .scaledToFit()
          .clipShape(RoundedRectangle(cornerRadius: 15))
          .frame(minWidth: 100)
          .animation(.bouncy(duration: 0.5, extraBounce: 0.2), value: selectedProduct)
      }
      .frame(minWidth: 100)
      
    }
    .padding()
    Spacer()
  }
}

#Preview {
  ContentView()
}

struct Product: Hashable, Identifiable {
  let id: UUID = UUID()
  let name: String
  
  var image: String {
    name.lowercased()
  }
  
  init(name: String) {
    self.name = name
  }
  
  static func products() -> [Product] {
    return [
      Product(name: "Chucks"),
      Product(name: "Sweater"),
      Product(name: "Shirt"),
      Product(name: "Jeans"),
      Product(name: "Sneakers")
    ]
  }
}
