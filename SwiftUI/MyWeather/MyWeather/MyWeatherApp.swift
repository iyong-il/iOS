//
//  MyWeatherApp.swift
//  MyWeather
//
//  Created by 이용일(Rodi) on 2023/01/01.
//

import SwiftUI

@main
struct MyWeatherApp: App {
  var body: some Scene {
    WindowGroup {
      TabView {
        MapView()
          .tabItem {
            Image(systemName: "map")
          }

        WeatherView()
          .tabItem {
            Image(systemName: "sun.max")
          }

        ListView()
          .tabItem {
            Image(systemName: "list.bullet")
          }
      }
      .onAppear() {
        UITabBar.appearance().backgroundColor = .clear
        UITabBar.appearance().barTintColor = .black
      }
    }
  }
}

