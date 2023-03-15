//
//  NormalView.swift
//  sampleSetting
//
//  Created by 이용일(Rodi) on 2023/03/15.
//
import SwiftUI

struct NormalView: View {
    var body: some View {
      List {
        Section {
          HStack {
            NavigationLink("정보") {
              Text("정보 화면")
            }
          }
        }// 정보화면

        Section {
          HStack {
            NavigationLink("키보드") {
              Text("키보드 화면")
            }
          } // 키보드화면

          HStack {
            NavigationLink("게임컨트롤러") {
              Text("게임컨트롤러 화면")
            }
          } // 게임 컨트롤러

          HStack {
            NavigationLink("서체") {
              Text("서체화면")
            }
          } // 서체화면

          HStack {
            NavigationLink("언어 및 지역") {
              Text("언어 및 지역 화면")
            }
          }// 언어 및 지역화면

          HStack {
            NavigationLink("사전") {
              Text("사전 화면")
            }
          }// 사전화면

        }

        Section {
          HStack {
            NavigationLink("전송 또는 iPhone재설정") {
              Text("전송 또는 iPhone재설정 화면")
            }
          }
        }
      }
    }
}

struct NormalView_Previews: PreviewProvider {
    static var previews: some View {
      NormalView()
    }
}

