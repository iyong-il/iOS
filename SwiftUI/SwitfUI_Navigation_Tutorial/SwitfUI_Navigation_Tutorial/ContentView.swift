//
//  ContentView.swift
//  SwitfUI_Navigation_Tutorial
//
//  Created by 이용일(Rodi) on 2023/03/04.
//

import SwiftUI

struct DetailView: View {

  let stepNumber: Int

  var body: some View {
    NavigationLink {
      DetailView(stepNumber: stepNumber + 1)
    } label: {
      VStack(spacing: 0) {
        Text("스텝 넘버 : \(stepNumber)")
          .fontWeight(.black)
          .font(.system(size: 30))
          .foregroundColor(.black)
          .padding(20)
      }
      .cornerRadius(10)
      .border(.red)
    }
    .navigationTitle("스텝넘버 : \(stepNumber)")
    .navigationBarTitleDisplayMode(.inline)

  }
}

struct ContentView: View {
    var body: some View {

      NavigationView {
        VStack {
          Image(systemName: "globe")
            .imageScale(.large)
            .foregroundColor(.accentColor)
          Text("Hello, world!")
          DetailView(stepNumber: 1)
        }
        .padding()
      }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
