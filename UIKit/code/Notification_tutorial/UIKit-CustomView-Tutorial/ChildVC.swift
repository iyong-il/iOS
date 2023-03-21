//
//  ChildVC.swift
//  UIKit-CustomView-Tutorial
//
//  Created by Jeff Jeong on 2023/01/23.
//

import Foundation
import UIKit

class ChildVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    var bgColor: UIColor = .systemYellow {
        didSet {
            DispatchQueue.main.async {
                self.view.backgroundColor = self.bgColor
            }
        }
    }
    
    // 인터페이스 빌더에서 속성 넣기
    @IBInspectable
    var titleText: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.titleLabel.text = self.titleText
            }
        }
    }
    
    @IBInspectable
    var placeholder: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.inputTextField.placeholder = self.placeholder.isEmpty ? "글자를 입력해주세요!" : self.placeholder
            }
        }
    }
    
    var onBtnAClicked : (() -> Void)? = nil
    var onBtnBClicked : ((String) -> Void)? = nil
    var onUserInputChanged : ((String) -> Void)? = nil
    
    init?(coder: NSCoder,
          titleText: String,
          placeholder: String,
          onBtnAClicked : (() -> Void)? = nil,
          onBtnBClicked : ((String) -> Void)? = nil,
          onUserInputChanged : ((String) -> Void)? = nil
    ) {
        self.titleText = titleText
        self.placeholder = placeholder
        self.onBtnAClicked = onBtnAClicked
        self.onBtnBClicked = onBtnBClicked
        self.onUserInputChanged = onUserInputChanged
        super.init(coder: coder)
        print(#fileID, #function, #line, "- ")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print(#fileID, #function, #line, "- ")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#fileID, #function, #line, "- ")
        
        self.titleLabel.text = self.titleText
        self.inputTextField.placeholder = self.placeholder.isEmpty ? "글자를 입력해주세요!" : self.placeholder
        
        inputTextField.addTarget(self, action: #selector(onUserInputChanged(_:)), for: .editingChanged)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: .sendInputEvent, object: nil)
    }
    
    @objc fileprivate func handleNotification(_ sender: Notification) {
        print(#fileID, #function, #line, "⭐️ - sender: \(sender)")
        
        guard let userInput : String = sender.userInfo?["userInput"] as? String else {
            return
        }
        
        inputTextField.text = userInput
    }
    
    @objc fileprivate func onUserInputChanged(_ sender: UITextField){
        print(#fileID, #function, #line, "- sender.text: \(sender.text ?? "")")
        self.onUserInputChanged?(sender.text ?? "")
    }
    
    @IBAction func onBtnClicked(_ sender: UIButton) {
        print(#fileID, #function, #line, "- ")
        switch sender.tag {
        case 1:
            print("버튼 A 클릭")
            onBtnAClicked?()
        case 2:
            print("버튼 B 클릭")
            
            guard let input = inputTextField.text else { return }
            
            onBtnBClicked?(input)
        default: break
        }
    }
    
}
