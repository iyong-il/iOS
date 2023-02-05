//
//  Resource+Ext.swift
//  TodoList_UIKit
//
//  Created by 이용일(Rodi) on 2023/02/05.
//

import Foundation

struct Resource<T> {
  var urlRequest: URLRequest
  let parse: (Data) -> T?
}

extension Resource where T: Decodable {
  // 1
  init(url: URL) {
    self.urlRequest = URLRequest(url: url)
    self.parse = { data in
      try? JSONDecoder().decode(T.self, from: data)
    }
  }

  // 2
  init(url: String, parameters _parameters: [String: String]) {
    var component = URLComponents(string: url)
    var parameters = [URLQueryItem]()
    for (name, value) in _parameters {
      if name.isEmpty { continue }
      parameters.append(URLQueryItem(name: name, value: value))
    }

    if !parameters.isEmpty {
      component?.queryItems = parameters
    }
    if let componentURL = component?.url {
      self.urlRequest = URLRequest(url: componentURL)
    } else {
      self.urlRequest = URLRequest(url: URL(string: url)!)
    }
    self.parse = { data in
      try? JSONDecoder().decode(T.self, from: data)
    }
  }

  // 3
  init<Body: Encodable>(url: URL, method: HttpMethod<Body>) {
    self.urlRequest = URLRequest(url: url)
    self.urlRequest.httpMethod = method.method

    switch method {
    case .post(let body), .delete(let body), .patch(let body), .put(let body):
      self.urlRequest.httpBody = try? JSONEncoder().encode(body)
      self.urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
      self.urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
    default: break
    }
    self.parse = { data in
      try? JSONDecoder().decode(T.self, from: data)
    }
  }
}

