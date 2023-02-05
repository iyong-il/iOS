//
//  VC+Ext.swift
//  TodoList_UIKit
//
//  Created by 이용일(Rodi) on 2023/02/05.
//

import Foundation
#if DEBUG
import SwiftUI

extension UIViewController {
  private struct VCRepresentable: UIViewControllerRepresentable {

    let viewController: UIViewController

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
    func makeUIViewController(context: Context) -> some UIViewController {
      return viewController
    }

  }
  func getPreview() -> some View {
    VCRepresentable(viewController: self)
  }
}
#endif


