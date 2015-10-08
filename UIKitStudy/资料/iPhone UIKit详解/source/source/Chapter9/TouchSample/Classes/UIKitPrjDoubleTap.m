//
//  UIKitPrjDoubleTap.m
//
//  Created by wang on 2011-08-30.
//

#import "UIKitPrjDoubleTap.h"

@implementation UIKitPrjDoubleTap

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  // 画面被触摸后解除单点触摸标志
  singleTapReady_ = NO;
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  //参照touches中对象的tapCount属性
  //根据tapCount属性判断单次触碰或者多次触碰
  NSInteger tapCount = [[touches anyObject] tapCount];
  if ( 2 > tapCount ) {
    // tapCount小于2时将单点触摸标志设置成YES
    singleTapReady_ = YES;
    // 单点触碰方法延迟0.3秒执行
    [self performSelector:@selector(singleTap)
               withObject:nil
               afterDelay:0.3f];
  } else {
    // 执行双击确认方法（douleTap）
    [self performSelector:@selector(doubleTap)];
  }

}

- (void)singleTap {
  // 如果有其他的touchesBegan被调用则方法退出
  if ( !singleTapReady_ ) return;

  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                   message:@"Single Tap!"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil] autorelease];
  [alert show];
}

- (void)doubleTap {
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                   message:@"Double Tap!!"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil] autorelease];
  [alert show];
}

@end
