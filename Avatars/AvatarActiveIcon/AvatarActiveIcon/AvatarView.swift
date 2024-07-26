//
//  AvatarView.swift
//  AvatarActiveIcon
//
//  Created by Chuck Perdue on 7/26/24.
//

import SwiftUI

struct AvatarView: View {
  @Environment(\.colorScheme) var colorScheme
  
  var image: String
  var height: CGFloat
  var backgroundColor: Color
  var showActiveIndicator: Bool
  var indicatorAlignment: Alignment?
  var iconImage: String?
  var activeIndicatorColor: Color?
  var iconColor: Color?
  
  var hasIcon: Bool {
    iconImage != nil ? true : false
  }
  
  var icon: String {
    iconImage ?? ""
  }
  
  var indicatorSize: CGFloat {
    height / 3
  }
  
  var alignment: Alignment {
    indicatorAlignment ?? .topTrailing
  }
  
  var isDarkMode: Bool {
    colorScheme == .dark
  }
  
  var offset: CGPoint {
    var position = CGPoint(x: 10, y: 0)
    
    switch alignment {
      case .bottomLeading, .topLeading:
        position.x = -10
        position.y = 0
      case .bottomTrailing, .topTrailing:
        position.x = 10
        position.y = 0
      default:
        position.x = 10
        position.y = 0
    }
    return position
  }
  
  init(image: String, height: CGFloat, backgroundColor: Color, showActiveIndicator: Bool, indicatorAlignment: Alignment? = .topTrailing, iconImage: String? = nil, activeIndicatorColor: Color? = nil, iconColor: Color? = nil) {
    self.image = image
    self.height = height
    self.backgroundColor = backgroundColor
    self.showActiveIndicator = showActiveIndicator
    self.indicatorAlignment = indicatorAlignment
    self.iconImage = iconImage
    self.activeIndicatorColor = activeIndicatorColor
    self.iconColor = iconColor
  }
  
  var body: some View {
    Image(image)
      .resizable()
      .scaledToFit()
      .background(backgroundColor)
      .clipShape(Circle())
      .frame(width: height, height: height)
      .overlay(alignment: alignment) {
        if showActiveIndicator {
          Circle()
            .fill(activeIndicatorColor ?? .black)
            .stroke(isDarkMode ? .black : .white, lineWidth: 5)
            .frame(width: indicatorSize)
            .offset(x: offset.x)
          if hasIcon {
            Image(systemName: icon)
              .resizable()
              .scaledToFit()
              .frame(width: indicatorSize / 1.7)
              .foregroundStyle(iconColor ?? .white)
              .offset(x: offset.x)
          }
        }
      }
  }
}

#Preview {
  ContentView()
}


//struct AvatarView: View {
//  var image: String
//  var height: CGFloat
//  var backgroundColor: Color
//  var showActiveIndicator: Bool
//  var iconImage: String?
//  var activeIndicatorColor: Color?
//  var iconColor: Color?
//  
//  var hasIcon: Bool {
//    iconImage != nil ? true : false
//  }
//  
//  var icon: String {
//    iconImage ?? ""
//  }
//  
//  var indicatorSize: CGFloat {
//    height / 3
//  }
//  
//  init(image: String, height: CGFloat, backgroundColor: Color, showActiveIndicator: Bool, iconImage: String? = nil, activeIndicatorColor: Color? = nil, iconColor: Color? = nil) {
//    self.image = image
//    self.height = height
//    self.backgroundColor = backgroundColor
//    self.showActiveIndicator = showActiveIndicator
//    self.iconImage = iconImage
//    self.activeIndicatorColor = activeIndicatorColor
//    self.iconColor = iconColor
//  }
//  
//  var body: some View {
//    ZStack {
//      Image(image)
//        .resizable()
//        .scaledToFit()
//        .background(backgroundColor)
//        .clipShape(Circle())
//        .frame(width: height, height: height)
//      if showActiveIndicator {
//        Circle()
//          .fill(activeIndicatorColor ?? .black)
//          .stroke(.white, lineWidth: 5)
//          .frame(width: indicatorSize)
//          .offset(x: (height / 3), y: -(height / 2.5))
//        if hasIcon {
//          Image(systemName: icon)
//            .resizable()
//            .scaledToFit()
//            .frame(width: indicatorSize / 1.7)
//            .foregroundStyle(iconColor ?? .white)
//            .offset(x: (height / 3), y: -(height / 2.5))
//        }
//      }
//    }
//  }
//}
