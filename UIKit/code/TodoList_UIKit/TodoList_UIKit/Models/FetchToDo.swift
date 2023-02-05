//
//  FetchToDo.swift
//  TodoList_UIKit
//
//  Created by 이용일(Rodi) on 2023/02/05.
//

import Foundation

// MARK: - 서버에서 받는 데이터
struct FetchToDo: Codable {
  let data: [ToDo]
  let meta: Meta
  let message: String
}

// MARK: - 투두 데이터
struct ToDo: Codable {
  let id: Int
  let title: String
  let isDone: Bool
  let createdAt, updatedAt: String

  enum CodingKeys: String, CodingKey {
    case id, title
    case isDone = "is_done"
    case createdAt = "created_at"
    case updatedAt = "updated_at"
  }
}

// MARK: - Meta
struct Meta: Codable {
  let currentPage, from, lastPage, perPage: Int
  let to, total: Int

  enum CodingKeys: String, CodingKey {
    case currentPage = "current_page"
    case from
    case lastPage = "last_page"
    case perPage = "per_page"
    case to, total
  }
}

