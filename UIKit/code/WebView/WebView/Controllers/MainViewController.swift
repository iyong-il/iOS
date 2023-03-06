//
//  ViewController.swift
//  WebView
//
//  Created by 이용일(Rodi) on 2023/01/29.
//

import UIKit

final class MainViewController: UIViewController {

  private let mainView = MainView()


  override func loadView() {
    self.view = mainView
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavbar()
    mainView.delegate = self
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.navigationBar.prefersLargeTitles = true
  }

  private func setupNavbar() {
    self.navigationItem.title = "더보기"
    self.navigationController?.navigationBar.prefersLargeTitles = true
  }

}

extension MainViewController: Delegate {
  func buttonTapped() {
    print(#fileID, #function, #line, "- 버튼3이 눌렸다.")
    let vc = DetailViewController()
    self.navigationController?.pushViewController(vc, animated: true)
  }
}
