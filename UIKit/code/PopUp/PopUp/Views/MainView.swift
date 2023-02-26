//
//  MainView.swift
//  PopUp
//
//  Created by 이용일(Rodi) on 2023/02/26.
//
import UIKit
import SnapKit
import Then

protocol MainViewDelegate: AnyObject {
  func loginButtonPressed()
  func searchIDButtonPressed()
  func searchPWButtonPressed()
  func emailButtonPressed()
  func kakaoButtonPressed()
  func googleButtonPressed()
  func naverButtonPressed()
}

final class MainView: UIView {

  // MARK: - 속성
  var delegate: MainViewDelegate?

  private let mainImage = UIImageView().then {
    $0.image = UIImage(systemName: "car.fill")
    $0.contentMode = .scaleAspectFill
  }

  private let mainLabel = UILabel().then {
    $0.text = "Login"
    $0.font = UIFont.systemFont(ofSize: 40, weight: .bold)
    $0.textColor = .white
  }

  lazy var mainStackView = UIStackView().then {
    $0.addArrangedSubview(mainImage)
    $0.addArrangedSubview(mainLabel)

    $0.axis = .horizontal
    $0.spacing = 8
    $0.alignment = .fill
  }

  // 이메일 텍스트필드 컨테이너뷰
  private lazy var emailContainerView: UIView = {
    let view = Utilities().makeInputContainerView(textField: emailTextField)

    return view
  }()

  // 비밀번호 텍스트필드 컨테이너뷰
  private lazy var passwordContainerView: UIView = {
    let view = Utilities().makeInputContainerView(textField: passwordTextField)
    view.addSubview(secureButton)

    return view
  }()

  // 이메일 텍스트필드
  let emailTextField: UITextField = {
    let tf = Utilities().inputTextField(placeholder: "아이디 입력")
    tf.clearButtonMode = .always

    return tf
  }()

  // 비밀번호 텍스트필드
  var passwordTextField: UITextField = {
    let tf = Utilities().inputTextField(placeholder: "비밀번호 입력")
    tf.isSecureTextEntry = true

    return tf
  }()

  // 표시버튼
  private let secureButton: UIButton = {
    let button = UIButton()
    button.setTitle("표시", for: .normal)
    button.titleLabel?.textColor = .lightGray
    button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    button.addTarget(self, action: #selector(secureButtonTapped), for: .touchUpInside)

    return button
  }()

  // 로그인 버튼
  let loginButton: UIButton = {
    let button = Utilities().setupButton(backColor: .white, text: "로그인", textColor: .black)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)

    return button
  }()

  // 로그인관련 스택뷰
  lazy var loginStackView = UIStackView().then {
    $0.addArrangedSubview(emailContainerView)
    $0.addArrangedSubview(passwordContainerView)
    $0.addArrangedSubview(loginButton)

    $0.axis = .vertical
    $0.alignment = .fill
    $0.spacing = 25
    $0.distribution = .fillEqually
  }

  // 아이디찾기 버튼
  let searchIDButton: UIButton = {
    let button = Utilities().setupAttributedButton("아이디 찾기  |")

    return button
  }()

  // 비밀번호찾기 버튼
  let searchPWButton: UIButton = {
    let button = Utilities().setupAttributedButton("   비밀번호 찾기")

    return button
  }()

  // 스택뷰
  private lazy var searchStackView = UIStackView().then {
    $0.addArrangedSubview(searchIDButton)
    $0.addArrangedSubview(searchPWButton)

    $0.axis = .horizontal
    $0.alignment = .center
  }


