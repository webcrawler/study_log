//
//  UIVideoEditorControllerSampleAppDelegate.m
//
//  Created by ToKoRo on 2009-10-12.
//

#import "UIVideoEditorControllerSampleAppDelegate.h"
#import "RootViewController.h"

@implementation UIVideoEditorControllerSampleAppDelegate

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
