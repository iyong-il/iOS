//
//  UIColor+Ext.swift
//  TodoList_UIKit
//
//  Created by 이용일(Rodi) on 2023/02/05.
//

import UIKit

extension UIColor {
  static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
  }
}