  // 카카오 컨테이너뷰
  lazy var kakaoContainerView: UIView = {
    let view = Utilities().setupButtonContainerView(withImage: #imageLiteral(resourceName: "Vector"), button: kakaoButton)


    return view
  }()

  // 구글 컨테이너뷰
  lazy var googleContainerView: UIView = {
    let view = Utilities().setupButtonContainerView(withImage: #imageLiteral(resourceName: "Google"), button: googleButton)

    return view
  }()

  // 네이버 컨테이너뷰
  lazy var naverContainerView: UIView = {
    let view = Utilities().setupButtonContainerView(withImage: #imageLiteral(resourceName: "icon_naver"), button: naverButton)

    return view
  }()

  // 이메일 버튼
  lazy var emailButton: UIButton = {
    let button = Utilities().setupButton(backColor: .rgb(red: 85, green: 85, blue: 85), text: "이메일로가입", textColor: .white)

    return button
  }()
  // 카카오 버튼
  lazy var kakaoButton: UIButton = {
    let button = Utilities().setupButton(backColor: .rgb(red: 255, green: 234, blue: 15), text: "카카오로 시작하기", textColor: .black)

    return button
  }()
  // 구글버튼
  lazy var googleButton: UIButton = {
    let button = Utilities().setupButton(backColor: .white, text: "구글로 시작하기", textColor: .black)

    return button
  }()
  // 네이버버튼
  lazy var naverButton: UIButton = {
    let button = Utilities().setupButton(backColor: .rgb(red: 113, green: 198, blue: 92), text: "네이버로 시작하기", textColor: .white)

    return button
  }()

  private lazy var buttonStackView = UIStackView().then {
    $0.addArrangedSubview(emailButton)
    $0.addArrangedSubview(kakaoContainerView)
    $0.addArrangedSubview(googleContainerView)
    $0.addArrangedSubview(naverContainerView)

    $0.axis = .vertical
    $0.alignment = .fill
    $0.distribution = .fillEqually
    $0.spacing = 12
  }




  // MARK: - 라이프사이클
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
    textFielddelegate()
    setupAddtarget()
  }

  // 오토레이아웃잡는 시점
  override func updateConstraints() {
    setupSnp()
    super.updateConstraints()
  }

  // 텍스트필드 델리게이트
  func textFielddelegate() {
    emailTextField.delegate = self
    passwordTextField.delegate = self
  }

  // 필수생성자
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  // UI넣는 메서드
  private func setupUI() {
    self.backgroundColor = UIColor.rgb(red: 37, green: 37, blue: 37)
    self.addSubview(mainStackView)
    self.addSubview(loginStackView)
    self.addSubview(searchStackView)
    self.addSubview(buttonStackView)
  }

  // 스냅킷 메서드
  private func setupSnp() {
    mainImage.snp.makeConstraints {
      $0.size.equalTo(40)
    }

    mainStackView.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalToSuperview().offset(60)
      $0.height.equalTo(44)
    }

    loginStackView.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(mainStackView.snp.bottom).offset(111)
      $0.left.equalToSuperview().offset(20)
    }

    secureButton.snp.makeConstraints {
      $0.centerY.equalTo(passwordContainerView.snp.centerY)
      $0.right.equalTo(passwordContainerView.snp.right)
    }

    passwordTextField.snp.makeConstraints {
      $0.right.equalTo(passwordContainerView.snp.right).offset(-33)
    }

    loginButton.snp.makeConstraints {
      $0.height.equalTo(50)
    }

    searchStackView.snp.makeConstraints {
      $0.top.equalTo(loginStackView.snp.bottom).offset(19)
      $0.centerX.equalToSuperview()
    }

    buttonStackView.snp.makeConstraints {
      $0.top.equalTo(searchStackView.snp.bottom).offset(68)
      $0.horizontalEdges.equalTo(loginStackView.snp.horizontalEdges)
      $0.bottom.equalToSuperview().offset(-30)
    }
  }

  // 빈곳 터치 메서드
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.endEditing(true)
  }

  // 셀렉터 - 표시버튼
  @objc func secureButtonTapped() {
    passwordTextField.isSecureTextEntry.toggle()
  }

  // 버튼 addtarget 모음
  private func setupAddtarget() {
    loginButton.addTarget(self, action: #selector(loginButtonTapped ), for: .touchUpInside)
    searchIDButton.addTarget(self, action: #selector(searchIDButtonTapped), for: .touchUpInside)
    searchPWButton.addTarget(self, action: #selector(searchPWButtonTapped), for: .touchUpInside)

    emailButton.addTarget(self, action: #selector(emailButtonTappad), for: .touchUpInside)
    kakaoButton.addTarget(self, action: #selector(kakaoButtonTapped), for: .touchUpInside)
    googleButton.addTarget(self, action: #selector(googleButtonTapped), for: .touchUpInside)
    naverButton.addTarget(self, action: #selector(naverButtonTapped), for: .touchUpInside)

  }


}

// MARK: - 확장 / 버튼 델리데이트
extension MainView {
  @objc func loginButtonTapped() {
    delegate?.loginButtonPressed()
  }

  @objc func searchIDButtonTapped() {
    delegate?.searchIDButtonPressed()
  }

  @objc func searchPWButtonTapped() {
    delegate?.searchPWButtonPressed()
  }

  @objc func emailButtonTappad() {
    delegate?.emailButtonPressed()
  }

  @objc func kakaoButtonTapped() {
    delegate?.kakaoButtonPressed()
  }

  @objc func googleButtonTapped() {
    delegate?.googleButtonPressed()
  }

  @objc func naverButtonTapped() {
    delegate?.naverButtonPressed()
  }

}

// MARK: - 확장 / 텍스트필드 델리게이트
extension MainView: UITextFieldDelegate {


}

#if DEBUG
import SwiftUI

struct MainView_Previews: PreviewProvider {

  static var previews: some View {
    if #available(iOS 14.0, *) {
      MainView().getPreview()
        .ignoresSafeArea()
    }

  }
}
#endif
