//
//  UIKitPrjTouchesBegan.m
//
//  Created by wang on 2011-08-15.
//UITouch

#import "UIKitPrjTouchesBegan.h"

@implementation UIKitPrjTouchesBegan

- (void)viewDidLoad {
  [super viewDidLoad];

  // 设置背景色（必须）
  // 默认状态下为透明，无法完成触摸
  self.view.backgroundColor = [UIColor whiteColor];
}

// 此方法为接受触摸事件的方法
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                   message:@"I'm a viewController!"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil] autorelease];
  [alert show];
}

@end
