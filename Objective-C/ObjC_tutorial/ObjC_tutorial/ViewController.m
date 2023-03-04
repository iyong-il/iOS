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
  // Do any additional setup after loading the view.


  Friend *myFriend = [[Friend alloc] init];


  [myFriend sayHello];

  [Friend sayGoodbye];

}


@end
