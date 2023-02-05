//
//  Constants.swift
//  TodoList_UIKit
//
//  Created by 이용일(Rodi) on 2023/02/05.
//

import Foundation

public struct API {
  static let baseURL = "https://phplaravel-574671-2962113.cloudwaysapps.com/api/v1/todos"
  static let pages = "page=1"
  static let orders = "order_by=desc"
  static let perPage = "per_page=10"

  private init() {}
}

public struct TVCell {
  static let reuseIdentifier = "TVcell"

  private init() {}
}
