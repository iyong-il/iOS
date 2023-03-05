//
//  ViewController.swift
//  UIKit_Storyboard_Navigation_Tutorial
//
//  Created by 이용일(Rodi) on 2023/03/04.
//

import UIKit

final class FirstVC: UIViewController {
  
  // MARK: - 속성
  @IBOutlet weak var navToSecondVCButton: UIButton!
  @IBOutlet weak var navToDetailVCButton: UIButton!
  
  var stepNumber: Int = 1 {
    didSet {
      self.title = "스텝넘버 : \(self.stepNumber)"
    }
  }
  
  
  // MARK: - 라이프사이클
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    navToSecondVCButton.addTarget(self, action: #selector(navToSecond(_:)), for: .touchUpInside)
    navToDetailVCButton.addTarget(self, action: #selector(navToDetail(_:)), for: .touchUpInside)
  }
  
  
  // MARK: - 메서드
  
  // segue way 방식
  // VC끼리만 연결해 놓고 버튼에 addTarget설정후 하는 방식
  @objc fileprivate func navToSecond(_ sender: UIButton) {
    print(#fileID, #function, #line, "- 두번째VC로 이동")
    // 화면이동 메서드(segue way에 Identifier연결)
    self.performSegue(withIdentifier: "navToSecondVC", sender: nil)
  }
  
  @objc fileprivate func navToDetail(_ sender: UIButton) {
    print(#fileID, #function, #line, "- 디테일VC로 이동")
    
    self.performSegue(withIdentifier: "navToDetailVC", sender: nil)
  }
  
  
  // 프로그램 푸시 버튼
  // 버튼에 직접 주입하는 방식
  @IBAction func onPushButton(_ sender: UIButton) {
    
    let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    guard let vc = mainStoryboard.instantiateViewController(withIdentifier: "FirstVC") as? FirstVC else { return }
    
    vc.stepNumber = stepNumber + 1
    
    self.navigationController?.pushViewController(vc, animated: true)
    print(#fileID, #function, #line, "- 프로그램 푸시 횟수: \(stepNumber)")
  }
  
  // 그냥 뒤로가기 버튼
  // 바로 전 화면으로밖에 이동할 수 없다.
  @IBAction func goBackButton(_ sender: UIButton) {
    self.navigationController?.popViewController(animated: true)
  }
  
  // 다른 스토리보드에서 Exit으로 연결하면 해당VC로 돌아온다.
  @IBAction func goBackToFirstButtonPressed(unwindSegue: UIStoryboardSegue) {
    print(#fileID, #function, #line, "- unwindSegue : \(unwindSegue.source)")
  }
  
  
}

