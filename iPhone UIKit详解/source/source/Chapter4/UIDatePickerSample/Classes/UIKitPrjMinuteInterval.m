//
//  UIKitPrjMinuteInterval.m
//
//  Created by wang on 2011-10-03.
//

#import "UIKitPrjMinuteInterval.h"

@implementation UIKitPrjMinuteInterval

- (void)viewDidLoad {
  [super viewDidLoad];

  UIDatePicker* datePicker = [[[UIDatePicker alloc] init] autorelease];
  datePicker.minuteInterval = 30;
  datePicker.minimumDate = [NSDate date];
  datePicker.maximumDate = [NSDate dateWithTimeIntervalSinceNow:60*60*24*31];
  [self.view addSubview:datePicker];
}

@end
