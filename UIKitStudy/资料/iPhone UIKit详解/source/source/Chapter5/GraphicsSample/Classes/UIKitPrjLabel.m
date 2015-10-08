//
//  UIKitPrjLabel.m
//
//  Created by wang on 2011-09-24.
//

#import "UIKitPrjLabel.h"

@implementation UIKitPrjLabel

- (void)viewDidLoad {
  [super viewDidLoad];

  UILabel* label = [[[UILabel alloc] init] autorelease];
  // 将标签的大小设置成与画面相同的尺寸
  label.frame = self.view.bounds;
  // 设置画面与标签的自动调整属性
  label.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label.textAlignment = UITextAlignmentCenter;
  label.text = @"再次使用标签。";
  label.backgroundColor = [UIColor whiteColor];
  label.textColor = [UIColor blackColor];
  [self.view addSubview:label];
}

@end
