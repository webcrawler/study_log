//
//  UIKitPrjSetThumbImage.m
//
//  Created by wang on 2011-10-01.
//

#import "UIKitPrjSetThumbImage.h"

@implementation UIKitPrjSetThumbImage

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  //创建并初始化滑块对象
  UISlider* slider = [[[UISlider alloc] init] autorelease];
  slider.frame = CGRectMake( 0, 0, 250, 50 );
  slider.minimumValue = 0.0;
  slider.maximumValue = 1.0;
  slider.value = 0.5; //< 设置初期值
  slider.center = self.view.center;

  UIImage* imageForThumb = [UIImage imageNamed:@"thumb.png"];
  UIImage* imageMinBase = [UIImage imageNamed:@"left.png"];
  UIImage* imageForMin = [imageMinBase stretchableImageWithLeftCapWidth:4 topCapHeight:0];
  UIImage* imageMaxBase = [UIImage imageNamed:@"right.png"];
  UIImage* imageForMax = [imageMaxBase stretchableImageWithLeftCapWidth:4 topCapHeight:0];
  [slider setThumbImage:imageForThumb forState:UIControlStateNormal];
  [slider setThumbImage:imageForThumb forState:UIControlStateHighlighted];
  [slider setMinimumTrackImage:imageForMin forState:UIControlStateNormal];
  [slider setMaximumTrackImage:imageForMax forState:UIControlStateNormal];

  [self.view addSubview:slider];
}

@end
