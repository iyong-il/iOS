//
//  DetailVC.swift
//  UIKit_Storyboard_Navigation_Tutorial
//
//  Created by 이용일(Rodi) on 2023/03/04.
//

import UIKit


final class DetailVC: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(#fileID, #function, #line, "- 디테일VC로 왔다.")
  }

  @IBAction func goBackToFirstVC(_ sender: UIButton) {
    print(#fileID, #function, #line, "- 디테일VC에서 unwindSegue로 첫번째VC 이동 ")
  }

  @IBAction func goBackButtonTapped(_ sender: UIButton) {
    self.navigationController?.popViewController(animated: true)
    print(#fileID, #function, #line, "- 디테일VC에서 뒤로가기 버튼이 눌렸다.")

  }



}
