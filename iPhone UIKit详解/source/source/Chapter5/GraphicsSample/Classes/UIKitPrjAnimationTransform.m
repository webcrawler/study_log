//
//  UIKitPrjAnimationTransform.m
//
//  Created by wang on 2011-09-24.
//

#import "UIKitPrjAnimationTransform.h"

@implementation UIKitPrjAnimationTransform

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


#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  star_.center = CGPointMake( self.view.center.x, -100 ); //< 图片开始的位置
  star_.alpha = 1.0; //< 开始时的alpha值
  star_.transform = CGAffineTransformIdentity; //< 初始化transform

  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationRepeatAutoreverses:YES]; //< 设置reverse（反转）
  [UIView setAnimationDuration:2.0]; //< 将一次动画持续时间设置为2.0秒
  [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
  star_.center = CGPointMake( self.view.center.x, 300 ); //< 图片移动终点位置
  star_.alpha = 0.0; //< 结束时的alpha值

  // 下面混合了扩大与旋转
  CGAffineTransform transformScale = CGAffineTransformScale( CGAffineTransformIdentity, 5, 5 );
  CGAffineTransform transformRotate = CGAffineTransformRotate( CGAffineTransformIdentity, M_PI );
  star_.transform = CGAffineTransformConcat( transformScale, transformRotate );
  [UIView commitAnimations];
}

@end
