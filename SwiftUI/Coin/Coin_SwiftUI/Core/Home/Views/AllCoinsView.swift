//
//  AllCoinView.swift
//  Coin_SwiftUI
//
//  Created by 이용일(Rodi) on 2022/11/03.
//

import SwiftUI

struct AllCoinsView: View {
  @StateObject var viewModel: HomeViewModel

    var body: some View {
      VStack(alignment: .leading) {
        Text("All Coins")
          .font(.headline)
          .padding()

        HStack {
          Text("Coin")

          Spacer()

          Text("Prices")

        }
        .foregroundColor(.gray)
        .font(.caption)
        .padding(.horizontal)

        ScrollView {
          VStack {
            ForEach(viewModel.coins) { coin in
              CoinRowView(coin: coin)
            }
          }
        }
      }

    }
}

//struct AllCoinsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllCoinsView()
//    }
//}
