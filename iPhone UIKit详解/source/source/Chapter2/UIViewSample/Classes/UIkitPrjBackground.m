//
//  UIKitPrjBackground.m
//
//  Created by wang on 2011-08-05.
//

#import "UIKitPrjBackground.h"

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjBackground ()
- (void)redDidPush;
- (void)greenDidPush;
- (void)blueDidPush;
- (void)changeLabelColor:(CGFloat*)pColor;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjBackground

// finalize
- (void)dealloc {
  [label_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];

  // 画面上方追加标签
  label_ = [[UILabel alloc] initWithFrame:CGRectMake( 0, 0, 320, 200 )];
  label_.textAlignment = UITextAlignmentCenter;
  redColor_ = 0.0;
  greenColor_ = 0.0;
  blueColor_ = 0.0;
  label_.backgroundColor = [[[UIColor alloc] initWithRed:redColor_
                                                   green:greenColor_
                                                    blue:blueColor_
                                                   alpha:1.0] autorelease];
  label_.textColor = [UIColor whiteColor];
  label_.text = @"染上新的颜色・・・";

  [self.view addSubview:label_];

  // 追加红色按钮
  UIButton* redButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  redButton.frame = CGRectMake( 0, 0, 50, 40 );
  CGPoint newPoint = self.view.center;
  newPoint.x -= 50;
  newPoint.y = self.view.frame.size.height - 70;
  redButton.center = newPoint;
  [redButton setTitle:@"红" forState:UIControlStateNormal];
  [redButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
  [redButton addTarget:self
                action:@selector(redDidPush)
      forControlEvents:UIControlEventTouchUpInside];

  // 追加绿色按钮
  UIButton* greenButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  greenButton.frame = redButton.frame;
  newPoint.x += 50;
  greenButton.center = newPoint;
  [greenButton setTitle:@"绿" forState:UIControlStateNormal];
  [greenButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
  [greenButton addTarget:self
                action:@selector(greenDidPush)
      forControlEvents:UIControlEventTouchUpInside];

  // 追加蓝色按钮
  UIButton* blueButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  blueButton.frame = redButton.frame;
  newPoint.x += 50;
  blueButton.center = newPoint;
  [blueButton setTitle:@"蓝" forState:UIControlStateNormal];
  [blueButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
  [blueButton addTarget:self
                action:@selector(blueDidPush)
      forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:redButton];
  [self.view addSubview:greenButton];
  [self.view addSubview:blueButton];
}

#pragma mark ----- Private Methods -----

- (void)redDidPush {
  [self changeLabelColor:&redColor_];
}

- (void)greenDidPush {
  [self changeLabelColor:&greenColor_];
}

- (void)blueDidPush {
  [self changeLabelColor:&blueColor_];
}

- (void)changeLabelColor:(CGFloat*)pColor {
  if ( !pColor ) return;

  // 对指定色以0.1为单位递增
  // 1.0时回复为0.0
  if ( *pColor > 0.99 ) {
    *pColor = 0.0;
  } else {
    *pColor += 0.1;
  }
  // 更新标签的颜色
  label_.backgroundColor = [[[UIColor alloc] initWithRed:redColor_
                                                   green:greenColor_
                                                    blue:blueColor_
                                                   alpha:1.0] autorelease];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
