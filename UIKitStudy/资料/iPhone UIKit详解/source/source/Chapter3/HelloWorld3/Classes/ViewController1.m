//
//  ViewController1.m
//
//  Created by Wang on 2011-10-15.
//

#import "ViewController1.h"

@implementation ViewController1

- (void)viewDidLoad {
  [super viewDidLoad];

  // 追加Hello, world!标签
  // 背景为白色、文字为黒色
  UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
  label.text = @"Hello, world!";
  label.textAlignment = UITextAlignmentCenter;
  label.backgroundColor = [UIColor whiteColor];
  label.textColor = [UIColor blackColor];
  label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:label];

  // 追加按钮
  // 点击按钮后跳转到其他画面
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
  // 结果是ViewController2显示在前
  [self.view.window sendSubviewToBack:self.view];
}

@end
