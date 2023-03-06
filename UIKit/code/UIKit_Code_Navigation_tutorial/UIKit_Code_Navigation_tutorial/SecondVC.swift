//
//  SecondVC.swift
//  UIKit_Code_Navigation_tutorial
//
//  Created by 이용일(Rodi) on 2023/03/06.
//

import UIKit

final class SecondVC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }


}

extension SecondVC {
//  static func getInstance() -> SecondVC? {
//    let storyBoard = UIStoryboard(name: "SecondVC", bundle: Bundle.main)
//    return storyBoard.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC
//  }
}

extension UIViewController {
  static func getInstance() -> Self? {
    let name = String(describing: self)

    let storyBoard = UIStoryboard(name: name, bundle: Bundle.main)
    return storyBoard.instantiateViewController(withIdentifier: name) as? Self
  }
}
