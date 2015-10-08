//
//  UIKitPrjAnimationRepeat.m
//
//  Created by wang on 2011-09-24.
//

#import "UIKitPrjAnimationRepeat.h"

@implementation UIKitPrjAnimationRepeat

- (void)dealloc {
  [star_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];

  UIImage* image = [UIImage imageNamed:@"star.png"];
  star_ = [[UIImageView alloc] initWithImage:image];
  star_.center = CGPointMake( -100, -100 );
  [self.view addSubview:star_];
}

#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  star_.center = CGPointMake( -100, -100 ); //< 图片开始位置

  [UIView beginAnimations:nil context:NULL]; //< 开始动画
  [UIView setAnimationDuration:1.0]; //< １次动画的持续时间设置为1.0秒
  [UIView setAnimationDelay:3.0]; //< 停顿3秒后动画开始
  [UIView setAnimationRepeatCount:10.0]; //< 动画重复10回
  star_.center = CGPointMake( 420, 400 ); //< 设置图片移动的终点位置
  [UIView commitAnimations]; //< 结束动画
}

@end
