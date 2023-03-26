//
//  ViewController.swift
//  UIKit-CustomView-Tutorial
//
//  Created by Jeff Jeong on 2022/12/17.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var secondInputView: InputView!
    
    override func loadView() {
        super.loadView()
        print(#fileID, #function, #line, "- ")
        let thirdInputView = InputView(title: "오늘도 빡빡코딩!!",
                                       placeholder: "빡코딩 아이디 입력!!",
                                       onBtnAClicked: self.handleBtnAClicked,
                                       onBtnBClicked: self.handleBtnBClicked(userInput:))
        
        thirdInputView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(thirdInputView)
        NSLayoutConstraint.activate([
            thirdInputView.topAnchor.constraint(equalTo: secondInputView.bottomAnchor, constant: 10),
            thirdInputView.leadingAnchor.constraint(equalTo: secondInputView.leadingAnchor),
            thirdInputView.trailingAnchor.constraint(equalTo: secondInputView.trailingAnchor),
            thirdInputView.heightAnchor.constraint(equalTo: secondInputView.heightAnchor)
        ])
        
        let fourthInputView = CodeInputView(
                                        bgColor: .systemYellow,
                                        title: "오늘도 빡빡코딩!!",
                                        placeholder: "빡코딩 아이디 입력!!",
                                        onBtnAClicked: self.handleBtnAClicked,
                                        onBtnBClicked: self.handleBtnBClicked(userInput:),
                                        onUserInputChanged: self.handleInputFromCodeInputView)
        
        fourthInputView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(fourthInputView)
        NSLayoutConstraint.activate([
            fourthInputView.topAnchor.constraint(equalTo: thirdInputView.bottomAnchor, constant: 10),
            fourthInputView.leadingAnchor.constraint(equalTo: thirdInputView.leadingAnchor),
            fourthInputView.trailingAnchor.constraint(equalTo: thirdInputView.trailingAnchor),
            fourthInputView.heightAnchor.constraint(greaterThanOrEqualTo: thirdInputView.heightAnchor)
        ])
        
    }// loadView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#fileID, #function, #line, "- ")
        
        secondInputView.onBtnAClicked = {
            print("ViewController - 버튼 A가 선택되었다")
        }
        
        secondInputView.onBtnBClicked = {
            print("ViewController - 버튼 B가 선택되었다 / userInput: \($0)")
        }
        
        secondInputView.resetAction(target: self,
                                    aBtnAction: #selector(onBtnAClicked(sender:)),
                                    bBtnAction: #selector(onBtnBClicked(sender:)),
                                    inputChangeAction: #selector(onInputChanged(sender:)))
    }
    
    @objc func onInputChanged(sender: UITextField){
        print(#fileID, #function, #line, "- input: \(sender.text)")
    }
    
    @objc func onBtnAClicked(sender: UIButton){
        print(#fileID, #function, #line, "- ")
    }
    
    @objc func onBtnBClicked(sender: UIButton){
        print(#fileID, #function, #line, "- ")
    }
    
    
    fileprivate func handleBtnAClicked(){
        print(#fileID, #function, #line, "- ")
    }
    
    fileprivate func handleBtnBClicked(userInput: String){
        print(#fileID, #function, #line, "- userInput: \(userInput)")
    }
    
    fileprivate func handleInputFromCodeInputView(userInput: String){
        print(#fileID, #function, #line, "- userInput: \(userInput)")
    }
}

