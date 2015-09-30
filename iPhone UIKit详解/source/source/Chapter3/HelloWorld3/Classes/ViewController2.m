//
//  ViewController2.m
//
//  Created by Wang on 2011-10-15.
//

#import "ViewController2.h"

@implementation ViewController2

- (void)viewDidLoad {
  [super viewDidLoad];

  // 追加您好、世界！标签
  // 背景为黒色、文字为白色
  UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
  label.text = @"您好、世界！";
  label.textAlignment = UITextAlignmentCenter;
  label.backgroundColor = [UIColor blackColor];
  label.textColor = [UIColor whiteColor];
  label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:label];

  // 追加按钮
  // 点击按钮后画面跳转
  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"画面跳转" forState:UIControlStateNormal];
  [button sizeToFit];
  CGPoint newPoint = self.view.center;
  newPoint.y += 50;
  button.center = newPoint;
  button.autoresizingMask =
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
  [button addTarget:self
             action:@selector(buttonDidPush)
   forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];
}

- (void)buttonDidPush {
	// 自己移向背面
	// 结果是ViewController1显示在前
  [self.view.window sendSubviewToBack:self.view];
}

@end
