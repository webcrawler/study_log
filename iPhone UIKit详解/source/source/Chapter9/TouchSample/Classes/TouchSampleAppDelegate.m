//
//  TouchSampleAppDelegate.m
//  TouchSample
//
//  Created by user00 on 8/30/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "TouchSampleAppDelegate.h"
#import "RootViewController.h"

@implementation TouchSampleAppDelegate

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

- (void)applicationWillResignActive:(UIApplication*)applicaton {
  NSLog( @"UIApplication.resignActive" );
}

@end
