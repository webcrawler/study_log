//
//  HelloWorldAppDelegate.m
//
//  Created by wang on 2011-08-15.
//

#import "HelloWorldAppDelegate.h"
#import "TopMenuController.h"

@implementation HelloWorldAppDelegate

@synthesize window = window_;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
  
  // 初始化window_对象
  CGRect bounds = [[UIScreen mainScreen] bounds];
  window_ = [[UIWindow alloc] initWithFrame:bounds];

  // 创建根Controller
  TopMenuController* topMenu = [[[TopMenuController alloc] init] autorelease];  
  rootController_ = [[UINavigationController alloc] initWithRootViewController:topMenu];
  
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
