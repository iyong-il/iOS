//
//  FetchService.swift
//  TodoList_UIKit
//
//  Created by 이용일(Rodi) on 2023/02/05.
//

import Foundation

final class FetchService {

  enum APIError: LocalizedError {
    case urlNotSupport
    case noData

    var errorDescription: String? {
      switch self {
      case .urlNotSupport: return "URL NOT Supported"
      case .noData: return "Has No Data"
      }
    }
  }

  private lazy var defaultSession = URLSession(configuration: .default)
  static let shared = FetchService()
  private init() {}

  typealias FetchError = (Result<[ToDo], APIError>) -> Void

//  func fetchData(completion: @escaping FetchError) {
//
//
//    guard let url = URL(string: "\(API.baseURL)?\(API.pages)&\(API.orders)&\(API.perPage)") else {
//      completion(.failure(.urlNotSupport))
//      return
//    }
//    let resource = Resource<[ToDo]>(url: url)
//    defaultSession.load(resource) { userDatas, _ in
//      guard let data = userDatas, !data.isEmpty else {
//        completion(.failure(.noData))
//        return
//      }
//      completion(.success(data))
//    }
//  }

//   모든데이터 받아오기
    func fetchData(completion: @escaping FetchError) {
      guard let url = URL(string: "\(API.baseURL)?\(API.pages)&\(API.orders)&\(API.perPage)") else { return }

      var request = URLRequest(url: url)
      request.httpMethod = "GET"
      URLSession.shared.dataTask(with: request) { data, response, error in
        if error != nil {
          completion(.failure(.urlNotSupport))
          return
        }

        guard let safeData = data else {
          completion(.failure(.noData))
          return
        }

        if let todos = self.parseJSON(safeData) {
          completion(.success(todos))
        } else {
          return
        }

        print(#fileID, #function, #line, "- 셀에 데이터를 받아옵니다.")

      }.resume()


    }

  // 검색된 데이터 받아오기
  func searchTitleFetchData(title: String, completion: @escaping FetchError) {
    guard let url = URL(string: "\(API.baseURL)/search?query=\(title)&\(API.orders)&\(API.pages)&\(API.perPage)") else { return }

    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    URLSession.shared.dataTask(with: request) { data, response, error in
      if error != nil { return }

      guard let safeData = data else { return }

      if let todos = self.parseJSON(safeData) {
        completion(.success(todos))
      }

      print(#fileID, #function, #line, "- 셀에 검색된 데이터를 받아옵니다.")

    }.resume()


  }


  private func parseJSON(_ todosData: Data) -> [ToDo]? {

    do {
      let todos = try JSONDecoder().decode(FetchToDo.self, from: todosData)
      return todos.data

    } catch let error {

      print(error.localizedDescription)
      return nil
    }

  }


}


