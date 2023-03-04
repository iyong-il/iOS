//
//  URLSession_TodoListApp.swift
//  URLSession_TodoList
//
//  Created by 이용일(Rodi) on 2023/03/04.
//

import SwiftUI

@main
struct URLSession_TodoListApp: App {
    var body: some Scene {
        WindowGroup {
          TabView {
            ContentView()
              .tabItem {
                Image(systemName: "1.square.fill")
                Text("SwiftUI")
              }


            ContentView()
              .tabItem {
                Image(systemName: "2.square.fill")
                Text("UIKit")
              }

          }
        }
    }
}
