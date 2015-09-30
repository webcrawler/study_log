//
//  UIKitPrjPlaceholder.m
//
//  Created by wang on 2011-10-01.
//

#import "UIKitPrjPlaceholder.h"

@implementation UIKitPrjPlaceholder

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  UITextField* textField = [[[UITextField alloc] init] autorelease];
  textField.frame = CGRectMake( 20, 100, 280, 30 );
  textField.borderStyle = UITextBorderStyleRoundedRect;
  textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
  textField.placeholder = @"请输入信息";
  [self.view addSubview:textField];
}

@end
