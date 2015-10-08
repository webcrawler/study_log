//
//  UIKitPrjDrawingStringsInRect.m
//
//  Created by wang on 2011-09-24.
//

#import "UIKitPrjDrawingStringsInRect.h"
#import "UIKitPrjDrawingStrings.h"

@implementation DrawStringsInRect

- (void)drawRect:(CGRect)rect {
  NSString* message =
    @"使用UIKit中追加的NSString实例方法进行字符串的绘制。";
  UIFont* systemFont = [UIFont systemFontOfSize:[UIFont systemFontSize]];
  [message drawInRect:rect withFont:systemFont];
}

@end

@implementation UIKitPrjDrawingStringsInRect

- (void)viewDidLoad {
  [super viewDidLoad];

  // 以与画面相同的尺寸新创建View
  DrawStringsInRect* strings = [[[DrawStringsInRect alloc] init] autorelease];
  strings.frame = self.view.bounds;
  strings.backgroundColor = [UIColor whiteColor];
  strings.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:strings];
}

@end
