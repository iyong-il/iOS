//
//  CustomPopUpViewController.swift
//  CustomPopUp_tutorial
//
//  Created by Jeff Jeong on 2020/06/07.
//  Copyright © 2020 Tuentuenna. All rights reserved.
//

import UIKit

final class CustomPopUpViewController: UIViewController {

  // MARK: - 속성
  @IBOutlet weak var contentView: UIView!

  @IBOutlet weak var bgBtn: UIButton!
  @IBOutlet weak var subscribeBtn: UIButton!
  @IBOutlet weak var openChatBtn: UIButton!
  @IBOutlet weak var blogBtn: UIButton!

  var subscribeBtnCompletionClosure: (() -> Void)?

  var myPopUpDelegate : PopUpDelegate?


  // MARK: - 라이프사이클
  override func viewDidLoad() {
    super.viewDidLoad()
    print(#fileID, #function, #line, "- 팝업VC가 올라왔다.")

    contentView.layer.cornerRadius = 30
    subscribeBtn.layer.cornerRadius = 10
    openChatBtn.layer.cornerRadius = 10
    blogBtn.layer.cornerRadius = 10
  }


  //MARK: - 메서드
  @IBAction func onBlogButtonTapped(_ sender: UIButton) {
    print(#fileID, #function, #line, "- 블로그가기 버튼이 눌렸다. / 노티피케이션")

    // VC에서 등록한 노티피케이션을 가져다 쓰기만 하면 된다.
    NotificationCenter.default.post(name: .buttonClickNotification, object: nil)
    self.dismiss(animated: true)
  }

  @IBAction func onOpenChatBtnClicked(_ sender: UIButton) {
    print(#fileID, #function, #line, "- 오픈깨톡방가기 버튼이 눌렸다.")

    myPopUpDelegate?.onOpenChatBtnClicked()
    self.dismiss(animated: true)
  }

  @IBAction func onSubscribeBtnClicked(_ sender: UIButton) {
    print(#fileID, #function, #line, "- 구독하러가기 버튼이 눌렸다. / 후행클로저")

    self.dismiss(animated: true, completion: nil)

    // 컴플레션 블럭 호출
    if let subscribeBtnCompletionClosure = subscribeBtnCompletionClosure{
      // 메인에 알린다.
      subscribeBtnCompletionClosure()
    }
  }

  @IBAction func onBgBtnClicked(_ sender: UIButton) {
    print(#fileID, #function, #line, "- 배경 터치시 팝업이 내려간다.")

    self.dismiss(animated: true, completion: nil)
  }

}
