//
//  PopupView.swift
//  PopUp
//
//  Created by 이용일(Rodi) on 2023/02/26.
//
import UIKit
import SnapKit
import Then

final class PopupView: UIView {

  private let popupImageView = UIImageView().then {
    $0.backgroundColor = .systemYellow
  }

  var deepButton: UIButton = {
    let button = Utilities.setupButton(backColor: .black, text: "자세히 보기", textColor: .white)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)

    return button
  }()

  lazy var imageView = UIView().then {
    $0.addSubview(popupImageView)
    $0.addSubview(deepButton)
  }

  let destructButton: UIButton = {
    let button = Utilities.setupButton(backColor: .rgb(red: 217, green: 217, blue: 217), text: "다시 보지 않기", textColor: .rgb(red: 157, green: 153, blue: 153))
    button.layer.borderWidth = 0.5
    button.layer.borderColor = UIColor.lightGray.cgColor

    return button
  }()

  let cancelButton: UIButton = {
    let button = Utilities.setupButton(backColor: .rgb(red: 217, green: 217, blue: 217), text: "닫기", textColor: .rgb(red: 157, green: 153, blue: 153))
    button.layer.borderWidth = 0.5
    button.layer.borderColor = UIColor.lightGray.cgColor


    return button
  }()

  private lazy var buttonStackView = UIStackView().then {
    $0.addArrangedSubview(destructButton)
    $0.addArrangedSubview(cancelButton)

    $0.axis = .horizontal
    $0.alignment = .fill
    $0.distribution = .fillEqually
  }

  private lazy var totalStackView = UIStackView().then {
    $0.addArrangedSubview(popupImageView)
    $0.addArrangedSubview(imageView)
    $0.addArrangedSubview(buttonStackView)

    $0.axis = .vertical
    $0.alignment = .fill
  }


// MARK: - 라이프 사이클
  override func updateConstraints() {
    setupSnp()
    super.updateConstraints()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    setupAutoLayout()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }


  // MARK: - 메서드
  private func setupUI() {
    self.backgroundColor = .rgb(red: 157, green: 157, blue: 153, alpha: 0)
    self.addSubview(totalStackView)
  }

  private func setupSnp() {
    imageView.snp.makeConstraints {
      $0.width.equalTo(273)
      $0.height.equalTo(335)
    }

    popupImageView.snp.makeConstraints {
      $0.edges.equalTo(imageView.snp.edges)
    }

    deepButton.snp.makeConstraints {
      $0.height.equalTo(46)
      $0.left.equalTo(popupImageView.snp.left).offset(10)
      $0.bottom.equalTo(popupImageView.snp.bottom).offset(-17)
      $0.right.equalTo(popupImageView.snp.right).offset(-10)
    }

    cancelButton.snp.makeConstraints {
      $0.height.equalTo(54)
    }

    totalStackView.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.centerY.equalToSuperview()
    }
  }

  private func setupAutoLayout() {
    deepButton.layer.cornerRadius = 25
    destructButton.layer.cornerRadius = 0
    cancelButton.layer.cornerRadius = 0
    totalStackView.clipsToBounds = true
    totalStackView.layer.cornerRadius = 8
  }

}


#if DEBUG
import SwiftUI

struct PopupView_Previews: PreviewProvider {

  static var previews: some View {
    if #available(iOS 14.0, *) {
      PopupView().getPreview()
        .ignoresSafeArea()
    }

  }
}
#endif

