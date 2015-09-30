//
//  UIKitPrjSecureTextEntry.m
//
//  Created by wang on 2011-09-21.
//

#import "UIKitPrjSecureTextEntry.h"

@implementation UIKitPrjSecureTextEntry

- (void)dealloc {
  [textField_ release];  
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // UITextField的追加
  textField_ = [[UITextField alloc] init];
  textField_.frame = self.view.bounds;
  textField_.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  textField_.backgroundColor = [UIColor whiteColor];
  textField_.text = @"password";
  textField_.secureTextEntry = YES;
  [self.view addSubview:textField_];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [textField_ becomeFirstResponder]; //< 画面显示时的键盘显示
}

@end
