//
//  NavigationButton.swift
//  UIKit_Code_Navigation_tutorial
//
//  Created by 이용일(Rodi) on 2023/03/19.
//

import UIKit

class NavigationButton: UIButton {

  enum Route: String {
    case firstVC = "FirstVC"
    case secondVC = "SecondVC"
    case thirdVC = "ThirdVC"
    case DetailVC = "DetailVC"
  }

  var routeVC: Route = Route.firstVC

  @IBInspectable
  var routeName: String? = "" {
    willSet {
      if let changedRoute = Route(rawValue: newValue ?? "") {
        routeVC = changedRoute
      }
    }
  }


}
