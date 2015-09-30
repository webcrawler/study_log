//
//  UIKitPrjPickerView.m
//
//  Created by wang on 2011-10-03.
//

#import "UIKitPrjPickerView.h"

@implementation UIKitPrjPickerView

- (void)viewDidLoad {
  [super viewDidLoad];
  //UIPickerView的创建与初始化
  UIPickerView* picker = [[[UIPickerView alloc] init] autorelease];
  picker.delegate = self;//将delegate设置成自己
  picker.dataSource = self;//将dataSource也设置为自己
  [self.view addSubview:picker];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView {
  return 3;//选择列数为3列
}

- (NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component {
  return 10;//各列的拥有10行
}

- (NSString*)pickerView:(UIPickerView*)pickerView
  titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
  //显示各选项的内容
  return [NSString stringWithFormat:@"%d-%d", row, component];
}

@end
