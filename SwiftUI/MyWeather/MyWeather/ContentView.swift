//
//  ContentView.swift
//  MyWeather
//
//  Created by 이용일(Rodi) on 2023/01/01.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      Image("cloud")
        .resizable()
        .scaledToFill()
        .edgesIgnoringSafeArea(.all)

      ScrollView {
        top
        middle
        bottom
      } // ScrollView

    } // Zstack

  }

  // MARK: - 컴포넌트
  fileprivate var top: some View {
    Group {
      VStack {
        Text("서울시")
          .font(.title)
        Text("12°")
          .font(.system(size: 80))
        Text("한때 흐림")
          .font(.title3)
        HStack {
          Text("최고온도")
          Text("최저온도")
        }
        .font(.title3)
      } // Top
    }
  }
  fileprivate var middle: some View {
    Group {
      VStack {
        Text("오전 12시쯤 청명한 상태가 예상됩니다.")
        Divider()
        //              ScrollView(.horizontal, showsIndicators: false) {
        VStack {
          Text("지금")
          Image(systemName: "cloud.fill")
          Text("13°")
          //              }
        }
      } // Middle
      .padding()
      .background(.red)
      .cornerRadius(13)

    }
  }
  fileprivate var bottom: some View {
    VStack {
      HStack {
        Image(systemName: "calendar")
        Text("10일간의 일기예보")
      }

      Divider()

      //          ScrollView(.vertical, showsIndicators: false) {
      VStack {
        HStack {
          Text("오늘")
          Image(systemName: "cloud.fill")
          Text("최저")

          Text("최고")
        }
      }
      //          }
    } // Bottom
    .padding()
    .background(.blue)
    .cornerRadius(12)

  }

}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
