//
//  HelloWorldAppDelegate.m
//
//  Created by wang on 2011-08-15.
//

#import "HelloWorldAppDelegate.h"
#import "ViewController1.h"
#import "ViewController2.h"

@implementation HelloWorldAppDelegate

@synthesize window = window_;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
  
  // 初始化window对象
  CGRect bounds = [[UIScreen mainScreen] bounds];
  window_ = [[UIWindow alloc] initWithFrame:bounds];

  // 创建根Controller
  rootController_ = [[UITabBarController alloc] init];
  
  // 创建两个画面的ViewController1及ViewController2
  ViewController1* tab1 = [[[ViewController1 alloc] init] autorelease];
  ViewController2* tab2 = [[[ViewController2 alloc] init] autorelease];

  // 将创建完成的ViewController追加到数组Controller中
  NSArray* controllers = [NSArray arrayWithObjects:tab1, tab2, nil];
  [(UITabBarController*)rootController_ setViewControllers:controllers animated:NO];
  
  // 将Controller的view追加到window中
  [window_ addSubview:rootController_.view];

  [window_ makeKeyAndVisible];
}

- (void)dealloc {
  [rootController_ release];
  [window_ release];
  [super dealloc];
}

@end
