//
//  ViewController.m
//  ObjC_tutorial
//
//  Created by 이용일(Rodi) on 2023/03/04.
//

#import "ViewController.h"
#import "Friend.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  // 객체를 메모리에 올리는 과정
  Friend *myFriend = [[Friend alloc] init];

  // 인스턴스 메서드
  [myFriend sayHello];

  // 클래스 메서드 - 메모리에 올리지 않고 사용할 수 있다.(static)
  [Friend sayGoodbye];

  // 외부에서 접근가능한 변수
  NSLog(@"myFriend.nickname: %@", myFriend.nickname);


  // Bool 타입 사용법
  BOOL isDark = YES; // swift - true
  BOOL isLight = NO;  // swift - false

  if (!isDark) {
    NSLog(@"다크모드 입니까? %@", isDark ? @"true!" : @"false!");
  } else if(isLight) {
    NSLog(@"라이트모드 입니까? %@", isLight ? @"true!" : @"false!");
  } else {
    NSLog(@"둘 다 아닙니다.");
  }


  // 셀렉터 메서드 변수에 담기
  SEL buttonSelector = @selector(testButtonTapped:);

#pragma mark - 셀렉터
  [_testButton addTarget:self action:buttonSelector forControlEvents:UIControlEventTouchUpInside];


  
}


#pragma mark - 셀렉터 메서드
- (void)testButtonTapped:(UIButton *) sender {
  // _cmd - 현재 함수에 대한 이름
  NSLog(@"name: %@ , btnTitle: %@", NSStringFromSelector(_cmd), sender.titleLabel.text);
}

@end
