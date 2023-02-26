//
//  Utilities.swift
//  PopUp
//
//  Created by 이용일(Rodi) on 2023/02/26.
//
import UIKit
import SnapKit

struct Utilities {

  // MARK: - 텍스트필드를 감싸는 뷰를 만드는 메서드
  func makeInputContainerView(textField: UITextField) -> UIView {
    let view = UIView()
    let divideView = UIView()
    divideView.backgroundColor = .lightGray

    view.addSubview(textField)
    view.addSubview(divideView)

    textField.snp.makeConstraints {
      $0.edges.equalToSuperview()
      $0.right.equalToSuperview().offset(30)
    }

    divideView.snp.makeConstraints {
      $0.height.equalTo(0.75)
      $0.top.equalTo(textField.snp.bottom)
      $0.horizontalEdges.equalTo(view.snp.horizontalEdges)
    }

    return view
  }
// MARK: -  텍스트필드를 만드는 메서드
  func inputTextField(placeholder: String) -> UITextField {
    let tf = UITextField()
    tf.font = UIFont.systemFont(ofSize: 18)
    tf.textColor = .lightGray
    tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    tf.autocapitalizationType = .none

    return tf
  }

  // MARK: - 버튼을 감싸는 뷰를 만드는 메서드
  func setupButtonContainerView(withImage: UIImage, button: UIButton) -> UIView {
    let view = UIView()
    let imageView = UIImageView()

    imageView.image = withImage

    view.addSubview(button)
    view.addSubview(imageView)

    imageView.snp.makeConstraints {
      $0.size.equalTo(22)
      $0.centerY.equalTo(view.snp.centerY)
      $0.left.equalTo(view.snp.left).offset(27)
    }

    button.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }

    return view
  }

  // MARK: - 버튼 만드는 메서드
  func setupButton(backColor: UIColor, text: String, textColor: UIColor) -> UIButton {
    let button = UIButton()
    button.setTitle(text, for: .normal)
    button.setTitleColor(textColor, for: .normal)
    button.backgroundColor = backColor
    button.heightAnchor.constraint(equalToConstant: 48).isActive = true
    button.layer.cornerRadius = 8


    return button
  }

  // MARK: - 아이디 / 비밀번호 찾기버튼 만들기
  func setupAttributedButton(_ first: String) -> UIButton {
    let button = UIButton()
    let attributedTitle = NSMutableAttributedString(string: first, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular), NSMutableAttributedString.Key.foregroundColor: UIColor.lightGray])


    button.setAttributedTitle(attributedTitle, for: .normal)

    return button
  }
}


