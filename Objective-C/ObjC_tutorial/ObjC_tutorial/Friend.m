//
//  Friend.m
//  ObjC_tutorial
//
//  Created by 이용일(Rodi) on 2023/03/04.
//

#import <Foundation/Foundation.h>
#import "Friend.h"

// 클래스 확장 - 클래스 안에서 사용
@interface Friend ()
{
  // 내부에서 사용하는 변수는 _(언더스코어)를 주로 사용한다.
  NSString *_name;
}
@end


// 구현부
@implementation Friend

- (void)sayHello {

  self->_name = @"로디입니다.";
  self->_nickname= @"haha";

  NSLog(@"안녕하세요. %@", self->_name);
}

+ (void)sayGoodbye {
  NSLog(@"잘가요!!");

}




@end
