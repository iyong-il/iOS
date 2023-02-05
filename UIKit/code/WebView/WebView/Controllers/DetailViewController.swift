//
//  DetailViewController.swift
//  WebView
//
//  Created by 이용일(Rodi) on 2023/01/29.
//

import UIKit
import SafariServices

final class DetailViewController: UIViewController {

  private let detailView = DetailView()

  override func loadView() {
    self.view = detailView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavbar()
    buttonSelect()

  }

  private func setupNavbar() {
    self.navigationItem.title = "고객센터"
    self.navigationController?.navigationBar.prefersLargeTitles = false

  }

  private func buttonSelect() {
    detailView.button1.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
    detailView.button2.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
    detailView.button3.addTarget(self, action: #selector(button3Tapped), for: .touchUpInside)
  }

  // 자체웹뷰
  @objc func button1Tapped() {
    let vc = WebViewController()
    self.navigationController?.pushViewController(vc, animated: true)

  }

  // 사파리 뷰컨
  @objc func button2Tapped() {

    guard let url = URL(string: "https://i-yongil.tistory.com/") else { return }
    let safariViewController = SFSafariViewController(url: url)
    self.present(safariViewController, animated: true, completion: nil)

  }

  // 외부 사파리 뷰컨
  @objc func button3Tapped() {

    guard let url = URL(string: "https://apple.com"),
          UIApplication.shared.canOpenURL(url) else { return }

    UIApplication.shared.open(url, options: [:], completionHandler: nil)
  }



}

