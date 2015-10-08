//
//  UIKitPrjAlertWithLongMessage.m
//
//  Created by wang on 2011-09-19.
//

#import "UIKitPrjAlertWithLongMessage.h"

@implementation UIKitPrjAlertWithLongMessage

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
  alert.title = @"message很长的情况下";
  alert.message = @"第1行\n第2行\n第3行\n第4行\n第5行\n第6行\n第7行\n第8行\n第9行\n第10行\n第11行\n第12行\n第13行";
  [alert addButtonWithTitle:@"OK"];
  [alert show];
}

@end
