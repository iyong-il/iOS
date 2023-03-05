//
//  SecondVC.swift
//  UIKit_Storyboard_Navigation_Tutorial
//
//  Created by 이용일(Rodi) on 2023/03/05.
//

import UIKit

final class SecondVC: UIViewController {
  
  // MARK: - 속성
  @IBOutlet weak var moveToThirdVC: UIButton!
  
  
  // MARK: - 라이프사이클
  override func viewDidLoad() {
    super.viewDidLoad()
    print(#fileID, #function, #line, "- 두번째VC로 왔다.")
    
    moveToThirdVC.addTarget(self, action: #selector(moveToThirdButtonTapped(_:)), for: .touchUpInside)
  }
  
  
  // MARK: - 메서드
  @objc fileprivate func moveToThirdButtonTapped(_ sender:UIButton) {
    print(#fileID, #function, #line, "- 세번재VC로 이동")
    self.performSegue(withIdentifier: "moveToThirdVC", sender: self)
  }
  
  @IBAction func unwindSegue(_ sender: UIButton) {
    print(#fileID, #function, #line, "- 두번째VC에서 unwindSegue로 첫번째VC 이동")
  }
  
  // VC끼리 연결을 해놓는 방식
  // 해당 segue way에 identifier를 꼭 설정해주어야 한다.
  @IBAction func goBackTofirstVC(_ sender: UIButton) {
    print(#fileID, #function, #line, "- 두번째VC에서 performSegue로 첫번째VC 이동")
    self.performSegue(withIdentifier: "goBackToFirstVC", sender: self)
  }

  // 도착지에 만들어 놓는 방식
  @IBAction func goBackToSecondVC(unwindSegue: UIStoryboardSegue) {
    print(#fileID, #function, #line, "- unwindSegue : \(unwindSegue.source)")

  }
  
  
}
