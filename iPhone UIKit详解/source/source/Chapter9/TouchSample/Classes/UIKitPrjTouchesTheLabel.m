//
//  UIKitPrjTouchesTheLabel.m
//
//  Created by wang on 2011-08-30.
//

#import "UIKitPrjTouchesTheLabel.h"

#pragma mark ----- TouchableLabel -----

// 定义UILabel的子类
@interface TouchableLabel : UILabel
@end 

// 只追加touchesBegan:withEvent:方法
@implementation TouchableLabel

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                   message:@"I'm a label!"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil] autorelease];
  [alert show];
}

@end 

#pragma mark ----- UIKitPrjTouchesTheLabel -----

@implementation UIKitPrjTouchesTheLabel

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor whiteColor];

  // 将新创建的标签布置在画面上
  TouchableLabel* label = [[[TouchableLabel alloc] init] autorelease];
  label.frame = CGRectMake( 60, 100, 200, 50 );
  label.text = @"Touch me!";
  label.textAlignment = UITextAlignmentCenter;
  label.backgroundColor = [UIColor grayColor];
  // 必须将userInteractionEnabled属性设置成YES，默认为NO
  label.userInteractionEnabled = YES;
  [self.view addSubview:label];
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                   message:@"I'm a viewController!"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil] autorelease];
  [alert show];
}

@end
