//
//  Utilities.swift
//  WebView
//
//  Created by 이용일(Rodi) on 2023/01/29.
//

import UIKit
import SnapKit
import Then

struct Utilities {

  func makeView(num: Int = 0, image: String, text: String, btn: UIButton, divideColor: UIColor? = nil) -> UIView {
    let view = UIView()

    let mainIv = UIImageView()
    mainIv.image = UIImage(systemName: image)
    mainIv.contentMode = .scaleAspectFit
    mainIv.tintColor = .darkGray


    let label = UILabel()
    label.text = text
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 16, weight: .regular)


    let subIv = UIImageView()
    subIv.image = #imageLiteral(resourceName: "Vector")
    subIv.contentMode = .scaleAspectFit

    let divideLine = UIView()
    divideLine.backgroundColor = divideColor


    [btn, mainIv, label, subIv, divideLine].forEach { view.addSubview($0) }



    mainIv.snp.makeConstraints {
      $0.size.equalTo(20)
      $0.centerY.equalTo(view.snp.centerY)
      $0.left.equalTo(view.snp.left).offset(num)
    }

    label.snp.makeConstraints {
      $0.centerY.equalTo(view.snp.centerY)
      $0.left.equalTo(mainIv.snp.right).offset(12)
    }

    subIv.snp.makeConstraints {
      $0.size.equalTo(20)
      $0.centerY.equalTo(view.snp.centerY)
      $0.right.equalTo(view.snp.right).offset(-20)
    }

    divideLine.snp.makeConstraints {
      $0.height.equalTo(0.7)
      $0.top.equalTo(view.snp.bottom)
      $0.horizontalEdges.equalTo(view.snp.horizontalEdges)
    }

    btn.snp.makeConstraints {
      $0.height.equalTo(55)
      $0.edges.equalToSuperview()
    }


    return view
  }
}
