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

    fileprivate let quoteManager = QuoteManager()


    // MARK: - 라이프사이클
    override func viewDidLoad() {
        super.viewDidLoad()
        self.quoteManager.makeQuoteList()
    }


    // MARK: - 메서드
    @IBAction func tapQuoteGeneratorButton(_ sender: UIButton) {
        DispatchQueue.global().async {
            let count = self.quoteManager.getQuoteList().count
            let random = Int(arc4random_uniform(UInt32(count))) // 난수
            let quote = self.quoteManager[random]
            
            DispatchQueue.main.async {
                self.quoteLabel.text = quote.contents ?? ""
                self.nameLabel.text = "- \(quote.name ?? "")"
            }
        }
    }

}

