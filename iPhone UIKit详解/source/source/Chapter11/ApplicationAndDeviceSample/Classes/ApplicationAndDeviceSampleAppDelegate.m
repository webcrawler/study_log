//
//  ApplicationAndDeviceSampleAppDelegate.m
//
//  Created by wang on 2011-10-01.
//

#import "ApplicationAndDeviceSampleAppDelegate.h"
#import "RootViewController.h"

@implementation ApplicationAndDeviceSampleAppDelegate 

- (void)dealloc {
  [navi_ release];
  [window_ release];
  [super dealloc];
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

  CGRect frame = [[UIScreen mainScreen] bounds];
  window_ = [[UIWindow alloc] initWithFrame:frame];

  RootViewController* rootViewController = [[[RootViewController alloc] init] autorelease];
  navi_ = [[UINavigationController alloc] initWithRootViewController:rootViewController];
  [navi_ setNavigationBarHidden:YES animated:NO];

  [window_ addSubview:navi_.view];
  [window_ makeKeyAndVisible];
}

- (BOOL)application:(UIApplication*)application handleOpenURL:(NSURL*)url {
  NSString* query = [url query];
  if ( !url || !query ) return NO;
  // 将参数直接显示在警告框中
  // 实际上可根据参数编写各种各样的具体处理
  UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
  alert.message = query;
  [alert addButtonWithTitle:@"OK"];
  [alert show];
  return YES;
}

@end
