//
//  NavigationBtn + Ext.swift
//  UIKit_Storyboard_Navigation_Tutorial
//
//  Created by 이용일(Rodi) on 2023/03/14.
//

import UIKit

class NavigationButton: UIButton {

  enum Route: String {
    case firstVC = "FirstVC"
    case secondVC = "SecondVC"
    case thirdVC = "ThirdVC"
    case detailVC = "DetailVC"
  }

  var routeVC: Route = Route.firstVC

  @IBInspectable
  var route: String? {
    willSet {
      if let changedRoute = Route(rawValue: newValue ?? "") {
        routeVC = changedRoute
      }
    }
  }

}
