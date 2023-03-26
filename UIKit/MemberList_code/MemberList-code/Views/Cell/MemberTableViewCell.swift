//
//  MemberTableViewCell.swift
//  MemberList-code
//
//  Created by 이용일 on 2022/09/28.
//

import UIKit
import SnapKit
import Then

final class MemberTableViewCell: UITableViewCell {
  // MARK: - 방법 2(didSet 활용)
  // 직접적으로 데이터 전달을 하지 않고 속성감시자를 통해서 데이터를 넘길 수 있는 방법이다.
  // 훨씬 더 쉽고 편한 방법이다.
  var member: Member? {
    didSet {
      guard var member = self.member else { return }
      mainImageView.image = member.memeberImage
      memberNameLabel.text = member.name
      addressLabel.text = member.address
    }
  }
// MARK: - UI구현
  let mainImageView = UIImageView()

  let memberNameLabel = UILabel().then {
    $0.font = UIFont.boldSystemFont(ofSize: 12)
  }

  let addressLabel = UILabel().then {
    $0.font = UIFont.systemFont(ofSize: 10)
    $0.numberOfLines = 0
  }

  lazy var stackView = UIStackView().then {
    $0.addArrangedSubview(memberNameLabel)
    $0.addArrangedSubview(addressLabel)

    $0.axis = .vertical
    $0.distribution = .fill
    $0.alignment = .fill
    $0.spacing = 5
  }

  // MARK: - 뷰디드로드 역할
  // 코드로 짤 때의 뷰디드로드
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .default, reuseIdentifier: reuseIdentifier)
    setupStackView()
  }

// MARK: - 뷰를 넣는 메서드
  fileprivate func setupStackView() {
    self.addSubview(mainImageView)
    self.addSubview(stackView)
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  // MARK: - 오토레이아웃을 잡아주는 메서드
  // 오토레이아웃을 정하는 정확한 시점
  override func updateConstraints() {
    setupStackViewConstraints()
    super.updateConstraints()
  }

  // 크기가 결정된 UI에 대해서만 설정할 수 있다.
  override func layoutSubviews() {
    super.layoutSubviews()
    self.mainImageView.clipsToBounds = true
    self.mainImageView.layer.cornerRadius = self.mainImageView.frame.width / 2
  }

  fileprivate func setupStackViewConstraints() {




    mainImageView.snp.makeConstraints {
      $0.size.equalTo(40)
      $0.left.equalToSuperview().offset(10)
      $0.centerY.equalToSuperview()
    }

    memberNameLabel.snp.makeConstraints {
      $0.height.equalTo(20)
    }

    stackView.snp.makeConstraints {
      $0.left.equalTo(mainImageView.snp.right).offset(20)
      $0.right.equalToSuperview()
      $0.top.equalTo(mainImageView.snp.top)
      $0.bottom.equalTo(mainImageView.snp.bottom)
    }

  }

  // 스토리보드로 짤 때의 뷰디드로드역할
  //  override func awakeFromNib() {
  //    super.awakeFromNib()
  //  }

  //  코드로 짤때는 필요 없음
  //  override func setSelected(_ selected: Bool, animated: Bool) {
  //    super.setSelected(selected, animated: animated)
  //  }








}
