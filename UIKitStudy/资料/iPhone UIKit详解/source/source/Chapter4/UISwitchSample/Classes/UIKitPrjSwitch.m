//
//  UIKitPrjSwitch.m
//
//  Created by wang on 2011-10-01.
//

#import "UIKitPrjSwitch.h"

@implementation UIKitPrjSwitch

- (void)dealloc {
  [switch1_ release];
  [switch2_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  //UISwitch对象的创建与初始化
  switch1_ = [[UISwitch alloc] init];
  switch1_.center = CGPointMake( 100, 50 );
  //默认设置为ON
  switch1_.on = YES;
  //开关变化时，调用switchDidChange方法
  [switch1_ addTarget:self
               action:@selector(switchDidChange)
     forControlEvents:UIControlEventValueChanged];
  [self.view addSubview:switch1_];
  //创建第二个UISwitch对象
  switch2_ = [[UISwitch alloc] init];
  switch2_.center = CGPointMake( 100, 100 );
  //默认设置为OFF
  switch2_.on = NO;
  [self.view addSubview:switch2_];
}

- (void)switchDidChange {
  //switch1_ 变化后switch2_也一起改变 
  [switch2_ setOn:!switch2_.on animated:YES];
}

@end
