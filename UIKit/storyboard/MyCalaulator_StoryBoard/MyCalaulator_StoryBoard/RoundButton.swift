//
//  RoundButton.swift
//  Calculator_Storyboard
//
//  Created by 이용일(Rodi) on 2023/02/05.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

  @IBInspectable
  var isRound: Bool = false {
    didSet {
      if isRound {
        self.layer.cornerRadius = self.frame.height / 2
      }
    }
  }

}
