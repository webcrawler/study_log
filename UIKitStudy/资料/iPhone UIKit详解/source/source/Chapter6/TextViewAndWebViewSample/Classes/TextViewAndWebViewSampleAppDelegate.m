//
//  TextViewAndWebViewSampleAppDelegate.m
//
//  Created by wang on 2011-09-21.
//

#import "TextViewAndWebViewSampleAppDelegate.h"
#import "RootViewController.h"

@implementation TextViewAndWebViewSampleAppDelegate

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

@end
