//
//  webViewController.swift
//  WebView
//
//  Created by 이용일(Rodi) on 2023/01/29.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

  var webView: WKWebView!

  override func loadView() {
      let webConfiguration = WKWebViewConfiguration()
      self.webView = WKWebView(frame: .zero, configuration: webConfiguration)
      self.webView.uiDelegate = self
        self.view = self.webView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    DispatchQueue.global().async {
      guard let myURL = URL(string:"https://naver.com/") else { return }
      let myRequest = URLRequest(url: myURL)

      DispatchQueue.main.async {
        self.webView.load(myRequest)
      }
    }


  }




}

extension WebViewController: WKUIDelegate {

}

