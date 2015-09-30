//
//  UIKitPrjResponderChain.m
//
//  Created by wang on 2011-08-30.
//

#import "UIKitPrjResponderChain.h"

#pragma mark ----- TouchableLabelForResponder -----

@interface TouchableLabelForResponder : UILabel
@end 

@implementation TouchableLabelForResponder

// 重写init方法
- (id)init {
  if ( (self = [super init]) ) {
    // 将userInteractionEnabled设置成YES
    self.userInteractionEnabled = YES; 
    // 设置自动调整，以免充分设置
    self.autoresizingMask =  UIViewAutoresizingFlexibleWidth |
                             UIViewAutoresizingFlexibleHeight |
                             UIViewAutoresizingFlexibleLeftMargin |
                             UIViewAutoresizingFlexibleRightMargin |
                             UIViewAutoresizingFlexibleTopMargin |
                             UIViewAutoresizingFlexibleBottomMargin;
  }
  return self;
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  // 检测到触摸后，首先将标签标题输出到日志中
  NSLog( @"%@", self.text );
  // 但是，事件直接传导到下一个响应控件
  [self.nextResponder touchesBegan:touches withEvent:event];
}

@end 

#pragma mark ----- UIKitPrjResponderChain -----

@implementation UIKitPrjResponderChain

- (void)viewDidLoad {
  [super viewDidLoad];

  // 首先将三个标签中最里层父标签追加到画面view中
  TouchableLabelForResponder* grandFather = [[[TouchableLabelForResponder alloc] init] autorelease];
  grandFather.frame = CGRectInset( self.view.bounds, 40, 20 );
  grandFather.text = @"A";
  grandFather.backgroundColor = [UIColor darkGrayColor];
  [self.view addSubview:grandFather];

  // 将第２个标签追加到上述第1个标签上
  TouchableLabelForResponder* father = [[[TouchableLabelForResponder alloc] init] autorelease];
  father.frame = CGRectInset( grandFather.bounds, 40, 20 );
  father.text = @"B";
  father.backgroundColor = [UIColor grayColor];
  [grandFather addSubview:father];

  // 将第3个标签追加到上述第2个标签上
  // 完成3层标签创建
  TouchableLabelForResponder* me = [[[TouchableLabelForResponder alloc] init] autorelease];
  me.frame = CGRectInset( father.bounds, 40, 20 );
  me.text = @"C";
  me.backgroundColor = [UIColor whiteColor];
  [father addSubview:me];
}

// 任何标签都没有处理触摸事件的话，将调用此方法
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                   message:@"I'm a viewController!"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil] autorelease];
  [alert show];
}

@end
