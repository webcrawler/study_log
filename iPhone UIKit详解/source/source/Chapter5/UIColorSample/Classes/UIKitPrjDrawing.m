//
//  UIKitPrjDrawing.m
//
//  Created by wang on 2011-10-15.
//

#import "UIKitPrjDrawing.h"
//MyView类中重写drawRect：方法，并在其中进行字符串及背景绘制
@implementation MyView

- (void)drawRect:(CGRect)rect {

  UIImage* image = [UIImage imageNamed:@"dog.png"];
  UIColor* patternColor = [UIColor colorWithPatternImage:image];

  // 绘制四边形
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextBeginPath( context );
  CGContextAddRect( context, rect );
  CGContextClosePath( context );
  [[UIColor grayColor] setStroke]; //< 设置边框的颜色为灰色
  [patternColor setFill]; //< 将背景设置为图片背景
  CGContextDrawPath( context, kCGPathEOFillStroke );

  // 绘制字符
  [[UIColor blueColor] set]; //< 将字符颜色设置为蓝色
  [@"PRETTY DOGS" drawInRect:rect
                    withFont:[UIFont boldSystemFontOfSize:24]
               lineBreakMode:UILineBreakModeClip
                   alignment:UITextAlignmentCenter];
}

@end
//创建MyView实例并追加到画面（self.view）中
@implementation UIKitPrjDrawing

- (void)viewDidLoad {
  [super viewDidLoad];
  MyView* myView = [[[MyView alloc] init] autorelease];
  myView.frame = CGRectMake( 40, 40, 240, 240 );
  [self.view addSubview:myView];
}

@end
