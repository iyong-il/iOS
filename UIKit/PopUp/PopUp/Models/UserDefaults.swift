//
//  UserDefaults.swift
//  PopUp
//
//  Created by 이용일(Rodi) on 2023/02/26.
//
import Foundation
// 다시보지않기 버튼 누르면 계속 유지되는 로직
class UserDefault {
    let popupUserDefaults = UserDefaults.standard

    // userdefault에 팝업창 띄우기 유무 저장
    func saveUserdefault(checkPopup: Bool) {
        popupUserDefaults.set(checkPopup, forKey: "checkPopup")
      print(#fileID, #function, #line, "- 유저디폴트 상태: \(checkPopup.description)")

    }

    // userdefault 불러오기
  func loadUserdefault() -> Bool {
        // 저장된게 없으면 show하기
        guard let checkPopup = popupUserDefaults.object(forKey: "checkPopup") as? Bool else { return true }
    print(#fileID, #function, #line, "- 다시보지않기 버튼 상태: \(checkPopup.description)")

        return checkPopup
    }
}



