//
//  CoinRowView.swift
//  Coin_SwiftUI
//
//  Created by 이용일(Rodi) on 2022/11/03.
//

import SwiftUI
import Kingfisher

struct CoinRowView: View {
  let coin: Coin
    var body: some View {
      HStack {
        Text("\(Int(coin.marketCapRank))")
          .font(.caption)
          .foregroundColor(.gray)

        KFImage(URL(string: coin.image))
          .resizable()
          .scaledToFit()
          .frame(width: 32, height: 32)
          .foregroundColor(.orange)

        VStack(alignment: .leading, spacing: 4) {
          Text(coin.name)
            .font(.subheadline)
            .fontWeight(.semibold)
            .padding(.leading, 4)

          Text(coin.symbol.uppercased())
            .font(.caption)
            .padding(.leading, 6)

        }
        .padding(.leading, 2)

        Spacer()

        VStack(alignment: .trailing, spacing: 4) {
          Text("\(coin.currentPrice)")
            .font(.subheadline)
            .fontWeight(.semibold)
            .padding(.leading, 4)

          Text("\(coin.priceChangePercentage24H)")
            .font(.caption)
            .padding(.leading, 6)
            .foregroundColor(.red)

        }
        .padding(.leading, 2)
      }
      .padding(.horizontal)
      .padding(.vertical, 4)
    }
}

//struct CoinRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinRowView()
//    }
//}
