//
//  UIKitPrjAnimationCurve.m
//
//  Created by wang on 2011-09-24.
//

#import "UIKitPrjAnimationCurve.h"

@implementation UIKitPrjAnimationCurve

- (void)dealloc {
  [star_ release];
  [label_ release];
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
  // 标签的创建与初始化
  label_ = [[UILabel alloc] init];
  label_.frame = CGRectMake( 0, self.view.bounds.size.height - 20, 320, 20 );
  label_.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
                            UIViewAutoresizingFlexibleBottomMargin;
  label_.textAlignment = UITextAlignmentCenter;
  label_.text = @"UIViewAnimationCurveEaseInOut";
  [self.view addSubview:label_];
}

#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  static UIViewAnimationCurve animationCurve = UIViewAnimationCurveEaseInOut;

  star_.center = CGPointMake( self.view.center.x, -100 ); //< 图片开始的位置
  star_.alpha = 1.0; //< 开始时的alpha值

  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationCurve:animationCurve]; //< 动画弧的设置
  [UIView setAnimationDuration:10.0]; //< 将一次动画持续时间设置为2.0秒
  star_.center = CGPointMake( self.view.center.x, 300 ); //< 图片移动终点位置
  star_.alpha = 0.0; //< 结束时的alpha值
  [UIView commitAnimations];

  //在标签中显示当前的动画弧 
  switch ( animationCurve ) {
    case UIViewAnimationCurveEaseInOut:
      label_.text = @"UIViewAnimationCurveEaseInOut";
      break;
    case UIViewAnimationCurveEaseIn:
      label_.text = @"UIViewAnimationCurveEaseIn";
      break;
    case UIViewAnimationCurveEaseOut:
      label_.text = @"UIViewAnimationCurveEaseOut";
      break;
    case UIViewAnimationCurveLinear:
      label_.text = @"UIViewAnimationCurveLinear";
      break;
    default:
      label_.text = @"-";
      break;
  }

  // 动画弧的修改
  if ( UIViewAnimationCurveLinear < ++animationCurve ) {
    animationCurve = UIViewAnimationCurveEaseInOut;
  } 
}

@end
