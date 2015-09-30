//
//  UIKitPrjAlertDismiss.m
//
//  Created by wang on 2011-09-19.
//

#import "UIKitPrjAlertDismiss.h"

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjAlertDismiss ()
- (void)dismissAlert:(UIAlertView*)alert;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjAlertDismiss

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
  alert.message = @"此信息３秒后消失。";
  [alert addButtonWithTitle:@"取消"];
  alert.cancelButtonIndex = 0;
  [alert show];

  [self performSelector:@selector(dismissAlert:) withObject:alert afterDelay:3.0];
}

- (void)dismissAlert:(UIAlertView*)alert {
  if ( alert.visible ) {
    [alert dismissWithClickedButtonIndex:alert.cancelButtonIndex animated:YES];
  } 
}

@end
