import UIKit

/*:
# 앨런 - Swift 마스터 스쿨 13기
*/
/*:
## 다섯번째 테스트 (6주차)
---
*/
/**>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 그동안 배운 내용의 복습 및 약간의 응용이 들어가 있을 뿐입니다. 이 문제를 잘 풀 수 있다고
 좋은 개발자가 될 수 있는 것도 아니고, 실망하거나 좌절할 필요도 없습니다.
 우린 이제 시작일 뿐입니다. 😄
 가장 중요한 것은 포기하지 않고, 꾸준함을 유지하는 것일뿐!
 안풀리면, 다음 문제로 넘어가면되고, 이번에 못풀면 잘 공부해서, 다음 번에 똑같은 문제를 잘 풀면됩니다.
 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>**/

// 서술형의 경우, 주석처리를 하고 작성하면 됩니다.
// (시간이 약간 모자랄 수도 있을 것 같긴한데, 되는 대로 풀어서, 슬랙 DM으로 전달해 주세요!)

// 꼭 정해진 시간 이외에도 풀어보시는대로 전달해 주시면,
// 제가 대략적으로 실력을 파악하는데 도움이 됩니다. (조언도 드릴 수 있고요!)





/**==================================================================
 [1번 문제]
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

class Bclass: Aclass {

    var z: Int

    // 이 부분에 지정생성자 및 편의 생성자(상위의 지정생성자를 재정의해서) 구현
    init(x: Int, y: Int, z: Int) {
        self.z = z              // (현 단계에서) 새로운 저장속성을 추가했기 때문에, 값을 셋팅할 필요 ⭐️
        super.init(x: x, y: y)  // 나머지 x, y 는 상위에서 구현했기 때문에, 실제 메모리 값을 찍어내는 것은 상위지정생성자에서만 가능 ⭐️
    }
    
    override convenience init(x: Int, y: Int) {  // 상위에 있는 생성자와 동일한 이름을 가졌기 때문에 재정의
        self.init(x: x, y: y, z: 0)              // 다만, 편의생성자로 재정의 했기 때문에 (현 단계의) 지정생성자 호출 필요 ⭐️
    }
}






/**==================================================================
 [2번 문제]
  - 클래스에서 convenience(편의) 생성자는 어떤 개념인가요? 아는대로 간단하게 서술하세요.
 ===================================================================**/


// 편의 생성자는 말그대로 (일반적으로 지정생성자보다 적은 갯수의 파라미터로)
// "편리하게" 사용하기 위한 생성자

// 즉, 지정생성자가 직접적으로 메모리값을 셋팅하는 역할을 하는 생성자라면,
// 편의 생성자는 직접적으로 메모리값을 셋팅하지 않고,
// 메모리값을 셋팅하는 것을 지정생성자에게 위임하는 생성자임






/**==================================================================
 [3번 문제]
  - 아래의 SubClass에서, 상위의 SuperClass의 sayHello 메서드를 재정의해서,
    아래 처럼 출력되도록 구현해 보세요.
 
    "안녕하세요."   // super호출 코드로 구현
    "반갑습니다."
    "잘 부탁드려요."
 ===================================================================**/


class SuperClass {
    func sayHello() {
        print("안녕하세요.")
    }
}



class SubClass: SuperClass {
    // 메서드 재정의 코드 구현
    override func sayHello() {
        super.sayHello()
        print("반갑습니다.")
        print("잘 부탁드려요.")
    }
}


// 코드 실행
var subClass = SubClass()
subClass.sayHello()


// 원하는 출력
// "안녕하세요."
// "반갑습니다."
// "잘 부탁드려요."







/**==================================================================
 [4번 문제]
  - 스위프트의 기본 타입인 Int(정수형)를 확장해서, 언제든지 정수 인스턴스를 제곱(square)
    하는 함수를 만드려고 합니다. 아래, square함수의 내부 구현을 완성해 보세요.
    (개념: 확장에서, 메서드 구현)
 ===================================================================**/

