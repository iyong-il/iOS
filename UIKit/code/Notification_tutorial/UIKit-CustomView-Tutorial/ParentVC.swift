//
//  ParentVC.swift
//  UIKit-CustomView-Tutorial
//
//  Created by Jeff Jeong on 2023/01/23.
//

import Foundation
import UIKit
import SwiftUI

extension Notification.Name {
    
    /// 사용자 입력 이벤트
    static let sendInputEvent = Notification.Name("sendInputEvent")
}

class ParentVC: UIViewController {
    
    @IBOutlet weak var purpleChildContainerView: UIView!
    
    @IBOutlet weak var mintChildContainerView: UIView!
    
    
    @IBOutlet weak var userInputTextField: UITextField!
    
    @IBOutlet weak var sendNotificationBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#fileID, #function, #line, "- ")
        
//        configureChildContainerView()
        configureChildContainerViewWithCreatorBlock()
        configureChildSwiftUiContainerView()
        
        // 클로져 뽀개기 참고 - inline 함수
        // https://youtube.com/playlist?list=PLgOlaPUIbynpWid21CVyZbAUiaRRXzqdE
        sendNotificationBtn.addTarget(self, action: #selector(sendNotification(_:)), for: .touchUpInside)
        
        userInputTextField.addTarget(self, action: #selector(sendInputNoti(_:)), for: .editingChanged)
        
    }
    
    @objc fileprivate func sendInputNoti(_ sender: UITextField){
        print(#fileID, #function, #line, "- sender: \(sender.text)")
        
        guard let userInput : String = sender.text else {
            return
        }
        
        let dataToSend = ["userInput": userInput]
        
        NotificationCenter.default
            .post(name: .sendInputEvent, object: self, userInfo: dataToSend)
        
    }
    
    /// 노티피케이션을 보낸다
    /// - Parameter sender:
    @objc fileprivate func sendNotification(_ sender: UIButton){
        print(#fileID, #function, #line, "- ")
        #warning("TODO : - ")
        guard let userInput : String = userInputTextField.text else {
            return
        }
        
        // sendInputEvent 라는 주파수로
        // 방송을 보낸다
//        NotificationCenter.default
//            .post(name: .sendInputEvent, object: self)
        
        let dataToSend = ["userInput": userInput]
        
        NotificationCenter.default
            .post(name: .sendInputEvent, object: self, userInfo: dataToSend)
    }
    
    
    fileprivate func configureChildContainerView(){
        print(#fileID, #function, #line, "- ")
        
        // Create a child view controller and add it to the current view controller.
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        if let childVC = storyboard.instantiateViewController(identifier: "ChildVC")
                                            as? ChildVC {
            childVC.placeholder = "하하하"
            childVC.titleText = "서브뷰 입니다!"
            childVC.bgColor = .systemPurple
            childVC.onBtnAClicked = {
                print(#fileID, #function, #line, "- 버튼 A 클릭")
            }
            childVC.onBtnBClicked = { input in
                print(#fileID, #function, #line, "- 버튼 B 클릭 input: \(input)")
            }
            childVC.onUserInputChanged = { input in
                print(#fileID, #function, #line, "- 사용자 입력 input: \(input)")
            }
            
           // Add the view controller to the container.
            // 1. 뷰컨 자식으로 넣기
           addChild(childVC)
            // 2. 뷰 끼리 넣어주기
           view.addSubview(childVC.view)
            
           // Create and activate the constraints for the child’s view.
            // 3. 위치 잡기
            childVC.view.translatesAutoresizingMaskIntoConstraints = false
            
           let childVCConstraints = [
            childVC.view.topAnchor.constraint(equalTo: self.mintChildContainerView.topAnchor),
            childVC.view.bottomAnchor.constraint(equalTo: self.mintChildContainerView.bottomAnchor),
            childVC.view.leadingAnchor.constraint(equalTo: self.mintChildContainerView.leadingAnchor),
            childVC.view.trailingAnchor.constraint(equalTo: self.mintChildContainerView.trailingAnchor),
           ]
           NSLayoutConstraint.activate(childVCConstraints)
             
           // Notify the child view controller that the move is complete.
            // 4. 자식 뷰컨 들어왔다고 알리기
           childVC.didMove(toParent: self)
        }
    }
    
    fileprivate func configureChildContainerViewWithCreatorBlock(){
        print(#fileID, #function, #line, "- ")
        
        // Create a child view controller and add it to the current view controller.
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        if let childVC = storyboard.instantiateViewController(identifier: "ChildVC", creator: { coder in
            return ChildVC(coder: coder,
                           titleText: "호호호호호",
                           placeholder: "서브뷰이지롱~~",
                           onBtnAClicked: self.handleButtonAClicked,
                           onBtnBClicked: self.handleButtonBClicked(_:),
                           onUserInputChanged: self.handleInputFromChildVC(_:))
        }) as? ChildVC {
            
           // Add the view controller to the container.
            // 1. 뷰컨 자식으로 넣기
           addChild(childVC)
            // 2. 뷰 끼리 넣어주기
           view.addSubview(childVC.view)
            
           // Create and activate the constraints for the child’s view.
            // 3. 위치 잡기
            childVC.view.translatesAutoresizingMaskIntoConstraints = false
            
           let childVCConstraints = [
            childVC.view.topAnchor.constraint(equalTo: self.mintChildContainerView.topAnchor),
            childVC.view.bottomAnchor.constraint(equalTo: self.mintChildContainerView.bottomAnchor),
            childVC.view.leadingAnchor.constraint(equalTo: self.mintChildContainerView.leadingAnchor),
            childVC.view.trailingAnchor.constraint(equalTo: self.mintChildContainerView.trailingAnchor),
           ]
           NSLayoutConstraint.activate(childVCConstraints)
             
           // Notify the child view controller that the move is complete.
            // 4. 자식 뷰컨 들어왔다고 알리기
           childVC.didMove(toParent: self)
        }
    }
    
    fileprivate func configureChildSwiftUiContainerView(){
        print(#fileID, #function, #line, "- ")
        
        let childSwiftUiView = ChildSwiftUiView(titleText: "호롤롤로",
                                                placeholder: "아무거나 입력하세요~",
                                                userInput: "하하하하",
                                                onBtnAClicked: self.handleButtonAClicked,
                                                onBtnBClicked: self.handleButtonBClicked(_:),
                                                onUserInputChanged: self.handleInputFromChildVC(_:))
        
        let childVC = UIHostingController(rootView: childSwiftUiView)
        
        // Add the view controller to the container.
         // 1. 뷰컨 자식으로 넣기
        addChild(childVC)
         // 2. 뷰 끼리 넣어주기
        view.addSubview(childVC.view)
         
        // Create and activate the constraints for the child’s view.
         // 3. 위치 잡기
         childVC.view.translatesAutoresizingMaskIntoConstraints = false
         
        let childVCConstraints = [
         childVC.view.topAnchor.constraint(equalTo: self.purpleChildContainerView.topAnchor),
         childVC.view.bottomAnchor.constraint(equalTo: self.purpleChildContainerView.bottomAnchor),
         childVC.view.leadingAnchor.constraint(equalTo: self.purpleChildContainerView.leadingAnchor),
         childVC.view.trailingAnchor.constraint(equalTo: self.purpleChildContainerView.trailingAnchor),
        ]
        NSLayoutConstraint.activate(childVCConstraints)
          
        // Notify the child view controller that the move is complete.
         // 4. 자식 뷰컨 들어왔다고 알리기
        childVC.didMove(toParent: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        print(#fileID, #function, #line, "- segue")
        if let childVC = segue.destination as? ChildVC {
            childVC.bgColor = .systemMint
            childVC.titleText = "ㅎ하하하하하ㅏㅎ"
            childVC.onUserInputChanged = handleInputFromChildVC
            childVC.onBtnAClicked = { [weak self] in
                print(#fileID, #function, #line, "- 버튼 A 클릭: ")
            }
            childVC.onBtnBClicked = { [weak self] input in
                print(#fileID, #function, #line, "- 버튼 B 클릭: \(input)")
            }
        }
    }
    
    fileprivate func handleButtonAClicked(){
        print(#fileID, #function, #line, "- ")
    }
    
    fileprivate func handleButtonBClicked(_ input: String) {
        print(#fileID, #function, #line, "- input: \(input)")
    }
    
    fileprivate func handleInputFromChildVC(_ input: String) {
        print(#fileID, #function, #line, "- input: \(input)")
    }
}
