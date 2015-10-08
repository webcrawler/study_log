//
//  UIKitPrjDrawingStrings.m
//
//  Created by wang on 2011-09-24.
//

#import "UIKitPrjDrawingStrings.h"

@implementation DrawStrings
@synthesize message;
- (void)drawRect:(CGRect)rect {
  UIFont* systemFont = [UIFont systemFontOfSize:[UIFont systemFontSize]];
  [self.message drawAtPoint:CGPointMake( 0, 0 ) withFont:systemFont];
}

@end

@implementation UIKitPrjDrawingStrings

- (void)viewDidLoad {
  [super viewDidLoad];

  // 以与画面相同的尺寸新创建View
  DrawStrings* strings = [[[DrawStrings alloc] init] autorelease];
  strings.message = @"使用UIKit中追加的NSString实例方法进行字符串的绘制。";
  strings.frame = self.view.bounds;
  strings.backgroundColor = [UIColor whiteColor];
  strings.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:strings];
}

@end