// 제곱하는 메서드 만들어 보기

extension Int {
    // 아래 제곱(square) 함수의 내부 구현을 완성 하세요.
    mutating func square() {
        self = self * self
    }
}


// 제대로 구현했는지 확인하는 코드
var someInt = 5
someInt.square()
print(someInt)
// (제대로 구현했다면) 5를 제곱하면, 결과로 25가 출력되면 됩니다.





/**==================================================================
 [5번 문제]
  - 아래 Hero 클래스가 구현되어 있습니다. 해당 Hero클래스는 이름(name)과 아이디(id)로
    인스턴스를 생성할 수 있는데, 해당 클래스를 확장(Extension)해서,
    이름만으로도 인스턴스를 생성할 수 있는.. (확장에서) 생성자를 구현하세요.
    (아이디는 0으로 셋팅되도록 구현하시면 됩니다.)
    (힌트. 확장에서, 생성자의 구현에서, 주의할점은...?)
 ===================================================================**/



class Hero {
    var name: String
    var id: Int
    
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
}

extension Hero {
    // 이 부분을 이름만 가지고 생성할 수 있는 생성자로 구현 하세요.
    convenience init(name: String) {
        self.init(name: name, id: 0)
    }
}


var hero1 = Hero(name: "아이언맨", id: 0)
var hero2 = Hero(name: "캡틴아메리카", id: 1)
var hero3 = Hero(name: "헐크", id: 2)



// 위의 확장에서, 생성자를 제대로 구현하면 아래의 코드가 사용 가능해 집니다.
var hero4 = Hero(name: "토르")
var hero5 = Hero(name: "스파이더맨")






/**==================================================================
 [6번 문제]
  - 메서드 디스패치(Method Dispatch)가 어떤 개념인가요? 아는대로 서술하세요.
    (1) Direct 디스패치, (2) Dynamic 디스패치 두가지의 차이점을 중심으로 설명하세요.
 ===================================================================**/


// 메서드 디스패치(Method Dispatch)
// 실행중인 프로그램이 어떻게 실제 구현된 메서드(코드 영역)를 실행시키게 되는 지에 대한
// 그 실행 과정에 대한 (문법적) 내부 구현 메커니즘

// (1) Direct 디스패치
// static 디스패치라고도 하며, 컴파일 타임에 실제 메서드 구현부(코드영역) 메모리 주소를
// 삽입하거나, 명령어들을 해당 코드의 위치에 직접적으로 심어(in-line) 메서드(함수)를
// 실행시키는 방식으로.. 속도면에서 가장 빠르게 동작이 가능함
// (구조체의 인스턴스 메서드 실행 방식)

// (2) Dynamic 디스패치
// 동적인 형태로, (앱이 실행중인) 런타임에 실제 어떤 메서드를 실행시킬지 선택을 하는
// 동적인 메서드(함수) 구현 방식임
// 일반적으로 함수 메모리주소(포인터)를 배열 형태로 데이터영역에 테이블 형태로 보관해서 실행하는 방식.
// 스위프트에서는 클래스의 인스턴스가 이런 동적인(Dynamic) 디스패치 방식으로 동작하며,
// 정확하게, 클래스의 인스턴스의 경우 Virtual Table을 참고하여 동작하게되고,
// 프로토콜을 채택한 인스턴스의 경우 Witness Table을 참고하여 동작함
// (런타임에 어떤 메서드를 실행시킬지 동적으로 선택하는 과정이므로, Direct 디스패치
// 방식과 비교해서.. 느릴 수 밖에 없음)





/**==================================================================
 [7번 문제]
  - 아래의 조건을 만족하는 RemoteControl 프로토콜의 구현을 완성해 보세요.
    (조건)
    (1) name 속성(타입: String)을 요구사항으로 선언
        (최소한의 요구사항은 읽기 속성 강제하기)
    (2) turnOn 메서드를 요구사항으로 선언
        (input: 없음, output: Bool)
    (3) turnOff 메서드를 요구사항으로 선언
        (input: (num: Int), output: Bool)
 ===================================================================**/

