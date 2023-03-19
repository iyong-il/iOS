//
//  ThirdVC.swift
//  UIKit_Code_Navigation_tutorial
//
//  Created by 이용일(Rodi) on 2023/03/19.
//

import UIKit

final class ThirdVC: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "세번째"
  }


  @IBAction func popToVC(_ sender: NavigationButton) {
    guard let routeName = sender.routeName else { return }
    print(#fileID, #function, #line, "- \(routeName)")

    guard let viewControllers = self.navigationController?.viewControllers else { return }
    var vc: UIViewController? = nil

    switch sender.routeVC {
    case .firstVC:
      vc = viewControllers.first(where: {$0 is FirstVC})
    case .secondVC:
      vc = viewControllers.first(where: {$0 is SecondVC})
    default:
      break
    }

    guard let vc = vc else { return }
    self.navigationController?.popToViewController(vc, animated: true)
  }

}
