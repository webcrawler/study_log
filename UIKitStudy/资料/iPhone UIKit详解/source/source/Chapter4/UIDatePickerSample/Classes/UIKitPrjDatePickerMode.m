//
//  UIKitPrjDatePickerMode.m
//
//  Created by wang on 2011-10-03.
//

#import "UIKitPrjDatePickerMode.h"

@implementation UIKitPrjDatePickerMode

- (void)dealloc {
  [datePicker_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  datePicker_ = [[UIDatePicker alloc] init];
  datePicker_.datePickerMode = UIDatePickerModeCountDownTimer;
  [self.view addSubview:datePicker_];

  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"模式切换" forState:UIControlStateNormal];
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
  if ( UIDatePickerModeCountDownTimer < ++datePicker_.datePickerMode ) {
    datePicker_.datePickerMode = UIDatePickerModeTime;
  } 
}

@end
