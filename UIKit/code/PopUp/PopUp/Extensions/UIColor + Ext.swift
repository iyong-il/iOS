//
//  UIColor + Ext.swift
//  PopUp
//
//  Created by 이용일(Rodi) on 2023/02/26.
//
import UIKit

extension UIColor {
  static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}

