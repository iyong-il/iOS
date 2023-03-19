//
//  ThirdVC.swift
//  UIKit_Storyboard_Navigation_Tutorial
//
//  Created by 이용일(Rodi) on 2023/03/05.
//

import UIKit

final class ThirdVC: UIViewController {

  // MARK: - 속성
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subTitleLabel: UILabel!

  var someValue1: String = "" {
    didSet {
      print(#fileID, #function, #line, "- \(someValue1)")
    }
  }

  var someValue2: String = "" {
    didSet {
      print(#fileID, #function, #line, "- \(someValue2)")
    }
  }


  init?(coder:NSCoder, someValue: String) {
    self.someValue2 = someValue
    super.init(coder: coder)
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }


  // MARK: - 라이프사이클
  override func viewDidLoad() {
    super.viewDidLoad()
    print(#fileID, #function, #line, "- 세번째VC로 왔다.")
    titleLabel.text = someValue1
    subTitleLabel.text = someValue2
  }


  // MARK: - 메서드
  @IBAction func goBackFirstVC(_ sender: UIButton) {
    print(#fileID, #function, #line, "- 세번째VC에서 unwindSegue로 두번째VC 이동")
  }

  @IBAction func popToVC(_ sender: NavigationButton) {
    print(#fileID, #function, #line, "- 세번째VC에서 popToroot로 첫번째VC 이동")
//    self.navigationController?.popToRootViewController(animated: true)
    guard let viewControllers = self.navigationController?.viewControllers else { return }
    var vc: UIViewController? = nil

    switch sender.routeVC {
    case  .firstVC:
      vc = viewControllers.first(where: {$0 is FirstVC})
    case .secondVC:
      vc = viewControllers.first(where: {$0 is SecondVC})
    default:
      break
    }
    
    guard let vc = vc else { return }
    self.navigationController?.popToViewController(vc, animated: true)

  }

  // 여기는 현재 사용하지 않음
  @IBAction func gobackToSecond(_ sender: UIButton) {
    print(#fileID, #function, #line, "- 세번째VC에서 poptoView로 두번째 VC 이동")
    
//    self.navigationController?.popToViewController(navigationController!.viewControllers, animated: true)

  }


  @IBAction func goBackToFirst(_ sender: UIButton) {
    print(#fileID, #function, #line, "- 세번째VC에서 unwindSegue로 첫번째VC 이동")
  }


}
