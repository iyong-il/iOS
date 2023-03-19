//
//  ViewController.swift
//  UIKit_Code_Navigation_tutorial
//
//  Created by 이용일(Rodi) on 2023/03/06.
//

import UIKit

class FirstVC: UIViewController {





  override func viewDidLoad() {
    super.viewDidLoad()
  }


  @IBAction func buttonTapped(_ sender: NavigationButton) {
//    guard let sender = sender.route else { return }
    guard let routeName = sender.routeName else { return }
    print(#fileID, #function, #line, "- route : \(routeName)")

    var vc: UIViewController? = nil

    switch sender.routeVC {
    case .secondVC:
      vc = SecondVC.getInstance()
    case .thirdVC:
      vc = ThirdVC.getInstance()
    case .DetailVC:
      vc = DetailVC.getInstance()
    default:
      break
    }

    if let vc = vc {
      self.navigationController?.pushViewController(vc, animated: true)
    }


  }

}
