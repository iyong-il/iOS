//
//  DetailVC.swift
//  LED
//
//  Created by 이용일(Rodi) on 2023/04/09.
//

import UIKit

protocol LEDDelegate : AnyObject {
    func changeContents(text: String?, textColor: UIColor?, bgColor: UIColor?)
}

final class DetailVC : UIViewController {

    // MARK: - 속성
    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!

    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!

    weak var delegate: LEDDelegate?
    var ledText: String?
    var textColor: UIColor?
    var bgColor: UIColor?


    // MARK: - 라이프사이클
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


    // MARK: - 메서드
    fileprivate func changeTextColor(_ color: UIColor) {
        self.yellowButton.alpha = color == .yellow ? 1 : 0.2
        self.purpleButton.alpha = color == .purple ? 1 : 0.2
        self.greenButton.alpha = color == .green ? 1 : 0.2

        self.textColor = color
    }

    fileprivate func changeBackViewColor(_ color: UIColor) {
        self.blackButton.alpha = color == .black ? 1 : 0.2
        self.blueButton.alpha = color == .blue ? 1 : 0.2
        self.orangeButton.alpha = color == .orange ? 1 : 0.2

        self.bgColor = color
    }

    fileprivate func setupUI() {
        guard let ledText = self.ledText,
              let textColor = self.textColor,
              let bgColor = self.bgColor
        else { return }
        self.textField.text = ledText
        self.changeTextColor(textColor)
        self.changeBackViewColor(bgColor)
    }

}

// MARK: - 확장 / @IBAction
extension DetailVC {
    @IBAction func textButtonPressed(_ sender: UIButton) {
        guard let sender = sender.currentTitle else { return }
        print(#fileID, #function, #line, "- textButton - sender : \(sender)")

        switch sender {
        case "노랑":
            self.changeTextColor(.yellow)
        case "보라":
            self.changeTextColor(.purple)
        case "초록":
            self.changeTextColor(.green)
        default:
            break
        }

    }

    @IBAction func backViewButton(_ sender: UIButton) {
        guard let sender = sender.currentTitle else { return }
        print(#fileID, #function, #line, "- backViewButton - sender : \(sender)")

        switch sender {
        case "검정":
            self.changeBackViewColor(.black)
        case "파랑":
            self.changeBackViewColor(.blue)
        case "주황":
            self.changeBackViewColor(.orange)
        default:
            break
        }

    }

    @IBAction func memoryButton(_ sender: UIButton) {
        self.delegate?.changeContents(text: self.textField.text, textColor: self.textColor, bgColor: self.bgColor)
        self.navigationController?.popViewController(animated: true)
    }


}
