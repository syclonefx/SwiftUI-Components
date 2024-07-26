//
//  ContentView.swift
//  FloatingTextField
//
//  Created by syclonefx on 4/14/24.
//

import SwiftUI

struct ContentView: View {
  @State private var name = "Chuck"
  @State private var value = ""
  @State private var oneLineComment = "No Comment"
  @State private var twoLineComment = "No Comment"
  @State private var threeLineComment = "No Comment"
  @State private var fourLineComment = "No Comment"
  @State private var fiveLineComment = "No Comment"
  
  var body: some View {
    Form {
      
      FloatingTextField(title: "Name", text: $name)
      FloatingNumericTextField(title: "Amount", value: $value)
      FloatingTextField(title: "One Line Comment", text: $oneLineComment)
      FloatingTextField(title: "Two Line Comment", text: $twoLineComment)
      FloatingTextField(title: "Three Line Comment", text: $threeLineComment)
      FloatingTextField(title: "Four Line Comment", text: $fourLineComment)
      FloatingTextField(title: "Five Line Comment", text: $fiveLineComment)
    }
    .padding()
    .onAppear(perform: {
      populateComment()
    })
  }
  
  func populateComment() {
    oneLineComment = "Lorem ipsum dolor"
    twoLineComment = "Lorem ipsum dolor sit amet, consectetur  adipiscing elit."
    threeLineComment = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Nam elementum pellentesque lacus"
    fourLineComment = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum pellentesque lacus, ac consequat metus consectetur ac."
    fiveLineComment = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum pellentesque lacus, ac consequat metus consectetur ac. Phasellus eu tristique dui, eu lacinia nunc. Sed commodo mauris metus, at elementum odio iaculis malesuada. Nullam sed ultricies diam, non iaculis arcu. Maecenas tincidunt mollis libero, in tempor tortor bibendum eu. Cras faucibus felis velit, sit amet molestie purus vehicula ut. Maecenas nec vulputate massa. Ut id felis vitae justo feugiat sodales. Fusce sit amet bibendum tortor. Donec interdum neque vel felis viverra scelerisque ut id orci. Aenean porttitor dolor fringilla arcu dapibus interdum. Phasellus erat sapien, porttitor placerat tincidunt non, rhoncus at elit. Vestibulum nulla lectus, lobortis sed nunc ac, dictum accumsan velit. Nulla facilisi."
  }
}

#Preview {
  ContentView()
}

/*
 Used for detecting size of the text filed
 https://www.youtube.com/watch?v=H6S5xKgb9k8
 https://github.com/mikina/GetViewSizeInSwiftUI/blob/main/GeometryReader/ContentView.swift
*/
