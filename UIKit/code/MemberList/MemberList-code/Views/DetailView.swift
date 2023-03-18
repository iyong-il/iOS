//
//  DetailView.swift
//  MemberList-code
//
//  Created by 이용일 on 2022/09/28.
//

import UIKit
import Then
import SnapKit

class DetailView: UIView {

  var member: Member? {
    didSet {
      guard var member = self.member else {
        // 멤버가 없다면 버튼을 SAVE로 세팅
        saveButton.setTitle("SAVE", for: .normal)
        // 멤버가 없다면 타입저장속성의 현재숫자 가져오기
        memberIdTextField.text = "\(Member.memberNumbers)"
        return
      }

      // 멤버가 있다면
      mainImageView.image = member.memeberImage
      memberIdTextField.text = "\(member.memberId)"
      nameTextField.text = member.name
      phoneNumberTextField.text = member.phone
      addressTextField.text = member.address

      // 나이항목 구현 - 1
      guard let age = member.age else {
        ageTextField.text = ""
        return
      }
      ageTextField.text = "\(age)"
      // 나이항목 구현 - 2
//      ageTextField.text = member.age != nil ? "\(member.age)" : ""
    }
  }
// MARK: - 이미지뷰
  let mainImageView = UIImageView().then {
    $0.backgroundColor = .lightGray
    $0.clipsToBounds = true
    $0.layer.cornerRadius = 75
  }

  lazy var imageContainView = UIView().then {
    $0.addSubview(mainImageView)
  }
// MARK: - 멤버번호
  let memberIdLabel = UILabel().then {
    $0.text = "멤버번호:"
    $0.font = UIFont.boldSystemFont(ofSize: 16)
  }

  let memberIdTextField = UITextField().then {
    $0.frame.size.height = 22
    $0.textColor = .black
    $0.borderStyle = .roundedRect
    $0.autocapitalizationType = .none
    $0.autocorrectionType = .no
    $0.spellCheckingType = .no
    $0.clearsOnBeginEditing = false
  }

  lazy var memberIdStackView = UIStackView().then {
    $0.addArrangedSubview(memberIdLabel)
    $0.addArrangedSubview(memberIdTextField)

    $0.spacing = 5
    $0.axis = .horizontal
    $0.distribution = .fill
    $0.alignment = .fill
  }
  // MARK: - 멤버이름
  let nameLabel = UILabel().then {
    $0.font = UIFont.boldSystemFont(ofSize: 16)
    $0.text = "이       름:"
  }

  let nameTextField = UITextField().then {
    $0.frame.size.height = 22
    $0.borderStyle = .roundedRect
    $0.autocapitalizationType = .none
    $0.autocorrectionType = .no
    $0.spellCheckingType = .no
    $0.clearsOnBeginEditing = false
  }

  lazy var nameStackView = UIStackView().then {
    $0.addArrangedSubview(nameLabel)
    $0.addArrangedSubview(nameTextField)

    $0.spacing = 5
    $0.axis = .horizontal
    $0.distribution = .fill
    $0.alignment = .fill
  }
  // MARK: - 나이
  let ageLabel = UILabel().then {
    $0.font = UIFont.boldSystemFont(ofSize: 16)
    $0.text = "나       이:"
  }

  let ageTextField = UITextField().then {
    $0.frame.size.height = 22
    $0.borderStyle = .roundedRect
    $0.autocapitalizationType = .none
    $0.autocorrectionType = .no
    $0.spellCheckingType = .no
    $0.clearsOnBeginEditing = false
  }

  lazy var ageStackView = UIStackView().then {
    $0.addArrangedSubview(ageLabel)
    $0.addArrangedSubview(ageTextField)

    $0.spacing = 5
    $0.axis = .horizontal
    $0.distribution = .fill
    $0.alignment = .fill
  }
  // MARK: - 전화번호
  let phoneNumberLabel = UILabel().then {
    $0.font = UIFont.boldSystemFont(ofSize: 16)
    $0.text = "전화번호:"
  }

  let phoneNumberTextField = UITextField().then {
    $0.frame.size.height = 22
    $0.borderStyle = .roundedRect
    $0.autocapitalizationType = .none
    $0.autocorrectionType = .no
    $0.spellCheckingType = .no
    $0.clearsOnBeginEditing = false
  }

  lazy var phoneNumberStackView = UIStackView().then {
    $0.addArrangedSubview(phoneNumberLabel)
    $0.addArrangedSubview(phoneNumberTextField)
    $0.spacing = 5
    $0.axis = .horizontal
    $0.distribution = .fill
    $0.alignment = .fill
  }
  // MARK: - 주소
  let addressLabel = UILabel().then {
    $0.font = UIFont.boldSystemFont(ofSize: 16)
    $0.text = "주       소:"
  }

