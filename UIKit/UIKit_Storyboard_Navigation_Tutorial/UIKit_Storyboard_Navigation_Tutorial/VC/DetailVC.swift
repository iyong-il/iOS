//
//  DetailVC.swift
//  UIKit_Storyboard_Navigation_Tutorial
//
//  Created by 이용일(Rodi) on 2023/03/04.
//

import UIKit


final class DetailVC: UIViewController {

  // MARK: - 속성
  @IBOutlet weak var detailLabel: UILabel!

  var someValue: String = "" {
    didSet {
      print(#fileID, #function, #line, "- someValue: \(someValue)")
    }
  }


  // MARK: - 라이프사이클
  override func viewDidLoad() {
    super.viewDidLoad()
    print(#fileID, #function, #line, "- 디테일VC로 왔다.")
    detailLabel.numberOfLines = 4
    detailLabel.text = someValue
  }


  // MARK: - 메서드
  @IBAction func goBackToFirstVC(_ sender: UIButton) {
    print(#fileID, #function, #line, "- 디테일VC에서 unwindSegue로 첫번째VC 이동 ")
  }

}
