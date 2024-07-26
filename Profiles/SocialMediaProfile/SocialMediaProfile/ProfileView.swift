//
//  ProfileView.swift
//  SocialMediaProfile
//
//  Created by syclonefx on 7/25/24.
//  https://syclonefx.com

import SwiftUI

struct ProfileView: View {
  let profileImage: String
  let name: String
  let title: String
  let socialAccounts: [String]
  
  var body: some View {
      HStack {
        ZStack{
          Circle()
            .stroke(.black, lineWidth: 2)
          Image(profileImage)
            .resizable()
            .scaledToFill()
            .frame(width: 80, height: 80)
            .clipShape(Circle())
        }
        .frame(width: 80)
        
        VStack(alignment: .leading) {
          Text(name)
            .font(.title2)
            .foregroundStyle(.black)
          Text(title)
            .font(.caption)
            .foregroundStyle(.gray)
          
          HStack {
            ForEach(socialAccounts, id: \.self) {
              SocialBrandImage(brandImage: $0)
            }
          }
        }
        Spacer()
      }
      .padding()
      .background(.white)
      .cornerRadius(15)
      .shadow(radius: 2)
      .padding([.leading, .trailing])
      .padding(.bottom)
  }
}

#Preview {
  ContentView()
}
