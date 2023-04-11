//
//  ViewController.swift
//  Calculator
//
//  Created by 이용일(Rodi) on 2023/04/10.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - 속성
    @IBOutlet weak var numberLabel: UILabel!

    var displayNumber = ""
    var firstNum = ""
    var secondNum = ""
    var result = ""
    var current: Operation = .UnKnown


    // MARK: - 라이프사이클
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    // MARK: - 메서드
    // 계산메서드
    fileprivate func operation(_ operation: Operation) {

        if self.current != .UnKnown {

            if !self.displayNumber.isEmpty {
                self.secondNum = self.displayNumber
                self.displayNumber.removeAll()

                guard let first = Double(self.firstNum),
                      let second = Double(self.secondNum) else { return }

                switch self.current {
                case .Add:
                    self.result = "\(first + second)"
                case .Subtract:
                    self.result = "\(first - second)"
                case .Multiply:
                    self.result = "\(first * second)"
                case .Divide:
                    self.result = "\(first / second)"
                default:
                    break
                }

                self.firstNum = self.result
                self.numberLabel.text = self.result

            }
            self.current = operation

        } else {

            self.firstNum = self.displayNumber
            self.current = operation
            self.displayNumber.removeAll()
            
        }
    }


}

// MARK: - 확장 / @IBAtion
extension ViewController {

    @IBAction func numberButtonTapped(_ sender: UIButton) {
        guard let sender = sender.currentTitle else { return }
        print(#fileID, #function, #line, "- 눌린 숫자는 : \(sender)")

        if self.displayNumber.count < 9 {
            self.displayNumber.append(sender)
            self.numberLabel.text = self.displayNumber
        } else {
            return
        }

    }

    @IBAction func clearButtonTapped(_ sender: UIButton) {
        print(#fileID, #function, #line, "- 초기화버튼이 눌렸다.")

        self.numberLabel.text = "0"
        self.displayNumber.removeAll()
        self.firstNum.removeAll()
        self.secondNum.removeAll()
        self.result.removeAll()
        self.current = .UnKnown
    }

    @IBAction func dotButtonTapped(_ sender: UIButton) {
        if self.displayNumber.count < 8, !self.displayNumber.contains(".") {
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.numberLabel.text = self.displayNumber
        }
    }

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        guard let sender = sender.currentTitle else { return }
        print(#fileID, #function, #line, "- 사칙연산 : \(sender)")

        switch sender {
        case "/":
            self.operation(.Divide)
        case "*":
            self.operation(.Multiply)
        case "+":
            self.operation(.Add)
        case "-":
            self.operation(.Subtract)
        default:
            self.operation(.UnKnown)
        }

    }

    @IBAction func resultButtonTapped(_ sender: UIButton) {
        self.operation(self.current)
    }

}
