//
//  UIActivityIndicatorViewSampleAppDelegate.m
//
//  Created by wang on 2011-08-15.
//

#import "UIActivityIndicatorViewSampleAppDelegate.h"
#import "RootViewController.h"

@implementation UIActivityIndicatorViewSampleAppDelegate

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

  [window_ addSubview:navi_.view];
  [window_ makeKeyAndVisible];
}

@end
