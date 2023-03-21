//
//  ViewController.swift
//  CustomPopUp_tutorial
//
//  Created by Jeff Jeong on 2020/06/07.
//  Copyright © 2020 Tuentuenna. All rights reserved.
//

import UIKit
import WebKit

final class ViewController: UIViewController {

  // MARK: - 속성
  @IBOutlet weak var myWebView: WKWebView!
  @IBOutlet weak var createPopUpBtn: UIButton!


  // 소멸자 - 노티피케이션에는 필수
  deinit {
    print(#fileID, #function, #line, "- deinit 호출")
    NotificationCenter.default.removeObserver(self)
  }

  // MARK: - 라이프사이클
  override func viewDidLoad() {
    super.viewDidLoad()
    // 노티피케이션이라는 안테나를 장착한다는 느낌
    NotificationCenter.default.addObserver(self, selector: #selector(loadWebView), name: .buttonClickNotification, object: nil)

  }

  // MARK: - 메서드
  @objc fileprivate func loadWebView() {
    print(#fileID, #function, #line, "⭐️블로그화면이 올라온다. / 노티피케이션")
    guard let myBlog = URL.blogURL else { return }
    self.myWebView.load(URLRequest(url: myBlog))
  }

  @IBAction func onCreatePopUpBtnClicked(_ sender: UIButton) {
    print(#fileID, #function, #line, "- 팝업띄우기 버튼이 눌렸다.")


    // 스토리보드 가져오기
    let storyboard = UIStoryboard(name: "PopUp", bundle: nil)
    // 스토리보드를 통해 뷰컨트롤러 가져오기
    guard let customPopUpVC = storyboard.instantiateViewController(withIdentifier: "AlertPopUpVC") as? CustomPopUpViewController else { return }
    // 뷰컨트롤러가 보여지는 스타일
    customPopUpVC.modalPresentationStyle = .overCurrentContext
    // 뷰컨트롤러가 사라지는 스타일
    customPopUpVC.modalTransitionStyle = .crossDissolve

    customPopUpVC.subscribeBtnCompletionClosure = {
      print(#fileID, #function, #line, "- ⭐️구독화면이 올라온다. / 후행클로저")

      guard let myChannelUrl = URL.youtubeURL else { return }
      self.myWebView.load(URLRequest(url: myChannelUrl))
    }

    customPopUpVC.myPopUpDelegate = self

    self.present(customPopUpVC, animated: true, completion: nil)
  }



}

// MARK: - 확장 / 델리게이트
extension ViewController: PopUpDelegate {

  func onOpenChatBtnClicked() {
    print(#fileID, #function, #line, "- ⭐️오픈깨톡방가기 화면이 올라온다. / 델리게이트")
    guard let myChannelUrl = URL.openChatURL else { return }
    self.myWebView.load(URLRequest(url: myChannelUrl))
  }
}