// RemoteControl 프로토콜
protocol RemoteControl {
    var name: String { get }
    func turnOn() -> Bool
    func turnOff(num: Int) -> Bool
}






/**==================================================================
 [8번 문제]
  - 프로토콜(Protocol)의 확장(Extension)이 어떤 개념인가요? 아는대로 간단하게 서술하세요.
 ===================================================================**/

// 프로토콜의 확장에서는, 프로토콜의 선언에서 요구하는 필수요구 사항 메서드 등의
// 기본적인(default) 구현(즉, 실제 구현)을 제공함

// 따라서, 기본 구현이 제공되는 메서드의 경우, 해당 프로토콜을 채택한 타입(클래스, 구조체) 등에서
// 해당 메서드를 반복적으로 구현하지 않아도 되는 편의성이 생김
// 다만, 해당 기본구현을 무시하고 직접적으로 구현하는 것도 가능함






/**==================================================================
 [9번 문제]
  - 프로토콜(Protocol)지향 프로그래밍이 어떤 개념인가요? 아는대로 간단하게 서술하세요.
 ===================================================================**/

// 스위프트에서는 "문법적으로" 프로토콜에 다양하고, 디테일한 기능을 제공해서,
// (다른 언어와 비교해서) 프로토콜을 훨씬 더 다양한 방식으로 활용할 수 있도록 하는
// "프로토콜 지향" 프로그래밍을 내세우고 있음
// (다만, 객체지향 프로그래밍이나 함수형 프로그래밍과 같은 수준의 새로운 또 다른 차원의
// 패러다임을 제공해주는 개념은 아님)

// (1) 다중 상속이 불가능한 클래스의 단점을 극복하여, 여러개의 프로토콜을 채택가능하게 하여
// 다중 상속과 유사한 방식으로 활용이 가능함
// (2) 상위 클래스의 모든 저장속성/메서드를 반드시 상속하게 되는 상속의 단점을 극복하게하여
// 특정한 속성과 메서드의 요구사항이 없어져, 보다 유연한 설계가 가능함
// (3) 클래스 뿐만 아닌, 구조체(값타입)에서도 상속과 같은 효과를 누릴 수 있음
// (4) 프로토콜 확장에서, 메서드에 대한 디폴트 구현을 제공해서, 채택하는 타입에서 보다 편리하게 사용 가능
// (5) 프로토콜 자체가 타입 자체로 인식이 되므로, 변수에 담을 수 있는 등 활용성이 높아짐
// (6) 프로토콜을 사용해서, 이미 구현된 타입들을 확장하여 소급 적용의 효과를 누릴 수 있음






/**==================================================================
 [10번 문제]
  - 스위프트에서, 함수를 1급 객체로 취급한다는 의미가 어떤 의미인가요? 아는대로 설명하세요.
 ===================================================================**/

// 함수자체를 "타입으로 인식한다"는 뜻으로써 ⭐️
// (1) 함수를 변수에 할당할 수 있음
// (2) 어떤 함수를 호출할때, 함수 자체를 파라미터로써 전달할 수 있음
// (3) 어떤 함수에서 "함수"를 반환(return)할 수 있음

// 함수자체를 "타입으로 인식한다"는 것은 위와 같은 의미를 가지고 있음





/**==================================================================
 [11번 문제]
  - 콜백(Call back)함수가 뭔가요? 개념을 간단하게 서술하세요.
 ===================================================================**/

// 어떤 특정 함수를 실행할때, 파라미터로 전달할 수 있는 함수를 말함 ⭐️
// 정확하게 말하면,
// (1) 다른 함수의 인자(argument)로 사용되는 함수이면서
// (2) 어떤 이벤트 후, 다시 호출(call back)되어지는 함수를 말함






