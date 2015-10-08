//
//  UIKitPrjAnimationObserving.m
//
//  Created by wang on 2011-09-24.
//

#import "UIKitPrjAnimationObserving.h"

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjAnimationObserving ()
- (void)startAnimation;
- (void)animationDidStop:(NSString*)animationID finished:(NSNumber*)finished context:(void*)context;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjAnimationObserving

- (void)dealloc {
  [star_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];
  // UIImageView对象的初始化
  UIImage* image = [UIImage imageNamed:@"star.png"];
  star_ = [[UIImageView alloc] initWithImage:image];
  star_.center = CGPointMake( self.view.center.x, -100 );
  [self.view addSubview:star_];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self startAnimation]; //< 画面显示时开始动画
}

#pragma mark ----- Private Methods -----

- (void)startAnimation {

  star_.center = CGPointMake( self.view.center.x, -100 ); //< 图片开始的位置
  star_.transform = CGAffineTransformIdentity; //< 初始化transform

  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationDelegate:self]; //< 将委托设置为自己（当前类）
  [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
  [UIView setAnimationDuration:2.0]; //< 将一次动画持续时间设置为2.0秒
  [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
  star_.center = CGPointMake( self.view.center.x, 300 ); //< 图片移动终点位置
  CGAffineTransform transformScale = CGAffineTransformScale( CGAffineTransformIdentity, 5, 5 );
  CGAffineTransform transformRotate = CGAffineTransformRotate( CGAffineTransformIdentity, M_PI );
  star_.transform = CGAffineTransformConcat( transformScale, transformRotate );
  [UIView commitAnimations];
}

- (void)animationDidStop:(NSString*)animationID finished:(NSNumber*)finished context:(void*)context {
  // 如果动画正常结束时（非强制取消）、再次开始动画
  if ( [finished boolValue] ) {
    [self startAnimation];
  } 
}

@end
