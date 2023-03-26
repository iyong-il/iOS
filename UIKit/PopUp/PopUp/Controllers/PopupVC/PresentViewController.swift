//
//  PresentViewController.swift
//  PopUp
//
//  Created by 이용일(Rodi) on 2023/02/26.
//
import UIKit
import SnapKit
import Then

final class PresentViewController: UIViewController {

  private lazy var mainImage = UIImageView().then {
    $0.image = UIImage(systemName: "car")
  }

    override func viewDidLoad() {
        super.viewDidLoad()
      self.view.backgroundColor = .white
      self.view.addSubview(mainImage)
      mainImage.snp.makeConstraints {
        $0.centerX.equalToSuperview()
        $0.centerY.equalToSuperview()
      }

    }









}
