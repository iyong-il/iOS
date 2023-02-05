//
//  UIView+Ext.swift
//  TodoList_UIKit
//
//  Created by 이용일(Rodi) on 2023/02/05.
//

import Foundation
#if DEBUG
import SwiftUI

extension UIView {
  private struct ViewRepresentable: UIViewRepresentable {

    let uiview: UIView

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }
    func makeUIView(context: Context) -> some UIView {
      return uiview
    }

  }
  func getPreview() -> some View {
    ViewRepresentable(uiview: self)
  }
}
#endif

