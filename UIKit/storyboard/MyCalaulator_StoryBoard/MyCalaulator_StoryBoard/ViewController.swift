//
//  ViewController.swift
//  MyCalaulator_StoryBoard
//
//  Created by 이용일(Rodi) on 2023/02/05.
//

import UIKit

// 계산 열거형
enum Operation {
  case add
  case subtract
  case divide
  case multiply
  case unknown
}

final class ViewController: UIViewController {

// MARK: - 속성
  @IBOutlet weak var numberOutputLabel: UILabel!

  fileprivate var displayNumber = ""
  fileprivate var firstOperand = ""
  fileprivate var secondOperand = ""
  fileprivate var result = ""
  fileprivate var currentOperation: Operation = .unknown


  // MARK: - 뷰디드로드
  override func viewDidLoad() {
    super.viewDidLoad()

  }

  // MARK: - 메서드
  @IBAction func numberButtonTapped(_ sender: UIButton) {
    guard let sender = sender.currentTitle else { return }
    if displayNumber.count < 9 {
      displayNumber += sender
      numberOutputLabel.text = displayNumber
    }
    print(#fileID, #function, #line, "- 눌린 숫자 : \(sender)")
  }

//  AC버튼 눌렀을 때
  @IBAction func clearButtonTapped(_ sender: UIButton) {
    displayNumber.removeAll()
    firstOperand.removeAll()
    secondOperand.removeAll()
    result.removeAll()
    currentOperation = .unknown
    numberOutputLabel.text = "0"
    print(#fileID, #function, #line, "- AC버튼이 눌렸다.")
  }
//    .버튼 눌렀을 때
  @IBAction func dotButtonTapped(_ sender: UIButton) {
    if displayNumber.count < 8, !displayNumber.contains(".") {
      displayNumber += displayNumber.isEmpty ? "0." : "."
      numberOutputLabel.text = displayNumber
    }
    print(#fileID, #function, #line, "- .버튼이 눌렸다.")
  }
//  나누기
  @IBAction func divideButtonTapped(_ sender: UIButton) {
    operation(operation: .divide)
    print(#fileID, #function, #line, "- 나누기버튼이 눌렸다.")
  }
//  곱하기
  @IBAction func multipleButtonTapped(_ sender: UIButton) {
    operation(operation: .multiply)
    print(#fileID, #function, #line, "- 곱하기버튼이 눌렸다.")
  }
//  빼기
  @IBAction func subtrackButtonTapped(_ sender: UIButton) {
    operation(operation: .subtract)
    print(#fileID, #function, #line, "- 빼기 버튼이 눌렸다.")
  }
//  더하기
  @IBAction func addButtonTapped(_ sender: UIButton) {
    operation(operation: .add)
    print(#fileID, #function, #line, "- 더하기 버튼이 눌렸다.")
  }
//  결과값
  @IBAction func equalButtonTapped(_ sender: UIButton) {
    operation(operation: currentOperation)
    print(#fileID, #function, #line, "- 결과는 : \(result)")
  }

}

// MARK: - 확장 / 계산 메서드
extension ViewController {

  fileprivate func operation(operation: Operation) {
    if currentOperation != .unknown {
      if !displayNumber.isEmpty {
        secondOperand = displayNumber
        displayNumber = ""

        guard let firstOperand = Double(self.firstOperand) else { return }
        guard let secondOperand = Double(self.secondOperand) else { return }

        switch currentOperation {
        case .add:
          result = "\(firstOperand + secondOperand)"

        case .subtract:
          result = "\(firstOperand - secondOperand)"

        case .multiply:
          result = "\(firstOperand * secondOperand)"

        case .divide:
          result = "\(firstOperand / secondOperand)"

        default:
          break
        }

        if let result = Double(result), result.truncatingRemainder(dividingBy: 1) == 0 {
          self.result = "\(Int(result))"
        }

        self.firstOperand = result
        numberOutputLabel.text = result
      }
      currentOperation = operation
    } else {
      firstOperand = displayNumber
      currentOperation = operation
      displayNumber.removeAll()
    }
  }
}
