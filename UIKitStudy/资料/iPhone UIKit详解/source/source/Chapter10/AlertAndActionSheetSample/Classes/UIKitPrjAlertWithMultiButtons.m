//
//  UIKitPrjAlertWithMultiButtons.m
//
//  Created by wang on 2011-09-19.
//

#import "UIKitPrjAlertWithMultiButtons.h"

@implementation UIKitPrjAlertWithMultiButtons

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
  alert.delegate = self;
  alert.title = @"恢复您的笔记";
  alert.message = @"您的笔记已经不见了。要恢复之前的笔记吗?";
  [alert addButtonWithTitle:@"不"];
  [alert addButtonWithTitle:@"是"];
  alert.cancelButtonIndex = 0;
  [alert show];
}

- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
  // 判断点击哪个按钮
  if ( buttonIndex != alertView.cancelButtonIndex ) {
	//[是]按钮被触摸后的处理
    UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
    alert.title = @"恢复失败";
    alert.message = @"很遗憾恢复失败了";
    [alert addButtonWithTitle:@"OK"];
    [alert show];
  } 
}

@end
