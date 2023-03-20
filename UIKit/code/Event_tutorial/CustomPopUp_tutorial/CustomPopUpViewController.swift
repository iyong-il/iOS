//
//  CustomPopUpViewController.swift
//  CustomPopUp_tutorial
//
//  Created by Jeff Jeong on 2020/06/07.
//  Copyright © 2020 Tuentuenna. All rights reserved.
//

import UIKit

class CustomPopUpViewController: UIViewController {

  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var bgBtn: UIButton!
  @IBOutlet weak var subscribeBtn: UIButton!

  @IBOutlet weak var openChatBtn: UIButton!

  @IBOutlet weak var blogBtn: UIButton!



  var subscribeBtnCompletionClosure: (() -> Void)?

  var myPopUpDelegate : PopUpDelegate?

  override func viewDidLoad() {
    super.viewDidLoad()

    print("CustomPopUpViewController - viewDidLoad() called")
    contentView.layer.cornerRadius = 30
    subscribeBtn.layer.cornerRadius = 10
    openChatBtn.layer.cornerRadius = 10
    blogBtn.layer.cornerRadius = 10
  }



  //MARK: - IBActions
  @IBAction func onBgBtnClicked(_ sender: UIButton) {
    print("CustomPopUpViewController - onBgBtnClicked() called")
    self.dismiss(animated: true, completion: nil)
  }

  @IBAction func onBlogButtonTapped(_ sender: UIButton) {
    print(#fileID, #function, #line, "- 블로그가기 버튼이 눌렸다.")

    NotificationCenter.default.post(name: Notification.Name(notificationName), object: nil)
    self.dismiss(animated: true)
  }

  @IBAction func onSubscribeBtnClicked(_ sender: UIButton) {
    print("CustomPopUpViewController - onSubscribeBtnClicked() called")

    self.dismiss(animated: true, completion: nil)

    // 컴플레션 블럭 호출
    if let subscribeBtnCompletionClosure = subscribeBtnCompletionClosure{
      // 메인에 알린다.
      subscribeBtnCompletionClosure()
    }
  }

  @IBAction func onOpenChatBtnClicked(_ sender: UIButton) {
    print("CustomPopUpViewController - onOpenChatBtnClicked() called")

    myPopUpDelegate?.onOpenChatBtnClicked()
    self.dismiss(animated: true, completion: nil)

  }


}
