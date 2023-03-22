//
//  HomeViewModel.swift
//  Coin_SwiftUI
//
//  Created by 이용일(Rodi) on 2022/11/04.
//

import SwiftUI


class HomeViewModel: ObservableObject {
  @Published var coins = [Coin]()
  @Published var topMovingCoins = [Coin]()
  
  init() {
    fetchCoinData()
  }

  func fetchCoinData() {
    let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"

    guard let url = URL(string: urlString) else { return }

    URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let error = error {
        print(error.localizedDescription)
        return
      }

      guard let safeData = data else { return }

      do {
        let coins = try JSONDecoder().decode([Coin].self, from: safeData)

        DispatchQueue.main.async {
          self.coins = coins
          self.configureTopMovingCoins()
        }

        print(#fileID, #function, #line, "- \(coins)")

      } catch let error {
        return

      }
      
    }.resume()
  }

  func configureTopMovingCoins() {
    let topMovers = coins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H})
    self.topMovingCoins = Array(topMovers.prefix(10))
  }
}
