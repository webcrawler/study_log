//
//  UIKitPrjMinFontSize.m
//
//  Created by wang on 2011-09-24.
//

#import "UIKitPrjMinFontSize.h"

@implementation MinFontSizeTest

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
    @"不能容纳的情况下、minFontSize作为字体大小进行自动缩小处理";
  UIFont* systemFont = [UIFont systemFontOfSize:36];
  CGFloat actualFontSize;
  [message drawAtPoint:rect.origin
              forWidth:rect.size.width
              withFont:systemFont
           minFontSize:6
        actualFontSize:&actualFontSize
         lineBreakMode:UILineBreakModeWordWrap
    baselineAdjustment:UIBaselineAdjustmentAlignCenters];
  NSLog( @"actualFontSize = %f", actualFontSize );
}

@end

@implementation UIKitPrjMinFontSize

- (void)viewDidLoad {
  [super viewDidLoad];

  MinFontSizeTest* test = [[[MinFontSizeTest alloc] init] autorelease];
  test.frame = CGRectMake( 0, 10, 320, 40 );
  [self.view addSubview:test];
}
@end
