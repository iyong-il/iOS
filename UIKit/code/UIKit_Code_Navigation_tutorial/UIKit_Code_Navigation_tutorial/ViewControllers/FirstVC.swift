//
//  ViewController.swift
//  UIKit_Code_Navigation_tutorial
//
//  Created by 이용일(Rodi) on 2023/03/06.
//

import UIKit

final class FirstVC: UIViewController {

  // MARK: - 속성
  @IBOutlet weak var goToFirstVC: UIButton!

  fileprivate var stepNumber = 1 {
    didSet {
      self.title = "스텝넘버 : \(stepNumber)"
    }
  }


// MARK: - 라이프사이클
  override func viewDidLoad() {
    super.viewDidLoad()
    goToFirstVC.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
  }


  // MARK: - 메서드
  @objc func buttonPressed(_ sender: UIButton) {

    // 스토리보드 이름과 VC의 이름이 다르기 때문에 어쩔 수 없음....
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    guard let vc = storyboard.instantiateViewController(withIdentifier: "FirstVC") as? FirstVC else { return }
    self.navigationController?.pushViewController(vc, animated: true)
    vc.stepNumber = stepNumber + 1
  }

  @IBAction func buttonTapped(_ sender: NavigationButton) {
    guard let routeName = sender.routeName else { return }
    print(#fileID, #function, #line, "- route : \(routeName)")

    var vc: UIViewController? = nil

    switch sender.routeVC {
    case .secondVC:
      vc = SecondVC.getInstance()
    case .thirdVC:
      vc = ThirdVC.getInstance()
    case .DetailVC:
      vc = DetailVC.getInstance()
    default:
      break
    }

    if let vc = vc {
      self.navigationController?.pushViewController(vc, animated: true)
    }


  }
}

