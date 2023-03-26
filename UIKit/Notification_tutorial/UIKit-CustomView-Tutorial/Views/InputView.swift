//
//  InputView.swift
//  UIKit-CustomView-Tutorial
//
//  Created by Jeff Jeong on 2022/12/17.
//

import Foundation
import UIKit

@IBDesignable
class InputView: UIView {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    
    @IBOutlet weak var buttonA: UIButton!
    
    @IBOutlet weak var buttonB: UIButton!
    
    // 인터페이스 빌더에서 속성 넣기
    @IBInspectable
    var title: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.titleLabel.text = self.title
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(#fileID, #function, #line, "- ")
        applyNib()
        applyAction()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print(#fileID, #function, #line, "- ")
        applyNib()
        applyAction()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print(#fileID, #function, #line, "- ")
    }
    
    convenience init(title: String = "",
                     placeholder: String = "",
                     onBtnAClicked: (() -> Void)? = nil,
                     onBtnBClicked : ((String) -> Void)? = nil
    ) {
        self.init(frame: .zero)
        self.titleLabel.text = title
        self.inputTextField.placeholder = placeholder
        self.onBtnAClicked = onBtnAClicked
        self.onBtnBClicked = onBtnBClicked
    }
    
    
    fileprivate func applyNib(){
        print(#fileID, #function, #line, "- ")
        let nibName = String(describing: Self.self) // "InputView"
        let nib = Bundle.main.loadNibNamed(nibName, owner: self)
        guard let view = nib?.first as? UIView else {
            return
        }
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    fileprivate func applyAction(){
        print(#fileID, #function, #line, "- ")
        self.buttonA.addTarget(self, action: #selector(onBtnAClicked(sender:)), for: .touchUpInside)
        self.buttonB.addTarget(self, action: #selector(onBtnBClicked(sender:)), for: .touchUpInside)
        self.inputTextField.addTarget(self, action: #selector(onInputChanged(sender:)), for: .editingChanged)
    }
    
    func resetAction(target: Any?,
                     aBtnAction: Selector,
                     bBtnAction: Selector,
                     inputChangeAction: Selector){
        print(#fileID, #function, #line, "- ")
        
        // 이전 걸렸있던 액션 지우기
        self.buttonA.removeTarget(self, action: #selector(onBtnAClicked(sender:)), for: .touchUpInside)
        self.buttonB.removeTarget(self, action: #selector(onBtnBClicked(sender:)), for: .touchUpInside)
        self.inputTextField.removeTarget(self, action: #selector(onInputChanged(sender:)), for: .editingChanged)
        
        // 새 액션들 넣기 
        self.buttonA.addTarget(target, action: aBtnAction, for: .touchUpInside)
        self.buttonB.addTarget(target, action: bBtnAction, for: .touchUpInside)
        self.inputTextField.addTarget(target, action: inputChangeAction, for: .editingChanged)
    }
    
    @objc func onInputChanged(sender: UITextField){
        print(#fileID, #function, #line, "- input: \(sender.text)")
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
