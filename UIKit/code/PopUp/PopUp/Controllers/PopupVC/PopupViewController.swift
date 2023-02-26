//
//  PopupViewController.swift
//  PopUp
//
//  Created by 이용일(Rodi) on 2023/02/26.
//
import UIKit

final class PopupViewController: UIViewController {
  // MARK: - 속성
  private let popView = PopupView()

  var checkPopup: Bool = true // popup창 상태


  // MARK: - 라이프사이클
  // 로드뷰
  override func loadView() {
    self.view = popView
  }

  // 뷰디드로드
  override func viewDidLoad() {
    super.viewDidLoad()
    addTarget()
  }

  // MARK: - 메서드
  // 버튼 설정
  private func addTarget() {
    // 자세히보기
    popView.deepButton.addTarget(self, action: #selector(deepButtonTapped), for: .touchUpInside)
    // 다시 보지 않기
    popView.destructButton.addTarget(self, action: #selector(destructButtonTapped), for: .touchUpInside)
    // 닫기
    popView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for:  .touchUpInside)
  }

}

// MARK: - 확장 / 셀렉터 모음
extension PopupViewController {

  @objc func deepButtonTapped() {
    print(#fileID, #function, #line, "- 자세히보기 버튼이 눌렸다.")

    let vc = PresentViewController()
    self.present(vc, animated: true)
  }

  @objc func destructButtonTapped() {
    print(#fileID, #function, #line, "- 다시보지않기 버튼이 눌렸다.")

    self.checkPopup = false
    UserDefault().saveUserdefault(checkPopup: self.checkPopup)

    self.dismiss(animated: true)
  }

  @objc func cancelButtonTapped() {
    print(#fileID, #function, #line, "- 닫기 버튼이 눌렸다.")

    self.dismiss(animated: true)
  }

}
