//
//  UIKitPrjSetDate.m
//
//  Created by wang on 2011-10-03.
//

#import "UIKitPrjSetDate.h"

@implementation UIKitPrjSetDate

- (void)dealloc {
  [datePicker_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  datePicker_ = [[UIDatePicker alloc] init];
  datePicker_.date = [NSDate dateWithTimeIntervalSinceNow:-1*60*60*24*1];
  [self.view addSubview:datePicker_];

  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"返回至今日" forState:UIControlStateNormal];
  [button sizeToFit];
  CGPoint newPoint = self.view.center;
  newPoint.y += 50;
  button.center = newPoint;
  [button addTarget:self
                  action:@selector(buttonDidPush)
        forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];
}

- (void)buttonDidPush {
  [datePicker_ setDate:[NSDate date]]; 
}

@end
