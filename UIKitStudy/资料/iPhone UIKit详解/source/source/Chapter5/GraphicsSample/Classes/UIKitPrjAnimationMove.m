//
//  UIKitPrjAnimationMove.m
//
//  Created by wang on 2011-09-24.
//

#import "UIKitPrjAnimationMove.h"

@implementation UIKitPrjAnimationMove

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
  star_.center = CGPointMake( -100, -100 ); //< 图片开始的位置

  [UIView beginAnimations:nil context:NULL]; //< 动画开始
  [UIView setAnimationDuration:1.0]; //< １次动画时间设置为1.0秒
  star_.center = CGPointMake( 420, 400 ); //< 图片移动终点位置
  [UIView commitAnimations]; //< 动画结束
}

@end
