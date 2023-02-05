//
//  MainView.swift
//  TodoList_UIKit
//
//  Created by 이용일(Rodi) on 2023/02/05.
//

import UIKit
import SnapKit

// MARK: - 프로토콜 / 델리게이트패턴
protocol MainViewDelegate: AnyObject {
  func closureButtonPressed()
  func rxButtonPressed()
  func combineButtonPressed()
  func asyncButtonPressed()
  func convertClosureToAsyncButtonPressed()
  func convertRxToAsyncButtonPressed()
  func convertCombineToAsyncButtonPressed()
  func resetButtonPressed()
  func deleteSelectToDoButtonPressed()
  func appendToDoButtonPressed()
}

final class MainView: UIView {

  // MARK: - 속성
  var delegate: MainViewDelegate?

  private let mainLabel: UILabel = {
    let label = UILabel()
    label.text = "MainVC / page: 1"
    label.textColor = .black

    return label
  }()

  private let selectToDoArray: UILabel = {
    let label = UILabel()
    label.text = "선택된 할 일: []"
    label.textColor = .black

    return label
  }()

  private lazy var closureButton = Utilities().makemethodButton(title: "클로저")
  private lazy var rxButton = Utilities().makemethodButton(title: "Rx")
  private lazy var combineButton = Utilities().makemethodButton(title: "콤바인")
  private lazy var asyncButton = Utilities().makemethodButton(title: "async")
  private lazy var selectMethodButtonStack: UIStackView = {
    let st = UIStackView(arrangedSubviews: [closureButton, rxButton, combineButton, asyncButton])
    st.axis = .horizontal
    st.spacing = 10
    st.distribution = .fillEqually

    return st
  }()

  private lazy var topStack: UIStackView = {
    let st = UIStackView(arrangedSubviews: [mainLabel, selectToDoArray, selectMethodButtonStack])
    st.axis = .vertical
    st.spacing = 10
    st.distribution = .fillProportionally

    return st
  }()

  private let actionConvertlabel: UILabel = {
    let label = UILabel()
    label.text = "Async변환 액션들"
    label.textColor = .black

    return label
  }()

  private lazy var convertClosureToAsyncButton = Utilities().makemethodButton(title: "클로저 👉 async")
  private lazy var convertRxToAsyncButton = Utilities().makemethodButton(title: "Rx 👉 async")
  private lazy var convertCombineToAsyncButton = Utilities().makemethodButton(title: "Combine 👉 async")
  private lazy var convertButtonStack: UIStackView = {
    let st = UIStackView(arrangedSubviews: [convertClosureToAsyncButton, convertRxToAsyncButton, convertCombineToAsyncButton])
    st.axis = .horizontal
    st.distribution = .fillEqually
    st.spacing = 10

    return st
  }()

  private lazy var resetButton = Utilities().makemethodButton(title: "초기화")
  private lazy var deleteSelectToDoButton = Utilities().makemethodButton(title: "선택된 \n할 일들 삭제")
  private lazy var appendToDoButton = Utilities().makemethodButton(title: "할 일 추가")
  private lazy var selectButtonStack: UIStackView = {
    let st = UIStackView(arrangedSubviews: [resetButton, deleteSelectToDoButton, appendToDoButton])
    st.axis = .horizontal
    st.distribution = .fillEqually
    st.spacing = 10

    resetButton.backgroundColor = .systemPurple
    deleteSelectToDoButton.backgroundColor = .brown
    appendToDoButton.backgroundColor = .systemIndigo

    return st
  }()

  private lazy var middleStack: UIStackView = {
    let st = UIStackView(arrangedSubviews: [actionConvertlabel, convertButtonStack, selectButtonStack])
    st.axis = .vertical
    st.distribution = .fill
    st.spacing = 10

    return st
  }()

  lazy var searchButton: UISearchBar = {
    let search = UISearchBar()
    search.enablesReturnKeyAutomatically = true
    search.isUserInteractionEnabled = true

    return search
  }()

  private lazy var totalStack: UIStackView = {
    let st = UIStackView(arrangedSubviews: [topStack, middleStack, searchButton])
    st.axis = .vertical
    st.distribution = .equalSpacing
    st.spacing = 10

    return st
  }()

  // MARK: - 라이프사이클
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
    setupAddTarget()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    convertClosureToAsyncButton.snp.makeConstraints { $0.height.equalTo(50) }
    [
      convertClosureToAsyncButton,
      convertRxToAsyncButton,
      convertCombineToAsyncButton,
      resetButton,
      deleteSelectToDoButton,
      appendToDoButton
    ].forEach { $0.layer.cornerRadius = 8 }
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  // MARK: - 메서드
  private func setupUI() {
    self.backgroundColor = .systemYellow

    self.addSubview(totalStack)
    totalStack.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.leading.trailing.equalToSuperview().inset(10)
      $0.bottom.equalToSuperview().inset(10)
    }
  }

  private func setupAddTarget() {
    closureButton.addTarget(self, action: #selector(closureButtonTapped), for: .touchUpInside)
    rxButton.addTarget(self, action: #selector(rxButtonTapped), for: .touchUpInside)
    combineButton.addTarget(self, action: #selector(combineButtonTapped), for: .touchUpInside)
    asyncButton.addTarget(self, action: #selector(asyncButtonTapped), for: .touchUpInside)

    convertClosureToAsyncButton.addTarget(self, action: #selector(convertClosureToAsyncButtonTapped), for: .touchUpInside)
    convertRxToAsyncButton.addTarget(self, action: #selector(convertRxToAsyncButtonTapped), for: .touchUpInside)
    convertCombineToAsyncButton.addTarget(self, action: #selector(convertCombineToAsyncButtonTapped), for: .touchUpInside)

    resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    deleteSelectToDoButton.addTarget(self, action: #selector(deleteSelectToDoButtonTapped), for: .touchUpInside)
    appendToDoButton.addTarget(self, action: #selector(appendToDoButtonTapped), for: .touchUpInside)
  }

}

// MARK: - 확장 / 셀렉터 모음
extension MainView {

  @objc func closureButtonTapped() {
    delegate?.closureButtonPressed()
  }

  @objc func rxButtonTapped() {
    delegate?.rxButtonPressed()
  }

  @objc func combineButtonTapped() {
    delegate?.combineButtonPressed()
  }

  @objc func asyncButtonTapped() {
    delegate?.asyncButtonPressed()
  }

  @objc func convertClosureToAsyncButtonTapped() {
    delegate?.convertClosureToAsyncButtonPressed()
  }

  @objc func convertRxToAsyncButtonTapped() {
    delegate?.convertRxToAsyncButtonPressed()
  }

  @objc func convertCombineToAsyncButtonTapped() {
    delegate?.convertCombineToAsyncButtonPressed()
  }

  @objc func resetButtonTapped() {
    delegate?.resetButtonPressed()
  }

  @objc func deleteSelectToDoButtonTapped() {
    delegate?.deleteSelectToDoButtonPressed()
  }

  @objc func appendToDoButtonTapped() {
    delegate?.appendToDoButtonPressed()
  }

}



#if DEBUG
import SwiftUI

struct MainView_Previews: PreviewProvider {

  static var previews: some View {

    MainView().getPreview()
      .frame(width: .infinity, height: 350)

  }
}
#endif

