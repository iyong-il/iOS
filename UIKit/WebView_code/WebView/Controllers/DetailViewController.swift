//
//  DetailViewController.swift
//  WebView
//
//  Created by 이용일(Rodi) on 2023/01/29.
//

import UIKit
import SafariServices

final class DetailViewController: UIViewController {

  // MARK: - 속성
  private let detailView = DetailView()


  // MARK: - 라이프사이클
  override func loadView() {
    self.view = detailView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavbar()
    detailView.delegate = self
  }


  // MARK: - 메서드
  private func setupNavbar() {
    self.navigationItem.title = "고객센터"
    self.navigationController?.navigationBar.prefersLargeTitles = false
  }

}

// MARK: - 확장 / 델리게이트
extension DetailViewController: DetailViewDelegate {
  // 자체웹뷰
  func button1Tapped() {
    let vc = WebViewController()
    self.navigationController?.pushViewController(vc, animated: true)
  }

  // 사파리 뷰컨
  func button2Tapped() {
    DispatchQueue.global().async {
      guard let url = URL(string: "https://i-yongil.tistory.com/") else { return }
      let safariViewController = SFSafariViewController(url: url)
      DispatchQueue.main.async {
        self.present(safariViewController, animated: true, completion: nil)
      }
    }
  }

  // 외부 사파리 뷰컨
  func button3Tapped() {
    DispatchQueue.global().async {
      guard let url = URL(string: "https://apple.com"),
            UIApplication.shared.canOpenURL(url) else { return }
      DispatchQueue.main.async {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
      }
    }
  }
}
