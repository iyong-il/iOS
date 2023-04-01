//
//  ViewController.swift
//  QuotesGenerator
//
//  Created by 이용일(Rodi) on 2023/04/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    let quoteManager = QuoteManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteLabel.text?.removeAll()
        nameLabel.text?.removeAll()
        self.quoteManager.makeQuoteList()
    }


    @IBAction func tapQuoteGeneratorButton(_ sender: UIButton) {
        let random = (0...4).randomElement() ?? 0// 0 ~ 4 사이의 난수를 랜덤하게 만들어준다.
        let quote = quoteManager[random]
        self.quoteLabel.text = quote.contents
        self.nameLabel.text = quote.name


    }



}

