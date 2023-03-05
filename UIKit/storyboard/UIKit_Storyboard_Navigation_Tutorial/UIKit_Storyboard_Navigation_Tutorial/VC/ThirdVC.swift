//
//  ThirdVC.swift
//  UIKit_Storyboard_Navigation_Tutorial
//
//  Created by 이용일(Rodi) on 2023/03/05.
//

import UIKit

final class ThirdVC: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(#fileID, #function, #line, "- 세번째VC로 왔다.")
  }


  @IBAction func goBackToFirst(_ sender: UIButton) {
    print(#fileID, #function, #line, "- 세번째VC에서 unwindSegue로 첫번째VC 이동")

  }

  @IBAction func goBackToFirstVC(_ sender: UIButton) {
    print(#fileID, #function, #line, "- 세번째VC에서 performSegue로 첫번째VC 이동")
    self.performSegue(withIdentifier: "goBackToFirst", sender: self)
  }


}
