//
//  ViewController.swift
//  PopUp
//
//  Created by 이용일(Rodi) on 2023/02/26.
//
import UIKit
import SnapKit
import Then

final class MainViewController: UIViewController {

  // MARK: - 속성
  private let mainView = MainView()

  private lazy var scrollView = UIScrollView().then {
    $0.isUserInteractionEnabled = true
    $0.alwaysBounceVertical = true
    $0.alwaysBounceHorizontal = false
    $0.showsVerticalScrollIndicator = false
    $0.addSubview(mainView)
  }


  private let checkTrue: Bool = true

  var checkPopup = UserDefault().loadUserdefault() // popup 상태

  // MARK: - 라이프사이클
  // 로드뷰
  override func loadView() {
    self.view = scrollView

    // 스크롤뷰 width - frame, edges - content (그냥 외우자)
    mainView.snp.makeConstraints {
      $0.width.equalTo(scrollView.frameLayoutGuide.snp.width)
      $0.edges.equalTo(scrollView.contentLayoutGuide.snp.edges)
    }

  }

  // 뷰디드로드
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    mainView.delegate = self

  }

  // 화면전환 시 뷰가 나타나기전 호출되는 메서드(반복적으로 호출된다.)
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.navigationBar.isHidden = true

    if checkPopup == true {
      popup()
    } else {

    }
  }

  // 팝업설정
  private func popup() {
    let vc = UINavigationController(rootViewController: PopupViewController())
    vc.modalPresentationStyle = .overCurrentContext
    self.present(vc, animated: true)
  }

  // UI설정
  private func setupUI() {
    self.view.backgroundColor = UIColor.rgb(red: 37, green: 37, blue: 37)
  }


}


// MARK: - 확장 / 셀렉터 모음
extension MainViewController {

}

// MARK: - 확장 / 버튼 델리게이트
extension MainViewController: MainViewDelegate {

  func loginButtonPressed() {
    print(#fileID, #function, #line, "- 로그인버튼이 눌렸다. / 델리게이트")
    UserDefault().saveUserdefault(checkPopup: true)
  }

  func searchIDButtonPressed() {
    print(#fileID, #function, #line, "- 아이디 찾기 버튼이 눌렸다. / 델리게이트")
  }

  func searchPWButtonPressed() {
    print(#fileID, #function, #line, "- 비밀번호 찾기 버튼이 눌렸다. / 델리게이트")
  }

  func emailButtonPressed() {
    print(#fileID, #function, #line, "- 이메일로 가입 버튼이 눌렸다. / 델리게이트")
  }

  func kakaoButtonPressed() {
    print(#fileID, #function, #line, "- 카카오로 시작하기 버튼이 눌렸다. / 델리게이트")
  }

  func googleButtonPressed() {
    print(#fileID, #function, #line, "- 구글로 시작하기 버튼이 눌렸다. / 델리게이트")
  }

  func naverButtonPressed() {
    print(#fileID, #function, #line, "- 네이버로 시작하기 버튼이 눌렸다. / 델리게이트")
  }

}
