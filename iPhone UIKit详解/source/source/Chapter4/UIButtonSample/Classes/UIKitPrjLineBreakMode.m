//
//  UIKitPrjLineBreakMode.m
//
//  Created by wang on 2011-08-15.
//

#import "UIKitPrjLineBreakMode.h"

@implementation UIKitPrjLineBreakMode

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button.frame = CGRectMake( 80, 50, 160, 50 );
  [button setTitle:@"特地放入很长的字符串、超出按钮标题区域。" forState:UIControlStateNormal];
  button.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
  [self.view addSubview:button];
	
	UIButton* button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	button1.frame = CGRectMake( 80, 120, 150, 40 );
	[button1 setTitle:@"特地放入很长的字符串、超出按钮标题区域。" forState:UIControlStateNormal];
	//button1.titleLabel.lineBreakMode = UILineBreakMode;
	[self.view addSubview:button1];
}

@end
