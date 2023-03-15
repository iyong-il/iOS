//
//  ContentView.swift
//  sampleSetting
//
//  Created by 이용일(Rodi) on 2023/03/15.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
  @State var search = ""
  @State var toggleOn = false


  var body: some View {
    NavigationView {

      List {
        HStack{
          Image(systemName: "magnifyingglass")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .foregroundColor(.gray)
          TextField("검색", text: $search)
            .keyboardType(.default)
        }
        Section {

          NavigationLink  {
            Text("프로필 화면")
          } label: {
            HStack {
              Image(systemName: "car.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .padding(.all, 10)
                .background(.gray)
                .clipShape(Circle())
              VStack(alignment: .leading, spacing: 3) {
                Text("yong-il")
                  .font(.system(size: 24))
                  .fontWeight(.semibold)
                Text("Apple ID, iCloud, 미디어 및 구입")
                  .font(.system(size: 14))
              }
              .padding(.leading, 6)
            }
            .padding(.vertical, 10)
          }
        }

        Section {
          // 에어플레인모드
          HStack {
            Image(systemName: "airplane")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 20, height: 20)
              .padding(.all, 4)
              .background(.orange)
              .foregroundColor(.white)
              .cornerRadius(6)
            Text("에어플레인모드")
            Toggle(isOn: self.$toggleOn) {

            }
          }
          // 와이파이
          BasicView(imagename: "wifi", text: "wifi", navText: "와이파이 화면", color: .blue)
          BasicView(imagename: "safari", text: "Blutooth", navText: "블루투스화면", color: .blue)
          BasicView(imagename: "antenna.radiowaves.left.and.right", text: "셀룰러", navText: "셀룰러화면", color: .green)
          BasicView(imagename: "personalhotspot", text: "개인용 핫스팟", navText: "개인용 핫스팟화면", color: .green)
        }

        Section {
          BasicView(imagename: "bell.badge.fill", text: "알림", navText: "알림 화면", color: .red)
          BasicView(imagename: "speaker.wave.3.fill", text: "사운드 및 햅틱", navText: "사운드 및 햅틱화면", color: .pink)
          BasicView(imagename: "moon.fill", text: "집중모드", navText: "집중모드 화면", color: .indigo)
          BasicView(imagename: "hourglass", text: "스크린 타임", navText: "스크린타임 화면", color: .indigo)
        }


        Section {
          HStack {
            Image(systemName: "gear")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 20, height: 20)
              .padding(.all, 4)
              .background(.gray)
              .foregroundColor(.white)
              .cornerRadius(6)

            NavigationLink("일반") {
              NormalView()
            }
          }
          BasicView(imagename: "switch.2", text: "제어센터", navText: "제어센터 화면", color: .gray)
          BasicView(imagename: "textFormat.size", text: "디스플레이 및 밝기", navText: "디스플레이 및 밝기 화면", color: .blue)
          BasicView(imagename: "square.grid.4x3.fill", text: "홈 화면", navText: "홈 화면의 화면", color: .blue)
          BasicView(imagename: "circle.fill", text: "손쉬운 사용", navText: "손쉬운 사용 화면", color: .blue)
          BasicView(imagename: "hand.raised.fill", text: "개인 정보 보호", navText: "개인 정보 보호 센터", color: .blue)

        }
      }
      .navigationTitle(Text("설정"))

    }


  }



  struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
  }
}
