//
//  Utilites.swift
//  TodoList_UIKit
//
//  Created by 이용일(Rodi) on 2023/02/05.
//

import UIKit

struct Utilities {

  func makemethodButton(title: String) -> UIButton {
    let button = UIButton(type: .custom)
    button.setTitle(title, for: .normal)
    button.titleLabel?.textColor = .white
    button.backgroundColor = .systemBlue
    button.titleLabel?.numberOfLines = 0

    return button
  }

}
