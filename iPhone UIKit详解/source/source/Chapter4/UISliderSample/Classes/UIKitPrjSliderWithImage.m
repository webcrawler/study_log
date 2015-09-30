//
//  UIKitPrjSliderWithImage.m
//
//  Created by wang on 2011-10-01.
//

#import "UIKitPrjSliderWithImage.h"

@implementation UIKitPrjSliderWithImage

- (void)dealloc {
  [label_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  //追加标签，将通过滑块控制标签文字大小
  label_ = [[UILabel alloc] init];
  label_.frame = self.view.bounds;
  label_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label_.text = @"标题";
  label_.font = [UIFont boldSystemFontOfSize:48];
  label_.textAlignment = UITextAlignmentCenter;
  [self.view addSubview:label_];
  //创建并初始化滑块对象
  UISlider* slider = [[[UISlider alloc] init] autorelease];
  slider.frame = CGRectMake( 0, 0, 250, 50 );
  slider.minimumValue = 0.0;
  slider.maximumValue = 1.0;
  slider.value = 0.5; //< 初期値的设置
  slider.center = self.view.center;
  //读入左侧及右侧用的图标图片，并设置到minimumValueImage及maximumValueImage属性中
  UIImage* imageForMin = [UIImage imageNamed:@"roope_small.png"];
  UIImage* imageForMax = [UIImage imageNamed:@"roope_big.png"];
  slider.minimumValueImage = imageForMin;
  slider.maximumValueImage = imageForMax;

  [self.view addSubview:slider];
  //注册滑块变化时的响应方法
  [slider addTarget:self
             action:@selector(sliderDidChange:)
   forControlEvents:UIControlEventValueChanged];
}
//滑块变化时的响应方法，其中设置标签的文字字体
- (void)sliderDidChange:(id)sender {
  if ( [sender isKindOfClass:[UISlider class]] ) {
    UISlider* slider = sender;
    label_.font = [UIFont boldSystemFontOfSize:( 96 * slider.value )];
  } 
}

@end