  let addressTextField = UITextField().then {
    $0.frame.size.height = 22
    $0.borderStyle = .roundedRect
    $0.autocapitalizationType = .none
    $0.autocorrectionType = .no
    $0.spellCheckingType = .no
    $0.clearsOnBeginEditing = false
  }

  lazy var addressStackView = UIStackView().then {
    $0.addArrangedSubview(addressLabel)
    $0.addArrangedSubview(addressTextField)

    $0.spacing = 5
    $0.axis = .horizontal
    $0.distribution = .fill
    $0.alignment = .fill
  }
  // MARK: - 저장버튼
  let saveButton = UIButton().then {
    $0.backgroundColor = .systemBlue
    $0.setTitle("UPDATE", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.frame.size.height = 40
  }
  // MARK: - 스택뷰
  lazy var stackView = UIStackView().then {
    $0.addArrangedSubview(imageContainView)
    $0.addArrangedSubview(memberIdStackView)
    $0.addArrangedSubview(nameStackView)
    $0.addArrangedSubview(ageStackView)
    $0.addArrangedSubview(phoneNumberStackView)
    $0.addArrangedSubview(addressStackView)
    $0.addArrangedSubview(saveButton)


    $0.spacing = 10
    $0.axis = .vertical
    $0.distribution = .fill
    $0.alignment = .fill
  }
  // 레이블의 넓이
  let labelWidth: CGFloat = 70
  //애니메이션을 위한 속성
  var stackViewTopConstraint: NSLayoutConstraint!


  // MARK: - 뷰디드로드
  override init(frame: CGRect) {
    super.init(frame: frame)
    // 기본배경화면이 검정이기 때문에 설정해줘야 한다.
    self.backgroundColor = .white
    setupStackView()
    setupNotification()

    //텍스트필드의 대리자 설정
    memberIdTextField.delegate = self
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  // MARK: - 뷰를 넣는 메서드
  private func setupStackView() {
    self.addSubview(stackView)
  }

  // MARK: - 노티피케이션 설정 메서드
  // 키보드가 올라오면서 화면 전체가 움직이는 메서드
  // 소멸자를 구현해줘야한다.
  private func setupNotification() {
    // 키보드가 올라올 때 실행하는 메서드
    NotificationCenter.default.addObserver(self, selector: #selector(moveUpAction), name: UIResponder.keyboardWillShowNotification, object: nil)
    // 키보드가 내려갈 때 실행하는 메서드
    NotificationCenter.default.addObserver(self, selector: #selector(moveDownAction), name: UIResponder.keyboardWillHideNotification, object: nil)
  }

  // MARK: - 노티피케이션 - 뷰가 올라가는 메서드
    @objc func moveUpAction() {
      stackViewTopConstraint.constant = -20
      UIView.animate(withDuration: 0.2) {
        self.layoutIfNeeded()
      }
    }
    // MARK: - 노티피케이션 - 뷰가 내려가는 메서드
  @objc func moveDownAction() {
    stackViewTopConstraint.constant = 10
    UIView.animate(withDuration: 0.2) {
      self.layoutIfNeeded()
    }
  }


  // MARK: - 오토레이아웃 설정
  // 오토레이아웃 업데이트
  override func updateConstraints() {
    setAutoLayout()
    super.updateConstraints()
  }

  // MARK: - 스택뷰 오토레이아웃 메서드
  fileprivate func setAutoLayout() {
    mainImageView.snp.makeConstraints {
      $0.size.equalTo(150)
      $0.centerY.equalTo(imageContainView.snp.centerY)
      $0.centerX.equalTo(imageContainView.snp.centerX)
    }

    imageContainView.snp.makeConstraints {
      $0.height.equalTo(180)
    }

    [memberIdLabel, nameLabel, ageLabel, phoneNumberLabel, addressLabel].forEach {
      $0.snp.makeConstraints {
        $0.width.equalTo(labelWidth)
      }
    }

    stackViewTopConstraint = stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10)

    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackViewTopConstraint,
      stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
    ])

  }
  // MARK: - 노티피케이션 소멸자
  deinit {
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.endEditing(true)
  }

}

// MARK: - 확장 / 텍스트필드 델리게이트
// 대리자 설정 필수
extension DetailView: UITextFieldDelegate {
  // 텍스트필드에서 입력이 될 때마다 실행이 되는 메서드
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    // 멤버번호는 수정할 수 없게 설정
    if textField == memberIdTextField {
      return false
    }
    // 나머지 텍스트 필드는 수정가능하게 설정
    return true
  }
}
