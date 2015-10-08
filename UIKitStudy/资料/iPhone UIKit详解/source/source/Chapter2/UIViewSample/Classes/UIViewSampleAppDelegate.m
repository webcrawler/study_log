//
//  UIViewSampleAppDelegate.m
//  UIViewSample
//
//  Created by user00 on 8/3/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "UIViewSampleAppDelegate.h"
#import "RootViewController.h"


@implementation UIViewSampleAppDelegate

- (void)dealloc {
  [navigationController_ release];
  [window_ release];
  [super dealloc];
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
  CGRect frame = [[UIScreen mainScreen] bounds];
  window_ = [[UIWindow alloc] initWithFrame:frame];

  id rootViewController = [[[RootViewController alloc] init] autorelease];
  navigationController_ = [[UINavigationController alloc] initWithRootViewController:rootViewController];
  [navigationController_ setNavigationBarHidden:YES animated:NO];

  [window_ addSubview:navigationController_.view];
  [window_ makeKeyAndVisible];
}

@end

