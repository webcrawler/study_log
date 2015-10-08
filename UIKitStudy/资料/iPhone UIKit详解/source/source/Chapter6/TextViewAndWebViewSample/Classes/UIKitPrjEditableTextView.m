//
//  UIKitPrjEditableTextView.m
//
//  Created by wang on 2011-09-21.
//

#import "UIKitPrjEditableTextView.h"

@implementation UIKitPrjEditableTextView

- (void)dealloc {
  [textView_ release];  
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  textView_ = [[UITextView alloc] init];
  textView_.frame = self.view.bounds;
  textView_.autoresizingMask = UIViewAutoresizingFlexibleWidth |
                               UIViewAutoresizingFlexibleHeight;
  textView_.delegate = self;
  textView_.text = @"此文本可编辑。";

  [self.view addSubview:textView_];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setNavigationBarHidden:NO animated:YES];
  [self.navigationController setToolbarHidden:NO animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self textViewDidEndEditing:textView_]; //< 画面显示时设置为非编辑模式
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  [textView_ resignFirstResponder]; //< 画面跳转时设置为非编辑模式
}

- (void)textViewDidBeginEditing:(UITextView*)textView {
  static const CGFloat kKeyboardHeight = 216.0;

  // 按钮设置为［完成］
  self.navigationItem.rightBarButtonItem =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                   target:self
                                                   action:@selector(doneDidPush)] autorelease];
  [UIView beginAnimations:nil context:nil];
  [UIView setAnimationDuration:0.3];
  // 缩小UITextView以免被键盘挡住
  CGRect textViewFrame = textView.frame;
  textViewFrame.size.height = self.view.bounds.size.height - kKeyboardHeight;
  textView.frame = textViewFrame;
  // 工具条位置上移
  CGRect toolbarFrame = self.navigationController.toolbar.frame;
  toolbarFrame.origin.y =
    self.view.window.bounds.size.height - toolbarFrame.size.height - kKeyboardHeight;
  self.navigationController.toolbar.frame = toolbarFrame;
  [UIView commitAnimations];
}

- (void)textViewDidEndEditing:(UITextView*)textView {
  // 按钮设置为[编辑]
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
