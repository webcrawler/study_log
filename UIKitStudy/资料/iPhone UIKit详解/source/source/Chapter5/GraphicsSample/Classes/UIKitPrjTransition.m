//
//  UIKitPrjTransition.m
//
//  Created by wang on 2011-09-24.
//

#import "UIKitPrjTransition.h"
//UIView中指定的tag的常量
static const NSInteger kTagViewForTransitionTest = 1;

#pragma mark ----- Private Methods Definition -----
//声明私有方法
@interface UIKitPrjTransition ()
- (UIView*)nextView;
- (void)animationDidStop;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjTransition

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.view addSubview:[self nextView]];//显示初始图片
}

#pragma mark ----- Responder -----
//触摸画面时显示过渡动画效果
- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
//如果非动画可运行状态则返回
  if ( ![UIView areAnimationsEnabled] ) {
    [self.nextResponder touchesEnded:touches withEvent:event];
    return;
  } 
  //过渡动画的初始设置
  static UIViewAnimationTransition transition = UIViewAnimationTransitionFlipFromLeft;

  UIView* nextView = [self nextView];//创建下一个画面（UIView）
  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationDelegate:self];
  [UIView setAnimationDidStopSelector:@selector(animationDidStop)];
  [UIView setAnimationDuration:10.0];
  [UIView setAnimationTransition:transition forView:self.view cache:YES];
  [[self.view viewWithTag:kTagViewForTransitionTest] removeFromSuperview];
  [self.view addSubview:nextView];
  [UIView commitAnimations];
  //暂时将动画置为无效状态
  [UIView setAnimationsEnabled:NO];
  //切换过渡动画效果
  if ( UIViewAnimationTransitionCurlDown < ++transition ) {
    transition = UIViewAnimationTransitionFlipFromLeft;
  } 
}

#pragma mark ----- Private Methods -----
//创建下一画面的私有方法
- (UIView*)nextView {
  static BOOL isFront = YES;
  UIImage* image;
  if ( isFront ) {
    image = [UIImage imageNamed:@"dog.jpg"]; //< 表面图片
  } else {
    image = [UIImage imageNamed:@"town.jpg"]; //< 里层图片
  }
  isFront = ( YES != isFront );
  UIView* view = [[[UIImageView alloc] initWithImage:image] autorelease];
  view.tag = kTagViewForTransitionTest;
  view.frame = self.view.bounds;
  view.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  view.contentMode = UIViewContentModeScaleAspectFill;
  return view;
}
//动画结束时被调用，重新将动画置为有效
- (void)animationDidStop {
  [UIView setAnimationsEnabled:YES];
}

@end
