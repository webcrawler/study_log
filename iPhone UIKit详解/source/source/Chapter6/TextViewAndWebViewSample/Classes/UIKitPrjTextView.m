//
//  UIKitPrjTextView.m
//
//  Created by wang on 2011-09-21.
//

#import "UIKitPrjTextView.h"

@implementation UIKitPrjTextView

- (void)viewDidLoad {
  [super viewDidLoad];

  UITextView* textView = [[[UITextView alloc] init] autorelease];
  textView.frame = self.view.bounds;
  textView.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  //textView.editable = NO; //< 不可编辑

  textView.backgroundColor = [UIColor blackColor]; //< 背景为黑色
  textView.textColor = [UIColor whiteColor]; //< 字符为白色
  textView.font = [UIFont systemFontOfSize:32]; //< 字体的设置
  textView.text = @"Hello, UITextView!\n"
                   "2行目\n"
                   "3行目\n"
                   "4行目\n"
                   "5行目\n"
                   "6行目\n"
                   "7行目\n"
                   "8行目\n"
                   "9行目\n"
                   "10行目\n"
                   "11行目\n"
                   "12行目\n";

  [self.view addSubview:textView];
}

@end
