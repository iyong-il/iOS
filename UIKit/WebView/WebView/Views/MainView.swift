//
//  MainView.swift
//  WebView
//
//  Created by 이용일(Rodi) on 2023/01/29.
//

import UIKit
import SnapKit

final class MainView: UIView {

  private let button1: UIButton = {
    let button = UIButton()

    return button
  }()

  private let button2: UIButton = {
    let button = UIButton()

    return button
  }()

  let button3: UIButton = {
    let button = UIButton()

    return button
  }()

  private let button4: UIButton = {
    let button = UIButton()

    return button
  }()

  private lazy var view1: UIView = {
    let view = Utilities().makeView(image: "speaker.wave.1.fill", text: "공지사항", btn: button1, divideColor: .lightGray)

    return view
  }()

  private lazy var view2: UIView = {
    let view = Utilities().makeView(image: "gearshape", text: "앱 설정", btn: button2, divideColor: .lightGray)

    return view
  }()

  private lazy var view3: UIView = {
    let view = Utilities().makeView(image: "phone", text: "고객센터", btn: button3, divideColor: .lightGray)

    return view
  }()

  private lazy var view4: UIView = {
    let view = Utilities().makeView(image: "list.bullet.rectangle", text: "약관 및 정책", btn: button4, divideColor: .lightGray)

    return view
  }()

  private lazy var stack: UIStackView = {
    let st = UIStackView(arrangedSubviews: [view1, view2, view3, view4])
    st.axis = .vertical
    st.distribution = .fillEqually


    return st
  }()




  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  fileprivate func setupUI() {
    self.backgroundColor = .white

    self.addSubview(stack)

    stack.snp.makeConstraints {
      $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(30)
      $0.centerX.equalToSuperview()
      $0.left.equalToSuperview().offset(20)
    }



  }




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

