//
//  SocialBrandImage.swift
//  SocialMediaProfile
//
//  Created by syclonefx on 7/25/24.
//

import SwiftUI

struct SocialBrandImage: View {
  var brandImage: String
  var body: some View {
    Image(brandImage)
      .resizable()
      .scaledToFit()
      .frame(height: 25)
  }
}

#Preview {
  SocialBrandImage(brandImage: "twitter")
}
