//
//  UIKitPrjSizeWithFont.m
//
//  Created by wang on 2011-09-24.
//

#import "UIKitPrjSizeWithFont.h"

@implementation SizeWithFontTest

- (id)init {
  if ( (self = [super init]) ) {
    self.backgroundColor = [UIColor whiteColor];    
    self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                            UIViewAutoresizingFlexibleRightMargin |
                            UIViewAutoresizingFlexibleTopMargin |
                            UIViewAutoresizingFlexibleBottomMargin;
  }
  return self;
}

- (void)drawRect:(CGRect)rect {
  NSString* message =
    @"sizeWithFont:方法中计算绘制字符串时的字符大小。";
  UIFont* systemFont = [UIFont systemFontOfSize:18];
  CGFloat actualFontSize;
  [message drawAtPoint:rect.origin
              forWidth:rect.size.width
              withFont:systemFont
           minFontSize:6
        actualFontSize:&actualFontSize
         lineBreakMode:UILineBreakModeWordWrap
    baselineAdjustment:UIBaselineAdjustmentAlignCenters];

  CGSize size;
  // 计算各种情况下字符的大小
  size = [message sizeWithFont:systemFont];
  NSLog( @"●sizeWithFont: 的运行结果" );
  NSLog( @"size = %f, %f", size.width, size.height );
  // 设置了横向宽度的限制值的情况下（不支持多行）
  size = [message sizeWithFont:systemFont
                      forWidth:rect.size.width
                 lineBreakMode:UILineBreakModeTailTruncation];
  NSLog( @"●sizeWithFont:forWidth:lineBreakMode: 的运行结果" );
  NSLog( @"size = %f, %f", size.width, size.height );
  // 设置了横向与纵向宽度的限制值的情况下（支持多行）
  size = [message sizeWithFont:systemFont constrainedToSize:rect.size];
  NSLog( @"●sizeWithFont:constrainedToSize: 的运行结果" );
  NSLog( @"size = %f, %f", size.width, size.height );
  // 设置了横向与纵向宽度、且指定了换行／变换方法的情况下
  size = [message sizeWithFont:systemFont
             constrainedToSize:rect.size
                 lineBreakMode:UILineBreakModeCharacterWrap];
  NSLog( @"●sizeWithFont:constrainedToSize:lineBreakMode: 的运行结果" );
  NSLog( @"size = %f, %f", size.width, size.height );
  // 使用字体自动缩小设置时
  size = [message sizeWithFont:systemFont
             minFontSize:6
          actualFontSize:&actualFontSize
                forWidth:rect.size.width
                 lineBreakMode:UILineBreakModeWordWrap];
  NSLog( @"●sizeWithFont:minFontSize:actualFontSize:forWidth:lineBreakMode: 的运行结果" );
  NSLog( @"size = %f, %f", size.width, size.height );
  NSLog( @"actualFontSize = %f", actualFontSize );
}

@end

@implementation UIKitPrjSizeWithFont

- (void)viewDidLoad {
  [super viewDidLoad];

  SizeWithFontTest* test1 =
    [[[SizeWithFontTest alloc] init] autorelease];
  test1.frame = CGRectMake( 0, 10, 320, 66 );
  [self.view addSubview:test1];

//  SizeWithFontTest* test2 =
//    [[[SizeWithFontTest alloc] init] autorelease];
//  test2.frame = CGRectMake( 0, 70, 320, 40 );
//  [self.view addSubview:test2];

//  SizeWithFontTest* test3 =
//    [[[SizeWithFontTest alloc] init] autorelease];
//  test3.frame = CGRectMake( 0, 130, 320, 40 );
//  [self.view addSubview:test3];
}

@end
