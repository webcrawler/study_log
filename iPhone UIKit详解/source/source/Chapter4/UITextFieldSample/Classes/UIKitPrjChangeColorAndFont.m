//
//  UIKitPrjChangeColorAndFont.m
//
//  Created by wang on 2011-10-01.
//

#import "UIKitPrjChangeColorAndFont.h"

@implementation UIKitPrjChangeColorAndFont

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  UITextField* textField = [[[UITextField alloc] init] autorelease];
  textField.frame = CGRectMake( 20, 100, 280, 50 );
  textField.borderStyle = UITextBorderStyleBezel;
  textField.backgroundColor = [UIColor blackColor];//设置背景色
  textField.textColor = [UIColor redColor];//设置文本颜色
  textField.textAlignment = UITextAlignmentCenter;
  textField.font = [UIFont systemFontOfSize:36];//设置字体大小
  textField.text = @"UITextFields";
  [self.view addSubview:textField];
}

@end
