//
//  ViewController.swift
//  UIKit_Storyboard_Navigation_Tutorial
//
//  Created by 이용일(Rodi) on 2023/03/04.
//

import UIKit

final class ViewController: UIViewController {

  @IBOutlet weak var navToSecondVCButton: UIButton!
  @IBOutlet weak var navToDetailVCButton: UIButton!



  var stepNumber: Int = 1 {
    didSet {
      self.title = "스텝넘버 : \(self.stepNumber)"
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.

    navToSecondVCButton.addTarget(self, action: #selector(n/Users/iyong-il/iOS/UIKit/storyboard/UIKit_Storyboard_Navigation_Tutorial/UIKit_Storyboard_Navigation_Tutorial/Storyboard/SecondVC.storyboardavToSecond(_:)), for: .touchUpInside)
    navToDetailVCButton.addTarget(self, action: #selector(navToDetail(_:)), for: .touchUpInside)
  }

  // segue way 방식
  // VC끼리만 연결해 놓고 버튼에 addTarget설정후 하는 방식
  @objc fileprivate func navToSecond(_ sender: UIButton) {
    print(#fileID, #function, #line, "- 두번째VC로 이동")
    // 화면이동 메서드(segue way에 Identifier연결)
    self.performSegue(withIdentifier: "navToSecondVC", sender: nil)
  }

  // segue way 방식
  // VC끼리만 연결해 놓고 버튼에 addTarget설정후 하는 방식
  @objc fileprivate func navToDetail(_ sender: UIButton) {
    print(#fileID, #function, #line, "- 디테일VC로 이동")
    // 화면이동 메서드(segue way에 Identifier연결)
    self.performSegue(withIdentifier: "navToDetailVC", sender: nil)
  }


  // 프로그램 푸시 버튼
  // 버튼에 직접 주입하는 방식
  @IBAction func onPushButton(_ sender: UIButton) {

    let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    let vc = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController

    vc.stepNumber = stepNumber + 1

    self.navigationController?.pushViewController(vc, animated: true)
    print(#fileID, #function, #line, "- 프로그램 푸시 횟수: \(stepNumber)")

  }



  
}

