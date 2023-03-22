//
//  HomeView.swift
//  Coin_SwiftUI
//
//  Created by 이용일(Rodi) on 2022/11/01.
//

import SwiftUI

struct HomeView: View {
  @StateObject var viewModel = HomeViewModel()
  
    var body: some View {
      NavigationView {
        ScrollView(.vertical, showsIndicators: false) {

          TopMoversView(viewModel: viewModel)

          Divider()

          AllCoinsView(viewModel: viewModel)

          
        }
        .navigationTitle("Live Prices")
      }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
