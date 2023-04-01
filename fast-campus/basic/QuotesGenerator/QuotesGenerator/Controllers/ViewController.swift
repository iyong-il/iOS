//
//  ViewController.swift
//  QuotesGenerator
//
//  Created by 이용일(Rodi) on 2023/04/01.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - 속성
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    let quoteManager = QuoteManager()


    // MARK: - 라이프사이클
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteLabel.text?.removeAll()
        nameLabel.text?.removeAll()
        self.quoteManager.makeQuoteList()
    }


    // MARK: - 메서드
    @IBAction func tapQuoteGeneratorButton(_ sender: UIButton) {
        DispatchQueue.global().async {
            var random = (0...4).randomElement() ?? 0
            random = Int(arc4random_uniform(4)) // 0 ~ 4 사이의 난수를 랜덤하게 만들어준다.
            print(#fileID, #function, #line, "- 명언 번호 : \(random)")

            let quote = self.quoteManager[random]
            DispatchQueue.main.async {
                self.quoteLabel.text = quote.contents
                self.nameLabel.text = quote.name
            }
        }
    }



}

