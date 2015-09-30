//
//  UIKitPrjSubviews.m
//
//  Created by wang on 2011-08-05.
//

#import "UIKitPrjSubviews.h"

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjSubviews ()
- (void)button11DidPush:(id)sender;
- (void)button111DidPush:(id)sender;
- (void)button112DidPush:(id)sender;
- (void)button1121DidPush:(id)sender;
- (void)button1122DidPush:(id)sender;
- (void)alertMessage:(UIButton*)button;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjSubviews

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];

  // 追加1-1按钮
  UIButton* button11 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button11.frame = CGRectMake( 10, 10, 300, 300 );
  [button11 setTitle:@"1-1" forState:UIControlStateNormal];
  [button11 addTarget:self
               action:@selector(button11DidPush:)
      forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button11];

  // 追加1-1-1按钮
  UIButton* button111 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button111.frame = CGRectMake( 20, 20, 260, 100 );
  [button111 setTitle:@"1-1-1" forState:UIControlStateNormal];
  [button111 addTarget:self
                action:@selector(button111DidPush:)
      forControlEvents:UIControlEventTouchUpInside];
  [button11 addSubview:button111];

  // 追加1-1-2按钮
  UIButton* button112 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button112.frame = CGRectMake( 20, 180, 260, 100 );
  [button112 setTitle:@"1-1-2" forState:UIControlStateNormal];
  [button112 addTarget:self
                action:@selector(button112DidPush:)
      forControlEvents:UIControlEventTouchUpInside];
  [button11 addSubview:button112];

  // 追加1-1-2-1按钮
  UIButton* button1121 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button1121.frame = CGRectMake( 10, 10, 95, 80 );
  [button1121 setTitle:@"1-1-2-1" forState:UIControlStateNormal];
  [button1121 addTarget:self
                 action:@selector(button1121DidPush:)
      forControlEvents:UIControlEventTouchUpInside];
  [button112 addSubview:button1121];

  // 追加1-1-2-2按钮
  UIButton* button1122 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button1122.frame = CGRectMake( 155, 10, 95, 80 );
  [button1122 setTitle:@"1-1-2-2" forState:UIControlStateNormal];
  [button1122 addTarget:self
                 action:@selector(button1122DidPush:)
      forControlEvents:UIControlEventTouchUpInside];
  [button112 addSubview:button1122];
}

#pragma mark ----- Private Methods -----

- (void)button11DidPush:(id)sender {
  [self alertMessage:sender];
}

- (void)button111DidPush:(id)sender {
  [self alertMessage:sender];
}

- (void)button112DidPush:(id)sender {
  [self alertMessage:sender];
}

- (void)button1121DidPush:(id)sender {
  [self alertMessage:sender];
}

- (void)button1122DidPush:(id)sender {
  [self alertMessage:sender];
}

- (void)alertMessage:(UIButton*)button {
  //显示self的标题作为警告框的标题
  NSString* title = [NSString stringWithFormat:@"self = %@", button.titleLabel.text];
  //取得superview的标题
  //但是当superview非UIButton的情况下，以“UIViewController”替代
  NSString* superViewName;
  if ( [button.superview isKindOfClass:[UIButton class]] ) {
    superViewName = ((UIButton*)button.superview).titleLabel.text;
  } else {
    superViewName = @"UIViewController";
  }
  //取得subviews的标题
  NSMutableString* subviews = [[[NSMutableString alloc] initWithCapacity:64] autorelease];
  [subviews setString:@""];
  for ( id view in button.subviews ) {
    NSString* addString;
    if ( [view isKindOfClass:[UIButton class]] ) {
	  //如果子元素为UIButton时，取titleLabel的text属性值
      addString = ((UIButton*)view).titleLabel.text;
    } else if ( [view isKindOfClass:[UILabel class]] ) {
	  //如果为UILabel时取其text属性值
      addString = ((UILabel*)view).text;
    } else {
	  //上述以外的情况
      addString = [view description];
    }
    if ( [subviews length] > 0 ) {
      [subviews appendString:@", "];
    }
    [subviews appendString:addString];
  }
  NSString* message = [NSString stringWithFormat:@"superview = %@\r\nsubviews = %@", superViewName, subviews];

  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:title
                                                   message:message
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil ] autorelease];

  [alert show];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
