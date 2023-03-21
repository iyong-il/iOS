//
//  CodeInputView.swift
//  UIKit-CustomView-Tutorial
//
//  Created by Jeff Jeong on 2023/01/23.
//

import Foundation
import UIKit

class CodeInputView: UIView {
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "타이틀 라벨"
        return label
    }()
    
    lazy var inputTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "글자입력"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var buttonA : UIButton = {
        let btn = UIButton(type: .system)
        btn.configuration = .borderedProminent()
        btn.setTitle("버튼 A", for: .normal)
        return btn
    }()
    
    lazy var buttonB : UIButton = {
        let btn = UIButton(type: .system)
        btn.configuration = .borderedProminent()
        btn.setTitle("버튼 B", for: .normal)
        return btn
    }()
    
    
    lazy var horizontalBtnStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [buttonA, buttonB])
        stackView.axis = .horizontal
        stackView.spacing = 30
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }()
    
    lazy var verticalContainerStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, inputTextField, horizontalBtnStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return stackView
    }()
    
    var title: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.titleLabel.text = self.title
            }
        }
    }
    
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
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print(#fileID, #function, #line, "- ")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print(#fileID, #function, #line, "- ")
        self.configureUI()
    }
    
    convenience init(bgColor: UIColor = UIColor.systemMint,
                     title: String = "",
                     placeholder: String = "",
                     onBtnAClicked: (() -> Void)? = nil,
                     onBtnBClicked : ((String) -> Void)? = nil,
                     onUserInputChanged : ((String) -> Void)? = nil
    ) {
        self.init(frame: .zero)
        
        self.backgroundColor = bgColor
        
        self.titleLabel.text = title
        self.inputTextField.placeholder = placeholder
        self.onBtnAClicked = onBtnAClicked
        self.onBtnBClicked = onBtnBClicked
        self.onUserInputChanged = onUserInputChanged
        self.applyAction()
    }
    
    fileprivate func configureUI(){
        print(#fileID, #function, #line, "- ")
        
        self.addSubview(verticalContainerStackView)
        
        let constraints = [
            verticalContainerStackView.topAnchor.constraint(equalTo: self.topAnchor),
            verticalContainerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            verticalContainerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            verticalContainerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    fileprivate func applyAction(){
        print(#fileID, #function, #line, "- ")
        self.buttonA.addTarget(self, action: #selector(onBtnAClicked(sender:)), for: .touchUpInside)
        self.buttonB.addTarget(self, action: #selector(onBtnBClicked(sender:)), for: .touchUpInside)
        self.inputTextField.addTarget(self, action: #selector(onInputChanged(sender:)), for: .editingChanged)
    }
    
    @objc func onInputChanged(sender: UITextField){
        print(#fileID, #function, #line, "- input: \(sender.text)")
        guard let userInput = self.inputTextField.text else {
            return
        }
        onUserInputChanged?(userInput)
    }
    
    @objc func onBtnAClicked(sender: UIButton){
        print(#fileID, #function, #line, "- ")
        onBtnAClicked?()
    }
    
    @objc func onBtnBClicked(sender: UIButton){
        print(#fileID, #function, #line, "- ")
        
        guard let userInput = self.inputTextField.text else {
            return
        }
        
        onBtnBClicked?(userInput)
    }
}

#if DEBUG

import SwiftUI

struct CodeInputViewRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        CodeInputView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
}

struct CodeInputViewRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        CodeInputViewRepresentable()
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .background(Color.yellow)
    }
}


#endif
