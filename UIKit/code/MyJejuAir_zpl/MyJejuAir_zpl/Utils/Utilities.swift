//
//  Utilities.swift
//  MyJejuAir_zpl
//
//  Created by 이용일(Rodi) on 2023/02/19.
//

import UIKit
import Then
import SnapKit

struct Utilities {

  func alert(title: String, reject: String, agree: String) -> UIView {
    let view = UIView()
    let title = UILabel().then {
      $0.text = title
      $0.textColor = .black
    }
    let rejectButton = UIButton()
    let agreeButton = UIButton()



    return view
  }

}
