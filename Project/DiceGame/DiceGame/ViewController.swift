//
//  ViewController.swift
//  DiceGame
//
//  Created by 이용일(Rodi) on 2023/08/02.
//

import UIKit

final class ViewController: UIViewController {

	var diceArray = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]

	@IBOutlet weak var image1: UIImageView!
	@IBOutlet weak var image2: UIImageView!


	override func loadView() {
		super.loadView()
		image1.image = diceArray[0]
		image2.image = diceArray[0]
	}

	override func viewDidLoad() {
		super.viewDidLoad()

	}


	@IBAction func randomButtonPressed(_ sender: UIButton) {

        image1.image = diceArray.randomElement()
        image2.image = diceArray.randomElement()

	}



}

