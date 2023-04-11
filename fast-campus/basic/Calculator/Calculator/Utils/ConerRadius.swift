//
//  ConerRadius.swift
//  Calculator
//
//  Created by 이용일(Rodi) on 2023/04/11.
//

import UIKit

@IBDesignable
class ConerRadius: UIButton {

    @IBInspectable
    var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }

}
