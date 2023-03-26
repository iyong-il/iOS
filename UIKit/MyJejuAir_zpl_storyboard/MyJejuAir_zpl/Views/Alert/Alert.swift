//
//  Alert.swift
//  MyJejuAir_zpl
//
//  Created by 이용일(Rodi) on 2023/02/19.
//

import UIKit

final class Alert: UIView {

  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  
  
  
  
}


#if DEBUG
import SwiftUI

struct Alert_Previews: PreviewProvider {
  static var previews: some View {
    if #available(iOS 14.0, *) {
      Alert().getPreview()
        .ignoresSafeArea()
    }
    
  }
}
#endif

