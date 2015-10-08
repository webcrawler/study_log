//
//  UIKitPrjChangeWidthAndHeight.m
//
//  Created by wang on 2011-10-03.
//

#import "UIKitPrjChangeWidthAndHeight.h"

@implementation UIKitPrjChangeWidthAndHeight

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIPickerView* picker = [[[UIPickerView alloc] init] autorelease];
  picker.delegate = self;
  [self.view addSubview:picker];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView {
  return 2;
}

- (NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component {
  return 10;
}

- (NSString*)pickerView:(UIPickerView*)pickerView
  titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
  if ( 0 == component ) {
    // 第1列
    return [NSString stringWithFormat:@"%2d", row+1];
  } else {
    // 第2列
    return [NSString stringWithFormat:@"比较长的字符串 其中%d", row+1];
  }
}


- (CGFloat)pickerView:(UIPickerView*)pickerView widthForComponent:(NSInteger)component {
  if ( 0 == component ) {
    // 第1列变窄
    return 50;
  } else {
    // 第2列变快
    return 250;
  }
}

- (CGFloat)pickerView:(UIPickerView*)pickerView rowHeightForComponent:(NSInteger)component {
  if ( 0 == component ) {
    // 第1列变短
    return 30;
  } else {
    // 第2列变长
    return 60;
  }
}


@end
