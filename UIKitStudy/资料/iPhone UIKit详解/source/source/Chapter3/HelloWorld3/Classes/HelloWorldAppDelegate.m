//
//  HelloWorldAppDelegate.m
//
//  Created by Wang on 2011-10-15.
//

#import "HelloWorldAppDelegate.h"
#import "ViewController1.h"
#import "ViewController2.h"

@implementation HelloWorldAppDelegate

@synthesize window = window_;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
  
  // 初始化window
  CGRect bounds = [[UIScreen mainScreen] bounds];
  window_ = [[UIWindow alloc] initWithFrame:bounds];
  
  // 创建ViewController1与ViewController2、
  // 并将其画面（view）追加到window中
  viewController1_ = [[ViewController1 alloc] init];
  viewController2_ = [[ViewController2 alloc] init];
  [window_ addSubview:viewController1_.view];
  [window_ addSubview:viewController2_.view];

  // ViewController1放在前面显示
  [window_ bringSubviewToFront:viewController1_.view];

  [window_ makeKeyAndVisible];
}


- (void)dealloc {
  [viewController1_ release];
  [viewController2_ release];
  [window_ release];
  [super dealloc];
}

@end
