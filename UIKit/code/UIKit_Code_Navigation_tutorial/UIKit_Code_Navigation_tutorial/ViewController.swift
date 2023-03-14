//
//  ViewController.swift
//  UIKit_Code_Navigation_tutorial
//
//  Created by 이용일(Rodi) on 2023/03/06.
//

import UIKit

final class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .blue
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    let vc = SecondVC()
    self.navigationController?.pushViewController(vc, animated: true)
  }
}
