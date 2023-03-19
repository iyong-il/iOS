//
//  SecondVC.swift
//  UIKit_Code_Navigation_tutorial
//
//  Created by 이용일(Rodi) on 2023/03/19.
//

import UIKit

final class SecondVC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "두번째"
  }

  @IBAction func buttonTapped(_ sender: UIButton) {
    // 확장을 사용하지 않고 화면이동하는 방법
    let storyboard = UIStoryboard(name: "ThirdVC", bundle: Bundle.main)
    guard let vc = storyboard.instantiateViewController(withIdentifier: "ThirdVC") as? ThirdVC else { return }
    self.navigationController?.pushViewController(vc, animated: true)
  }



}
