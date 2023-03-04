//
//  SecondVC.swift
//  UIKit_Storyboard_Navigation_Tutorial
//
//  Created by 이용일(Rodi) on 2023/03/05.
//

import UIKit

class SecondVC: UIViewController {

  @IBOutlet weak var moveToThirdVC: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    print(#fileID, #function, #line, "- 두번째VC로 왔다.")

    moveToThirdVC.addTarget(self, action: #selector(moveToThirdButtonTapped(_:)), for: .touchUpInside)

  }

  @objc fileprivate func moveToThirdButtonTapped(_ sender:UIButton) {
    print(#fileID, #function, #line, "- 세번재VC로 이동")
    self.performSegue(withIdentifier: "moveToThirdVC", sender: nil)

  }




}
