//
//  TopMoversItemView.swift
//  Coin_SwiftUI
//
//  Created by 이용일(Rodi) on 2022/11/03.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
  let coin: Coin

  var body: some View {
    VStack(alignment: .leading, spacing: 4) {

//      Image(systemName: "bitcoinsign.circle.fill")
      KFImage(URL(string: coin.image))
        .resizable()
        .frame(width: 32, height: 32)
        .foregroundColor(.orange)
        .padding(.bottom, 8)


      HStack(spacing: 2) {
        Text("\(coin.symbol.uppercased())")
          .font(.caption)
          .fontWeight(.bold)

        Text("\(coin.currentPrice)")
          .font(.caption)
          .foregroundColor(.gray)
      }


      Text("\(coin.priceChangePercentage24H)")
        .font(.title2)
        .foregroundColor(.green)
    }
    .frame(width: 140, height: 140)
    .overlay(
      RoundedRectangle(cornerRadius: 10)
        .stroke(Color(.systemGray4), lineWidth: 2)
    )

  }
}

//struct TopMoversItemView_Previews: PreviewProvider {
//  static var previews: some View {
//    TopMoversItemView(coin: <#Coin#>)
//  }
//}
