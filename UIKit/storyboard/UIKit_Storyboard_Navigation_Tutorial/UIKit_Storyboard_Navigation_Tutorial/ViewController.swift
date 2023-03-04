//
//  ViewController.swift
//  UIKit_Storyboard_Navigation_Tutorial
//
//  Created by 이용일(Rodi) on 2023/03/04.
//

import UIKit

final class ViewController: UIViewController {

  var stepNumber: Int = 1 {
    didSet {
      self.title = "스텝넘버 : \(self.stepNumber)"
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }


  @IBAction func onPushButton(_ sender: UIButton) {

    let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    let vc = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController

    vc.stepNumber = stepNumber + 1

    self.navigationController?.pushViewController(vc, animated: true)
  }



  
}

