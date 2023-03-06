//
//  ViewController.swift
//  UIKit_Code_Navigation_tutorial
//
//  Created by 이용일(Rodi) on 2023/03/06.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var navToSecond: UIButton!

  
  override func viewDidLoad() {
    super.viewDidLoad()


  }

  @IBAction func buttonPressed(_ sender: UIButton) {
    if let vc = SecondVC.getInstance() {
      self.navigationController?.pushViewController(vc, animated: true)
    }
  }

}

