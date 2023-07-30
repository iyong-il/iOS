//
//  ViewController.swift
//  MyFirstApp
//
//  Created by 이용일(Rodi) on 2023/07/30.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - 속성
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var changButton: UIButton!

    private var isTrue = false


    // MARK: - 라이프사이클
    // 로드뷰
    override func loadView() {
        super.loadView()
        print(#fileID, #function, #line, "- called")

        titleLabel.text = "반가워요!"
        self.view.backgroundColor = .cyan
    }

    // 뷰디드로드 - 앱의 화면에 들어오면 처음 실행시키는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#fileID, #function, #line, "- called")


    }


    // MARK: - 메서드
    @IBAction func labelChangeButtonPressed(_ sender: UIButton) {
        print(#fileID, #function, #line, "- called")
        guard let sender = sender.currentTitle else { return }
        print("sender - \(sender)")
        changeBool(isTrue: isTrue)

    }

    private func changeBool(isTrue: Bool) {
        self.isTrue = !self.isTrue
        titleLabel.textColor = .white
        if(isTrue) {
            titleLabel.text = "반갑습니다."
            // #colorLiteral + (
            titleLabel.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            titleLabel.textAlignment = .right
            changButton.setTitle("버튼", for: .normal)
            changButton.setTitleColor(.black, for: .disabled)
//            changButton.isEnabled = false
            
        } else {
            titleLabel.text = "안녕하세요."
            titleLabel.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            titleLabel.textAlignment = .left
            changButton.setTitleColor(.yellow, for: .normal)
        }

        // 참고 - #imageLiteral + (     --> 이미지 추가방법중 하나
    }



    

}

