import UIKit

/**==================================================================
  - 아래의 코드 예제에서, Bclass는 Aclass를 상속하고 있습니다. Bclass의 저장속성인
    z를 고려해서, Bclass의 지정생성자를 한개이상 구현하고, 상위(Aclass)의 지정생성자
    (init(x: Int, y: Int))를 편의생성자로 재정의 해보세요.
    (자유롭게 구현해보세요.)
 ===================================================================**/


class Aclass {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    convenience init() {
        self.init(x: 0, y: 0)
    }
}



// 아래의 주석을 제거하고 코드를 구현

//class Bclass: Aclass {
//
//    var z: Int
//
//    // 이 부분에 지정생성자 및 편의 생성자(상위의 지정생성자를 재정의해서) 구현
//
//
//
//}







