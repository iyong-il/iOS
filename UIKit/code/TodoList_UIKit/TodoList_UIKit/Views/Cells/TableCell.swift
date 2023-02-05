//
//  TableCell.swift
//  TodoList_UIKit
//
//  Created by 이용일(Rodi) on 2023/02/05.
//

import UIKit
import SnapKit

protocol CellDelegate: AnyObject {
  func correctButtonPressed(indexPath: IndexPath)
  func deleteButtonPressed(indexPath: IndexPath)
}

final class TableCell: UITableViewCell {

  // MARK: - 속성
  var todos: ToDo? {
    didSet { configure() }
  }

  weak var delegate: CellDelegate?
  var index: IndexPath?

  private let todoID: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 12)

    return label
  }()

  let toggleLabel: UILabel = {
    let label = UILabel()
    label.text = " 완료여부: 미완료"
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 12)

    return label
  }()

  private lazy var correctButton = Utilities().makemethodButton(title: "수정")
  private lazy var deleteButton = Utilities().makemethodButton(title: "삭제")
  private lazy var buttonStack: UIStackView = {
    let st = UIStackView(arrangedSubviews: [correctButton, deleteButton])
    st.axis = .horizontal
    st.spacing = 10
    st.distribution = .fillEqually

    return st
  }()

  private let descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 17)

    return label
  }()

  lazy var toggleButton: UISwitch = {
    let toggle = UISwitch()
    toggle.setOn(false, animated: true)

    return toggle
  }()

  // MARK: - 라이프사이클
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
    setupAddTarget()

  }

  override func updateConstraints() {
    correctButton.snp.makeConstraints {
      $0.width.equalTo(50)
    }
    deleteButton.snp.makeConstraints {
      $0.width.equalTo(50)
    }
    super.updateConstraints()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    deleteButton.backgroundColor = .systemPurple
    [correctButton, deleteButton].forEach { $0.layer.cornerRadius = 8 }
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  // MARK: - 메서드
  private func setupUI() {
    [
      todoID,
      toggleLabel,
      buttonStack,
      descriptionLabel,
      toggleButton
    ].forEach { self.addSubview($0) }

    [
      correctButton,
      deleteButton,
      toggleButton
    ].forEach { self.contentView.addSubview($0) }

    todoID.snp.makeConstraints {
      $0.top.equalToSuperview().inset(10)
      $0.leading.equalToSuperview().inset(20)
    }

    toggleLabel.snp.makeConstraints {
      $0.top.equalTo(todoID)
      $0.left.equalTo(todoID.snp.right)
    }



    correctButton.snp.makeConstraints {
      $0.top.equalTo(deleteButton.snp.top)
      $0.right.equalTo(deleteButton.snp.left).offset(-10)
    }

    deleteButton.snp.makeConstraints {
      $0.top.trailing.equalToSuperview().inset(10)
    }

    buttonStack.snp.makeConstraints {
      $0.top.trailing.equalToSuperview().inset(10)
    }

    descriptionLabel.snp.makeConstraints {
      $0.leading.equalTo(todoID)
      $0.bottom.equalToSuperview().inset(20)
      $0.right.equalTo(buttonStack.snp.left).offset(-10)
    }

    toggleButton.snp.makeConstraints {
      $0.top.equalTo(deleteButton.snp.bottom).offset(15)
      $0.trailing.equalTo(buttonStack)
    }

  }

  private func setupAddTarget() {
    correctButton.addTarget(self, action: #selector(correctionButtonTapped(_:)), for: .touchUpInside)
    deleteButton.addTarget(self, action: #selector(deleteButtonTapped(_:)), for: .touchUpInside)

    toggleButton.addTarget(self, action: #selector(toggleButtonTapped(_:)), for: .valueChanged)
  }

  private func configure() {
    guard let todos = todos else { return }
    self.todoID.text = "todosID: \(todos.id) /"
    self.descriptionLabel.text = todos.title
  }

}

// MARK: - 확장 / 셀렉터모음
extension TableCell {

  @objc func correctionButtonTapped(_ sender: UIButton) {
    guard let index = index else { return }
    delegate?.correctButtonPressed(indexPath: index)
  }

  @objc func deleteButtonTapped(_ sender: UIButton) {
    guard let index = index else { return }
    delegate?.deleteButtonPressed(indexPath: index)
  }

  @objc func toggleButtonTapped(_ sender: UISwitch) {
    if toggleButton.isOn {
      print(#fileID, #function, #line, "- 토글버튼 on")
      toggleLabel.text = " 완료여부: 완료"
    } else {
      print(#fileID, #function, #line, "- 토글버튼 off")
      toggleLabel.text = " 완료여부: 미완료"

    }
  }

}

#if DEBUG
import SwiftUI

struct TableCell_Previews: PreviewProvider {

  static var previews: some View {

    TableCell().getPreview()
      .frame(width: .infinity, height: 110)


  }
}
#endif

