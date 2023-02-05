//
//  UploadService.swift
//  TodoList_UIKit
//
//  Created by 이용일(Rodi) on 2023/02/05.
//

import Foundation


final class UploadService {

  static let shared = UploadService()
  private init() {}

  func uploadData(title: String) {
    guard let url = URL(string: "https://phplaravel-574671-2962113.cloudwaysapps.com/api/v1/todos") else { return }

    struct Upload: Codable {
      let title: String
    }

    let uploadDataModel = Upload(title: title)

    guard let jsonData = try? JSONEncoder().encode(uploadDataModel) else { return }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")

    request.httpBody = jsonData

    URLSession.shared.dataTask(with: request) { data, response, error in
      if error != nil { return }

      guard let safeData = data else {
        print("Error: Did not receive data")
        return
      }

      guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else { return }
      print(#fileID, #function, #line, "- 등록 되었습니다.")


    }.resume()


  }

}

