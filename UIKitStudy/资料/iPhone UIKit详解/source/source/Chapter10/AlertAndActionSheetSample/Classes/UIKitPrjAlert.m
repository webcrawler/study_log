//
//  UIKitPrjAlert.m
//
//  Created by wang on 2011-09-19.
//

#import "UIKitPrjAlert.h"

@implementation UIKitPrjAlert

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
  alert.title = @"遗憾的通知";
  alert.message = @"您的笔记已经消失了";
  [alert addButtonWithTitle:@"OK"];
  [alert show];

  /* 也可使用initWithTitle
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:@"遗憾的通知"
                                                   message:@"您的笔记已经消失了"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil] autorelease];
  [alert show];
  */

}

@end