/**==================================================================
 [12번 문제]
  - 고차함수를 사용해서, 아래 array배열에서, 5보다 큰 짝수를 뽑아내세요. 해당 뽑아낸
    숫자들을 evenNumbersArray 변수에 담으면 됩니다.
    (힌트. 고차함수 두번 사용 가능)
 ===================================================================**/

let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]


// 아래, array 배열에 고차함수 사용하는 코드 완성하세요.
var evenNumbersArray = array.filter { $0 > 5 }.filter { $0 % 2 == 0 }



// 이 코드는 출력(확인)을 위한 코드 입니다.
print(evenNumbersArray)




/**==================================================================
 [13번 문제]
  - 고차함수를 사용해서, 아래 numbersArray배열에서, 홀수만 제곱해서, 그 숫자를 다
    더한 값을 도출하는 코드를 완성하세요.
    numbersArray 배열에서 고차함수를 조합해서, 새로운 결과를 newResult 변수에
    넣으시면 됩니다.
 ===================================================================**/


var numbersArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]



var newResult = numbersArray
                      .filter { $0 % 2 != 0 }
                      .map { $0 * $0 }
                      .reduce(0) { $0 + $1 }
                    

// 이 코드는 출력(확인)을 위한 코드 입니다.
print(newResult)
// 165






/**==================================================================
 [14번 문제]
  - 아래 Student구조체가 정의되어 있고, 해당 구조체의 인스턴스를 담고 있는
    someMembers 배열이 있습니다. someMembers 배열에서, 고차함수 방식을 이용해서
    친구의 이름이 "아이브"를 가진 멤버만 뽑아내서, 출력을 해보세요.
 
  - 힌트. (1) someMembers.고차함수 사용  (2) contains 메서드
 
  - 고차함수로 잘 완성을 했다면, 그 아래 newMembers.map { print($0.name) }
    이 부분을 통해서, "잡스", "팀쿡" 이 두명의 이름을 정상적으로 출력을 할 수 있습니다.
 ===================================================================**/


struct Student {
    let name: String
    let studentId: Int
    let friendsName: [String]
}


let someMembers: [Student] = [
    Student(name: "잡스", studentId: 0, friendsName: ["팀쿡", "아이브"]),
    Student(name: "팀쿡", studentId: 0, friendsName: ["잡스", "아이브"]),
    Student(name: "주커버그", studentId: 0, friendsName: ["빌게이츠", "마이클"]),
    Student(name: "베조스", studentId: 0, friendsName: ["빌게이츠", "존"])
]



// 아래, someClassMembers 배열에 고차함수 사용하는 코드 완성하세요.
var newMembers = someMembers.filter { $0.friendsName.contains("아이브") }




// 이 코드는 출력(확인)을 위한 코드 입니다.
newMembers.map { print($0.name) }

// 잡스
// 팀쿡




/**==================================================================
 [15번 문제]
  - 함수형 프로그래밍이 어떤 개념인가요? 아는대로, 간단하게 서술하세요.
 ===================================================================**/

// 함수를 이용해서, (사이드이펙트가 없도록) 선언형으로 프로그래밍하는 것

// "선언형"으로 프로그래밍을 한다는 것은.. 어떻게 구현할까의 관점(명령형)보다는
// 이미 잘 만들어져 있는 함수들을 사용해서 "어떤 함수들을 조합"하면 원하는 결과를
// 얻을 수 있을까의 관점에서 프로그래밍을 하는 것에 가까움

// 이미 잘 구현되어져 있는 함수의 쓰임새를 모두가 잘 알고, 공유하고 있다는 전제아래
// 목적만 달성하면 되기 때문에.. 훨씬 간결한 코드 구현이 가능함

// 일반적으로 고차함수를 연결해서 구현하는 방식과 같은 프로그래밍이 함수형 프로그래밍에 가까움






/**>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 수고 하셨습니다. 😄
 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>**/
