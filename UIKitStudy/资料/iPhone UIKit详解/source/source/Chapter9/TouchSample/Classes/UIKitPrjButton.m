//
//  UIKitPrjButton.m
//
//  Created by wang on 2011-08-15.
//

#import "UIKitPrjButton.h"

@implementation UIKitPrjButton

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"UIButton";
  self.view.backgroundColor = [UIColor whiteColor];

  // 创建按钮
  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  // 设置按钮标题
  [button setTitle:@"Touch me!" forState:UIControlStateNormal];
  // 根据标题长度自动决定按钮尺寸
  [button sizeToFit];
  // 将按钮布置在中心位置
  button.center = self.view.center;
  // 画面变化时按钮位置自动调整
  button.autoresizingMask = UIViewAutoresizingFlexibleWidth |
                            UIViewAutoresizingFlexibleHeight |
                            UIViewAutoresizingFlexibleLeftMargin |
                            UIViewAutoresizingFlexibleRightMargin |
                            UIViewAutoresizingFlexibleTopMargin |
                            UIViewAutoresizingFlexibleBottomMargin;

  // 设置按钮被触摸时响应方法
  [button addTarget:self
             action:@selector(buttonDidPush:)
   forControlEvents:UIControlEventTouchUpInside];

  // 将按钮追加到画面view中
  [self.view addSubview:button];
}

// 按钮被触碰时调用的方法
- (void)buttonDidPush:(id)sender {
  if ( [sender isKindOfClass:[UIButton class]] ) {
    UIButton* button = sender;
    UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                     message:button.currentTitle
                                                    delegate:nil
                                           cancelButtonTitle:nil
                                           otherButtonTitles:@"OK", nil] autorelease];
    [alert show];
  } 
}

@end
