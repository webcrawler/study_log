//
//  UIKitPrjAlpha.m
//
//  Created by wang on 2011-08-05.
//

#import "UIKitPrjAlpha.h"

@implementation UIKitPrjAlpha

- (void)dealloc {
  [label_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // 背景设为白
  self.view.backgroundColor = [UIColor whiteColor];

  // 追加画面上方的标签
  label_ = [[UILabel alloc] initWithFrame:CGRectMake( 0, 0, 320, 200 )];
  label_.textAlignment = UITextAlignmentCenter;
  label_.backgroundColor = [UIColor redColor];
  label_.textColor = [UIColor whiteColor];
  label_.adjustsFontSizeToFitWidth = YES;
  label_.text = @"将白色文字背景设为红";

  [self.view addSubview:label_];

  // 追加染色按钮
  UIButton* alphaButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  alphaButton.frame = CGRectMake( 0, 0, 100, 40 );
  CGPoint newPoint = self.view.center;
  newPoint.y = self.view.frame.size.height - 70;
  alphaButton.center = newPoint;
  [alphaButton setTitle:@"透明化" forState:UIControlStateNormal];
  [alphaButton addTarget:self
                action:@selector(alphaDidPush)
      forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:alphaButton];
}

- (void)alphaDidPush {
  // 标签的alpha值以0.1为单位递减
  // 0.0时恢复为1.0
  if ( label_.alpha < 0.09 ) {
    label_.alpha = 1.0;
  } else {
    label_.alpha -= 0.1; 
  }
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
