//
//  ViewController.swift
//  LED
//
//  Created by 이용일(Rodi) on 2023/04/09.
//

import UIKit

final class MainVC: UIViewController {

    // MARK: - 속성
    @IBOutlet weak var contentsLabel: UILabel!
    @IBOutlet var backView: UIView!
    @IBOutlet weak var detailButton: UIBarButtonItem!


    // MARK: - 라이프사이클
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


    // MARK: - 메서드

    fileprivate func setupUI() {
        self.contentsLabel.textColor = .yellow
        self.backView.backgroundColor = .black
        self.detailButton.tintColor = .white
    }

    // segue에서의 데이터 보내는 방법
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailVC else { return }

        detailVC.delegate = self

        detailVC.ledText = self.contentsLabel.text ?? ""
        detailVC.textColor = self.contentsLabel.textColor
        detailVC.bgColor = self.backView.backgroundColor
    }

}

// MARK: - 확장 / 델리게이트
extension MainVC : LEDDelegate {

    func changeContents(text: String?, textColor: UIColor?, bgColor: UIColor?) {
        guard let text = text,
              let textColor = textColor,
              let bgColor = bgColor else { return }

        self.contentsLabel.text = text
        self.contentsLabel.textColor = textColor
        self.backView.backgroundColor = bgColor
    }


}



