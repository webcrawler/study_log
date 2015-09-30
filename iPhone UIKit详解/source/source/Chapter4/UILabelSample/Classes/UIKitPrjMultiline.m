//
//  UIKitPrjMultiline.m
//
//  Created by wang on 2011-09-25.
//

#import "UIKitPrjMultiline.h"

@implementation UIKitPrjMultiline

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"Multiline";
  self.view.backgroundColor = [UIColor blackColor];

  UILabel* label0 = [[[UILabel alloc] initWithFrame:CGRectMake( 10,  10, 300, 60 )] autorelease];
  UILabel* label1 = [[[UILabel alloc] initWithFrame:CGRectMake( 10,  90, 300, 60 )] autorelease];
  UILabel* label2 = [[[UILabel alloc] initWithFrame:CGRectMake( 10, 170, 300, 60 )] autorelease];

  NSString* longText =
    @"放入很长的文本字符串。今后要注意不要这么长。"
     "现在、已经进入到第３行了。";
  label0.text = label1.text = label2.text = longText;

  label0.numberOfLines = 1;
  label1.numberOfLines = 2;
  label2.numberOfLines = 3;

  [self.view addSubview:label0];
  [self.view addSubview:label1];
  [self.view addSubview:label2];
}

@end
