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
  @IBOutlet weak var textField: UITextField!

  var stepNumber: Int = 1 {
    didSet {
      self.title = "스텝넘버 : \(self.stepNumber)"
    }
  }
  
  
  // MARK: - 라이프사이클
  override func viewDidLoad() {
    super.viewDidLoad()

    navToSecondVCButton.addTarget(self, action: #selector(navToSecond(_:)), for: .touchUpInside)
    navToDetailVCButton.addTarget(self, action: #selector(navToDetail(_:)), for: .touchUpInside)
  }
  
  
  // MARK: - 메서드
  
  // segue way 방식
  // VC끼리만 연결해 놓고 버튼에 addTarget설정후 하는 방식
  @objc fileprivate func navToSecond(_ sender: UIButton) {
    print(#fileID, #function, #line, "- 두번째VC로 이동")
    // 화면이동 메서드(segue way에 Identifier연결)
    self.performSegue(withIdentifier: "navToSecondVC", sender: self)
  }
  
  @objc fileprivate func navToDetail(_ sender: UIButton) {
    print(#fileID, #function, #line, "- 디테일VC로 이동")
    
    self.performSegue(withIdentifier: "navToDetailVC", sender: self)
  }

  // segue way방식으로 화면전환 시 데이터 전달하는 방법
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)
    print(#fileID, #function, #line, "- segue way의 종착지는 : \(segue.destination)")

    guard let detailVC = segue.destination as? DetailVC else { return }

    detailVC.someValue = textField.text ?? "값이 없다."
  }

  // ios 13이상 부터 사용가능한 데이터 전달 방식(prepare보다 빠르다.)
  // 이렇게 사용할 때는 이동하고싶은 VC의 segue를 해당 VC와 연결해줘야 한다.
  @IBSegueAction func navToSecondVCWithSomeData(coder: NSCoder, sender: Any?, segueIdentifier: String?) -> SecondVC? {
    print(#fileID, #function, #line, "- segueIdentifier : \(segueIdentifier)")

    let data = textField.text ?? "값이 없다."

    return SecondVC(coder: coder, someValue: data)
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

