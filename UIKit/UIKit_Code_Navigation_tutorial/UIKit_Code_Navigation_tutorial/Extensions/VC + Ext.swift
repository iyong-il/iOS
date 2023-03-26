//
//  VC + Ext.swift
//  UIKit_Code_Navigation_tutorial
//
//  Created by 이용일(Rodi) on 2023/03/19.
//

import UIKit

//extension UIViewController {
//  static func getInstance(_ storyboardName: String? = nil) -> Self? {
//    let name = storyboardName ?? String(describing: self)
//
//    let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
//    return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? Self
//  }
//}

protocol StoryBorded {
  static func getInstance(_ storyboardName: String?) -> Self?
}

extension StoryBorded where Self: UIViewController {
  static func getInstance(_ storyboardName: String? = nil) -> Self? {
    let name = storyboardName ?? String(describing: self)

    let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
    return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? Self
  }
}

extension UIViewController: StoryBorded {}
