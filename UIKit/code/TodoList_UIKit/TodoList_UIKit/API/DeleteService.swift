//
//  DeleteService.swift
//  TodoList_UIKit
//
//  Created by 이용일(Rodi) on 2023/02/05.
//

import Foundation

final class DeleteService {

  static let shared = DeleteService()
  private init() {}

  func deleteData(id: Int) {
    guard let url = URL(string: "https://phplaravel-574671-2962113.cloudwaysapps.com/api/v1/todos/\(id)") else { return }

    var request = URLRequest(url: url)
    request.httpMethod = "DELETE"

    URLSession.shared.dataTask(with: request) { data, response, error in
//      if error != nil {
//        print(#fileID, #function, #line, "- delete error발생")
//        return
//      }
//
//      guard let safeData = data else {
//        print(#fileID, #function, #line, "- delete data이상")
//        return
//      }
//
//      guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
//        print(#fileID, #function, #line, "- delete response숫자 이상")
//          return
//      }
      print(#fileID, #function, #line, "- 셀 삭제가 완료 되었습니다.")
    }.resume()

  }

}
