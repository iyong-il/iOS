//
//  BasicView.swift
//  sampleSetting
//
//  Created by 이용일(Rodi) on 2023/03/15.
//

import SwiftUI

struct BasicView: View {
  let imagename: String
  let text: String
  let navText: String
  let color: Color

    var body: some View {
      HStack {
        Image(systemName: imagename)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 20, height: 20)
          .padding(.all, 4)
          .background(color)
          .foregroundColor(.white)
          .cornerRadius(6)

        NavigationLink(text) {
          Text(navText)
        }
      }
    }
}

struct BasicView_Previews: PreviewProvider {
    static var previews: some View {
      BasicView(imagename: "wifi", text: "wifi", navText: "와이파이 화면", color: .blue)
    }
}
