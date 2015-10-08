//
//  UIKitPrjTextViewObserving.m
//
//  Created by wang on 2011-09-21.
//

#import "UIKitPrjTextViewObserving.h"

@implementation UIKitPrjTextViewObserving

- (void)dealloc {
  [textView_ release];  
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // UITextView的追加
  textView_ = [[UITextView alloc] init];
  textView_.frame = self.view.bounds;
  textView_.delegate = self;
  textView_.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  textView_.text = @"此文本可编辑。";
  [self.view addSubview:textView_];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self textViewDidEndEditing:textView_]; //< 画面显示时设置成非编辑模式
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  [textView_ resignFirstResponder]; //< 画面跳转时为非编辑模式
}

- (BOOL)textView:(UITextView*)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text {
  NSLog( @"shouldChangeTextInRange %@", text );
  if ( [text isEqualToString:@"a"] ) {
    return NO; //< 不可只输入a 字符
  } 
  return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView*)textView {
  NSLog( @"textViewShouldBeginEditing" );
  return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView*)textView {
  NSLog( @"textViewShouldEndEditing" );
  return YES;
}

- (void)textViewDidChangeSelection:(UITextView*)textView {
  NSLog( @"textViewDidChangeSelection" );
}

- (void)textViewDidChange:(UITextView*)textView {
  NSLog( @"textViewDidChange" );
}

- (void)textViewDidBeginEditing:(UITextView*)textView {
  NSLog( @"textViewDidBeginEditing" );
  static const CGFloat kKeyboardHeight = 216.0;

  // 将按钮设置成［编辑］
  self.navigationItem.rightBarButtonItem =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                   target:self
                                                   action:@selector(doneDidPush)] autorelease];
  [UIView beginAnimations:nil context:nil];
  [UIView setAnimationDuration:0.3];
  // 缩小UITextView不让键盘挡住
  CGRect textViewFrame = textView.frame;
  textViewFrame.size.height = self.view.bounds.size.height - kKeyboardHeight;
  textView.frame = textViewFrame;
  // 工具条的位置也上移
  CGRect toolbarFrame = self.navigationController.toolbar.frame;
  toolbarFrame.origin.y =
    self.view.window.bounds.size.height - toolbarFrame.size.height - kKeyboardHeight;
  self.navigationController.toolbar.frame = toolbarFrame;
  [UIView commitAnimations];
}

- (void)textViewDidEndEditing:(UITextView*)textView {
  NSLog( @"textViewDidEndEditing" );

  // 按钮设置成［完成］
  self.navigationItem.rightBarButtonItem =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                   target:self
                                                   action:@selector(editDidPush)] autorelease];
  [UIView beginAnimations:nil context:nil];
  [UIView setAnimationDuration:0.3];
  // 恢复UITextView的尺寸
  textView.frame = self.view.bounds;
  // 恢复工具条的位置
  CGRect toolbarFrame = self.navigationController.toolbar.frame;
  toolbarFrame.origin.y =
    self.view.window.bounds.size.height - toolbarFrame.size.height;
  self.navigationController.toolbar.frame = toolbarFrame;
  [UIView commitAnimations];
}

- (void)editDidPush {
  [textView_ becomeFirstResponder];
}

- (void)doneDidPush {
  [textView_ resignFirstResponder];
}

@end
