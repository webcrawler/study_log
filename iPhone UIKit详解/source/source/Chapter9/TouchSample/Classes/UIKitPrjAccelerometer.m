//
//  UIKitPrjAccelerometer.m
//
//  Created by wang on 2011-08-30.
//

#import "UIKitPrjAccelerometer.h"

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjAccelerometer ()
- (CGFloat)lowpassFilter:(CGFloat)accel before:(CGFloat)before;
- (CGFloat)highpassFilter:(CGFloat)accel before:(CGFloat)before;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjAccelerometer

- (void)dealloc {
  [imageView_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor whiteColor];

  // 追加球体的UIImageView
  UIImage* image = [UIImage imageNamed:@"metal.png"];
  imageView_ = [[UIImageView alloc] initWithImage:image];
  imageView_.center = self.view.center;
  imageView_.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                                UIViewAutoresizingFlexibleRightMargin |
                                UIViewAutoresizingFlexibleTopMargin |
                                UIViewAutoresizingFlexibleBottomMargin;
  [self.view addSubview:imageView_];
}

- (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
  // 开始获取加速度传感器传过来的值
  UIAccelerometer* accelerometer = [UIAccelerometer sharedAccelerometer];
  accelerometer.updateInterval = 1.0 / 60.0; //< 60Hz
  accelerometer.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  speedX_ = speedY_ = 0.0;
  // 结束从加速度传感器获取值
  UIAccelerometer* accelerometer = [UIAccelerometer sharedAccelerometer];
  accelerometer.delegate = nil;
}

// 处理从加速度传感器来的通知
- (void)accelerometer:(UIAccelerometer*)accelerometer
  didAccelerate:(UIAcceleration*)acceleration
{
  speedX_ += acceleration.x;//在x轴方向速度上附加x轴方向加速度
  speedY_ += acceleration.y;//在y轴方向速度上附加y轴方向加速度
  CGFloat posX = imageView_.center.x + speedX_;//根据速度调整球体位置坐标
  CGFloat posY = imageView_.center.y - speedY_;//根据速度调整球体位置坐标
  // 碰到边框后反弹的处理
  if ( posX < 0.0 ) {
    posX = 0.0;
    speedX_ *= -0.4; //< 碰到左边的边框后以0.4倍的速度反弹
  } else if ( posX > self.view.bounds.size.width ) {
    posX = self.view.bounds.size.width;
    speedX_ *= -0.4; //< 碰到右边的边框后以0.4倍的速度反弹
  }
  if ( posY < 0.0 ) {
    posY = 0.0;
    speedY_ = 0.0; //< 碰到上边的边框不反弹
  } else if ( posY > self.view.bounds.size.height ) {
    posY = self.view.bounds.size.height;
    speedY_ *= -1.5; //< 碰到下边的边框1.5倍的速度反弹
  }
  imageView_.center = CGPointMake( posX, posY );
}

// 低通滤波器
- (CGFloat)lowpassFilter:(CGFloat)accel before:(CGFloat)before {
  static const CGFloat kFilteringFactor = 0.1; //< 常量
  return ( accel * kFilteringFactor ) + ( before * ( 1.0 - kFilteringFactor ) );
}

// 高通滤波器
- (CGFloat)highpassFilter:(CGFloat)accel before:(CGFloat)before {
  return accel - [self lowpassFilter:accel before:before];
}

@end
