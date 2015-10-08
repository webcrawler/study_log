//
//  UIKitPrjDataDetectorTypes.m
//
//  Created by wang on 2011-09-21.
//

#import "UIKitPrjDataDetectorTypes.h"

@implementation UIKitPrjDataDetectorTypes

- (void)viewDidLoad {
  [super viewDidLoad];

  // UITextView的追加
  UITextView* textView = [[[UITextView alloc] init] autorelease];
  textView.frame = self.view.bounds;
  textView.editable = NO; //< 这个必须
  textView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  textView.font = [UIFont systemFontOfSize:24];
  textView.text = @"详细如下↓\n"
                   "http://www.apple.com/\n"
                   "联系方式: 139-0000-0000\n";
  textView.dataDetectorTypes = UIDataDetectorTypeAll;
  [self.view addSubview:textView];
}

@end
