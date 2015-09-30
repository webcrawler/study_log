//
//  UIKitPrjAdjustFontSize.m
//
//  Created by wang on 2011-10-01.
//

#import "UIKitPrjAdjustFontSize.h"

@implementation UIKitPrjAdjustFontSize

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  UITextField* textField1 = [[[UITextField alloc] init] autorelease];
  textField1.delegate = self;
  textField1.frame = CGRectMake( 20, 50, 280, 50 );
  textField1.borderStyle = UITextBorderStyleRoundedRect;
  textField1.text = @"字体尺寸调整";
  textField1.adjustsFontSizeToFitWidth = YES;
  textField1.font = [UIFont systemFontOfSize:48];
  textField1.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
  [self.view addSubview:textField1];
}

- (BOOL)textFieldShouldReturn:(UITextField*)textField {
  if ( [textField canResignFirstResponder] ) {
    [textField resignFirstResponder];
  } 
  return YES;
}

@end
