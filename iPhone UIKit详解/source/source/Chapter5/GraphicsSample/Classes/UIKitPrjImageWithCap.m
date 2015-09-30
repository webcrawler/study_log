//
//  UIKitPrjImageWithCap.m
//
//  Created by wang on 2011-09-24.
//

#import "UIKitPrjImageWithCap.h"

@implementation UIKitPrjImageWithCap

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  // 读入红色圆圈的图片
  UIImage* image = [UIImage imageNamed:@"circle.png"];
  // 限制伸缩区域创建标题用的图片
  UIImage* imageWithCap = [image stretchableImageWithLeftCapWidth:30 topCapHeight:30];
  
  // 没有获取的图片作为按钮的背景
  UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
  [button setBackgroundImage:image forState:UIControlStateNormal];
  [button setTitle:@"长UIButton 无标题版" forState:UIControlStateNormal];
  [button sizeToFit];
  button.center = CGPointMake( 160, 50 );
  [self.view addSubview:button];

  // 将以キャップ图片作为背景的按钮贴在UIView的画像を背景にしたボタンを画面に貼り付ける
  UIButton* buttonWithCap = [UIButton buttonWithType:UIButtonTypeCustom];
  [buttonWithCap setBackgroundImage:imageWithCap forState:UIControlStateNormal];
  [buttonWithCap setTitle:@"长UIButton 有标题版" forState:UIControlStateNormal];
  [buttonWithCap sizeToFit];
  buttonWithCap.center = CGPointMake( 160, 150 );
  [self.view addSubview:buttonWithCap];
}

@end
