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
  @IBOutlet weak var titleLabel: UILabel!

  @IBOutlet weak var prepareLabel: UITextField!
  @IBOutlet weak var IBSegueActionLabel: UITextField!

  var someValue: String = "" {
    didSet {
      print(#fileID, #function, #line, "- someValue: \(someValue)")
    }
  }

  // ios 13버전 이상의 데이터를 넘기고 싶을때 받는 쪽에서는 생성자를 만들어줘야 한다.
  init?(coder:NSCoder, someValue: String) {
    self.someValue = someValue
    super.init(coder: coder)
    print(#fileID, #function, #line, "- ")
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    print(#fileID, #function, #line, "- ")
  }
  
  // MARK: - 라이프사이클
  override func viewDidLoad() {
    super.viewDidLoad()
    print(#fileID, #function, #line, "- 두번째VC로 왔다.")
    titleLabel.numberOfLines = 4
    titleLabel.text = someValue

    prepareLabel.placeholder = "prepare방식으로 넘기기"
    IBSegueActionLabel.placeholder = "IBSegueActionLabel방식으로 넘기기"
    
    moveToThirdVC.addTarget(self, action: #selector(moveToThirdButtonTapped(_:)), for: .touchUpInside)
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    prepareLabel.text?.removeAll()
    IBSegueActionLabel.text?.removeAll()
  }
  
  
  // MARK: - 메서드
  @objc fileprivate func moveToThirdButtonTapped(_ sender:UIButton) {
    print(#fileID, #function, #line, "- 세번재VC로 이동")
    self.performSegue(withIdentifier: "moveToThirdVC", sender: self)
  }

  // prepare방식
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    print(#fileID, #function, #line, "- 세번째 VC로 값을 넘긴다. / prepare방식")
    guard let vc = segue.destination as? ThirdVC else { return }
    vc.someValue1 = prepareLabel.text ?? "값이 없다."
  }

  // ios 13이상 버전 지원 방식
  @IBSegueAction func navToThirdVCWithSomeData(coder: NSCoder, sender: Any?, segueIdentifier: String?) -> ThirdVC? {
    print(#fileID, #function, #line, "- \(String(describing: segueIdentifier))")

    let data = IBSegueActionLabel.text ?? "값이 없다."

    return ThirdVC(coder: coder, someValue: data)
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
