//
//  UIKitPrjSlider.m
//
//  Created by wang on 2011-08-30.
//

#import "UIKitPrjSlider.h"

@implementation UIKitPrjSlider

// 对象释放方法
- (void)dealloc {
  [sliderCopy_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"UISlider";
  self.view.backgroundColor = [UIColor whiteColor];

  // 创建滑块控件
  UISlider* slider = [[[UISlider alloc] init] autorelease];
  slider.frame = CGRectMake( 0, 0, 200, 50 );
  slider.minimumValue = 0.0; //< 设置滑块最小值
  slider.maximumValue = 1.0; //< 设置滑块最大值
  slider.center = self.view.center;

  // 指定滑块变化时被调用的方法
  [slider addTarget:self
             action:@selector(sliderDidChange:)
   forControlEvents:UIControlEventValueChanged];

  // 拷贝滑块
  sliderCopy_ = [[UISlider alloc] init];
  sliderCopy_.frame = slider.frame;
  sliderCopy_.minimumValue = slider.minimumValue;
  sliderCopy_.maximumValue = slider.maximumValue;
  CGPoint point = slider.center;
  point.y += 50;
  sliderCopy_.center = point;

  // 在画面中追加两个滑块
  [self.view addSubview:slider];
  [self.view addSubview:sliderCopy_];
}

// 滑块变化时调用
- (void)sliderDidChange:(id)sender {
  if ( [sender isKindOfClass:[UISlider class]] ) {
    UISlider* slider = sender;
    // 将sliderCopy_的值保持与slider相同
    sliderCopy_.value = slider.value;
  } 
}

@end
