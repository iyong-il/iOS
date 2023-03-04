//
//  Friend.h
//  ObjC_tutorial
//
//  Created by 이용일(Rodi) on 2023/03/04.
//

#ifndef Friend_h
#define Friend_h
#import <UIKit/UIKit.h>

@interface Friend : NSObject

// 외부에서 접근 가능한 녀석들 - 멤버 변수
@property NSString *nickname;

// 인스턴스 메서드 - 객체 생성 후 그 녀석이 가지고 있는 메서드
- (void)sayHello;

// 클래스 메서드 - 객체 생성 하지 않아도 됨 - static method
+ (void)sayGoodbye;

@end


#endif /* Friend_h */
