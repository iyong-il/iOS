//
//  Member.swift
//  MemberList-code
//
//  Created by 이용일 on 2022/09/28.
//

import UIKit

// 커스텀 델리게이트패턴을 위한 프로토콜 생성
protocol MemberDelegate: AnyObject {
  func addNewMember(_ member: Member)
  func update(index: Int, _ member: Member)
}

// 데이터의 묶음을 만들 때는 구조체로 주로 만든다.
struct Member {
  // 메모리 낭비를 막기위해 지연저장속성으로 정의
  lazy var memeberImage: UIImage? = {
    // 이름이 없다면, 시스템이미지 세팅
    guard let name = self.name else {
      return UIImage(systemName: "person")
    }
    // 해당이름의 이미지가 없다면, 시스템이미지 세팅
    return UIImage(named: "\(name).png") ?? UIImage(systemName: "person")
  }()

  //멤버의 순서를 위한 타입 저장 속성
  static var memberNumbers: Int = 0

  let memberId: Int
  var name: String?
  var age: Int?
  var phone: String?
  var address: String?

  // 생성자 구현
  init(name: String?, age: Int?, phone: String?, address: String?) {

    // self.memberId = Member.memberNumbers == 0 ? 0 : Member.memberNumbers
    self.memberId = Member.memberNumbers

    self.name = name
    self.age = age
    self.phone = phone
    self.address = address
    
    Member.memberNumbers += 1
  }
}
