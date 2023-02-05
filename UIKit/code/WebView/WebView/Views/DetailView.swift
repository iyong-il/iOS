//
//  DetailView.swift
//  WebView
//
//  Created by 이용일(Rodi) on 2023/01/29.
//

import UIKit
import SnapKit
import Then

final class DetailView: UIView {

  private let label = UILabel().then {
    $0.text = "안녕하세요 \n고객센터 입니다. \n무엇을 도와드릴까요?"
    $0.font = UIFont.systemFont(ofSize: 18, weight: .regular)
    $0.numberOfLines = 0
//    $0.lineSpacing = 2
  }

  let button1: UIButton = {
    let button = UIButton()

    return button
  }()

  let button2: UIButton = {
    let button = UIButton()

    return button
  }()

  let button3: UIButton = {
    let button = UIButton()

    return button
  }()

  private lazy var view1: UIView = {
    let view = Utilities().makeView(num: 20, image: "ellipsis.message", text: "자주 묻는 질문", btn: button1)
    setupShadow(view: view)

    return view
  }()

  private lazy var view2: UIView = {
    let view = Utilities().makeView(num: 20, image: "pencil.line", text: "광고문의", btn: button2)
    setupShadow(view: view)

    return view
  }()

  private lazy var view3: UIView = {
    let view = Utilities().makeView(num: 20, image: "cart", text: "입점문의", btn: button3)
    setupShadow(view: view)

    return view
  }()

  private lazy var stack: UIStackView = {
    let st = UIStackView(arrangedSubviews: [view1, view2, view3])
    st.axis = .vertical
    st.spacing = 16

    return st
  }()


  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  func setupUI() {
    self.backgroundColor = .white
    self.addSubview(label)
    label.snp.makeConstraints {
      $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(40)
      $0.left.equalToSuperview().offset(20)
    }

    self.addSubview(stack)
    stack.snp.makeConstraints {
      $0.top.equalTo(label.snp.bottom).offset(33)
      $0.centerX.equalToSuperview()
      $0.left.equalToSuperview().offset(20)
    }
  }





  func setupShadow(view: UIView) {
    view.layer.borderColor = UIColor.lightGray.cgColor
    view.layer.borderWidth = 2
    view.layer.cornerRadius = 8
  }
}

