//
//  ContentView.swift
//  MyWeather
//
//  Created by 이용일(Rodi) on 2023/01/01.
//

import SwiftUI

struct WeatherView: View {
  var body: some View {
    NavigationView {
      ZStack {
        GeometryReader { _ in
          Image("cloud")
          //            .resizable()
          //            .scaledToFill()
          //            .edgesIgnoringSafeArea(.all)
        }
        .ignoresSafeArea()
        
        ScrollView {
          top
          middle1
          middle2
          bottom
        }
        .padding()
        
      } // Zstack
    } // NavigationView
    .foregroundColor(.white)
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
      .padding(.vertical, 40)
    }
  }
  fileprivate var middle1: some View {
    Group {
      VStack(alignment: .leading) {
        HStack {
          Image(systemName: "aqi.high")
          Text("대기질")
          Spacer()
        }
        Text("매우나쁨")
        Text("현재의 대기질 지수")
      }
      .padding()
      .frame(maxWidth: .infinity)
      .background(.ultraThinMaterial)
      .cornerRadius(13)
    }
  }
  fileprivate var middle2: some View {
    Group {
      VStack(alignment: .leading) {
        HStack() {
          Image(systemName: "clock")
          Text("시간별 일기예보")
          Spacer()
        }
        HStack {
          VStack(alignment: .leading) {
            Text("지금")
            Image(systemName: "cloud.fill")
            Text("13°")
          }
        }
      }
      .padding()
      .frame(maxWidth: .infinity)
      .background(.ultraThinMaterial)
      .cornerRadius(13)
    }
  }
  fileprivate var bottom: some View {
    Group {
      VStack(alignment: .leading) {
        HStack {
          Image(systemName: "calendar")
          Text("10일간의 일기예보")
        }
        HStack {
          VStack(alignment: .leading) {
            Divider()
            HStack(alignment: .center) {
              Text("오늘")
              Spacer()
              Image(systemName: "cloud.fill")
              Spacer()
              Text("최저")
              Spacer()
              Text("최고")
            }
          }
        }
      }
      .padding()
      .background(.ultraThinMaterial)
      .cornerRadius(13)
    }
    
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    WeatherView()
  }
}
