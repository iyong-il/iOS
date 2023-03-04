//
//  MainVC.swift
//  URLSession_TodoList
//
//  Created by 이용일(Rodi) on 2023/03/04.
//

import UIKit

class MainVC: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(#fileID, #function, #line, "- UIKit 실행")
    self.view.backgroundColor = .systemBlue

  }
}

protocol StoryBoarded {
  static func instantiate(_ storyboardName: String?) -> Self
}

extension StoryBoarded {
  static func instantiate(_ storyboardedName: String? = nil) -> Self {

    let name = storyboardedName ?? String(describing: self)

    let storyboard = UIStoryboard(name: name, bundle: Bundle.main)

//    return storyboard.instantiateViewController(withIdentifier: "")
  }

}
