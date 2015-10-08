//
//  UIKitPrjCopyAndPaste.m
//
//  Created by wang on 2011-10-01.
//

#import "UIKitPrjCopyAndPaste.h"
//定义私有方法
@interface UIKitPrjCopyAndPaste ()
- (UIImageView*)imageContainsPoint:(CGPoint)point;
@end 

@implementation UIKitPrjCopyAndPaste

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.view.backgroundColor = [UIColor whiteColor];

  UIImage* image;
  image = [UIImage imageNamed:@"bug1.png"];
  UIImageView* bug1 = [[UIImageView alloc] initWithImage:image];
  bug1.center = self.view.center;
  [self.view addSubview:bug1];
  [bug1 release];
  image = [UIImage imageNamed:@"bug2.png"];
  UIImageView* bug2 = [[UIImageView alloc] initWithImage:image];
  bug2.center = CGPointMake( 200, 300 );
  [self.view addSubview:bug2];
  [bug2 release];
  image = [UIImage imageNamed:@"bug3.png"];
  UIImageView* bug3 = [[UIImageView alloc] initWithImage:image];
  bug3.center = CGPointMake( 50, 80 );
  [self.view addSubview:bug3];
  [bug3 release];
}
//不成为第一响应者无法显示编辑菜单
- (BOOL)canBecomeFirstResponder {
  return YES;
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  UITouch* touch = [touches anyObject];
  if ( [self becomeFirstResponder] && 1 < [touch tapCount] ) {
    // 连续两次触碰后显示编辑菜单
    UIMenuController* menu = [UIMenuController sharedMenuController];
    touchPoint_ = [touch locationInView:self.view];
    CGRect minRect;
    minRect.origin = touchPoint_;
    [menu setTargetRect:minRect inView:self.view];
    [menu setMenuVisible:YES animated:YES];
  } 
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
  if ( @selector(copy:) == action ) {
    if ( [self imageContainsPoint:touchPoint_] ) {
      return YES;
    } 
  } else if ( @selector(cut:) == action ) {
    if ( [self imageContainsPoint:touchPoint_] ) {
      return YES;
    }
  } else if ( @selector(paste:) == action ) {
    return ( nil != [UIPasteboard generalPasteboard].image );
  }
  return NO;
}

- (UIImageView*)imageContainsPoint:(CGPoint)point {
  for ( UIView* view in self.view.subviews ) {
    if ( CGRectContainsPoint( view.frame, point ) ) {
      if ( [view isKindOfClass:[UIImageView class]] ) {
        return (UIImageView*)view;
      } 
    } 
  }
  return nil;
}

- (void)copy:(id)sender {
  UIImageView* imageView = [self imageContainsPoint:touchPoint_];
  if ( imageView ) {
    [UIPasteboard generalPasteboard].image = imageView.image;
  } 
}

- (void)cut:(id)sender {
  UIImageView* imageView = [self imageContainsPoint:touchPoint_];
  if ( imageView ) {
    [UIPasteboard generalPasteboard].image = imageView.image;
    [imageView removeFromSuperview];
  } 
}

- (void)paste:(id)sender {
  UIPasteboard* pasteBoard = [UIPasteboard generalPasteboard];
  if ( pasteBoard.image ) {
    UIImageView* bug =
      [[[UIImageView alloc] initWithImage:pasteBoard.image] autorelease];
    bug.center = touchPoint_;
    [self.view addSubview:bug];
    pasteBoard.image = bug.image;
  } 
}

@end
