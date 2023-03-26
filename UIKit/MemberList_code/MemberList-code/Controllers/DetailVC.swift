//
//  DetailViewController.swift
//  MemberList-code
//
//  Created by 이용일 on 2022/09/28.
//

import UIKit
// 피커뷰를 사용하기 위해서 import해주는 프레임워크 (최소 ios14버전)
// 기존에는 info도 바꿔줘야 했으나 지금은 괜찮음
import PhotosUI

final class DetailVC: UIViewController {

  private let detailView = DetailView()

  var member: Member?

  // 커스텀 델리게이트 대리자 설정을 해주기 위해 변수설정
  weak var delegate: MemberDelegate?

  // MARK: - 로드뷰
  override func loadView() {
    self.view = detailView
  }

  // MARK: - 뷰디드로드
  override func viewDidLoad() {
    super.viewDidLoad()
    setupData()
    setupButtonAction()
    setupTagGesture()
  }

  // MARK: - 데이터를 받아서 디테일뷰에 넣어누는 메서드
  private func setupData() {
    detailView.member = member
  }

  // MARK: - 업데이트버튼 메서드
  fileprivate func setupButtonAction() {
    detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
  }

  // MARK: - 버튼을 눌렀을 때 select
  @objc func saveButtonTapped() {

    // 멤버가 없다면
    if member == nil {
      let name = detailView.nameTextField.text ?? ""
      let age = Int(detailView.ageTextField.text ?? "")
      let phoneNumber = detailView.phoneNumberTextField.text ?? ""
      let address = detailView.addressTextField.text ?? ""

      var newMember =
      Member(name: name, age: age, phone: phoneNumber, address: address)
      newMember.memeberImage = detailView.mainImageView.image

      // 커스텀 델리게이트 방식으로 구현
      delegate?.addNewMember(newMember)

      // 멤버가 있다면
    } else {
      guard var member = self.member else { return }

      member.memeberImage = detailView.mainImageView.image

      let memberId = Int(detailView.memberIdTextField.text!) ?? 0
      member.name = detailView.nameTextField.text ?? ""
      member.age = Int(detailView.ageTextField.text!) ?? 0
      member.phone = detailView.phoneNumberTextField.text ?? ""
      member.address = detailView.addressTextField.text ?? ""
      setupData()
      //  커스텀 델리게이트 방식으로 구현 - 추천방식
      delegate?.update(index: memberId, member)
    }
    self.navigationController?.popViewController(animated: true)
  }

  // MARK: - 이미지 뷰가 눌렸을 때 동작 설정(제스처)
  func setupTagGesture() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpImageView))
    detailView.mainImageView.addGestureRecognizer(tapGesture)
    detailView.mainImageView.isUserInteractionEnabled = true
  }

  // MARK: - 피커뷰를 설정하는 메서드
  @objc func touchUpImageView() {
    // 기본설정 세팅
    var configuration = PHPickerConfiguration()
    configuration.selectionLimit = 0
    configuration.filter = .any(of: [.images, .videos])

    // 기본설정을 가지고, 피커뷰컨트롤러 생성
    let picker = PHPickerViewController(configuration: configuration)
    // 피커뷰컨트롤러의 대리자 설정
    picker.delegate = self
    // 피커뷰 띄우기
    self.present(picker, animated: true)
  }

  // MARK: - 소멸자
  deinit {
    print("디테일 VC 해제")
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }

}

// MARK: - 확장 / 피커뷰 델리게이트
// 피커뷰를 사용하기 위해서는 이 프로토콜을 채택해야 한다. - 델리게이트패턴으로 되어있다.
// 델리게이트 패턴이기 때문에 대리자 설정 필수
extension DetailVC: PHPickerViewControllerDelegate {

  // 필수구현 메서드 - 사진이 선택되면 실행하는 메서드
  func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
    // 피커뷰 dismiss
    picker.dismiss(animated: true)

    let itemProvider = results.first?.itemProvider

    if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
      itemProvider.loadObject(ofClass: UIImage.self) { (image, errer) in
        DispatchQueue.main.async {
          self.detailView.mainImageView.image = image as? UIImage
        }

      }
    } else {
      print("이미지 못 불러왔음")
    }
  }


}

