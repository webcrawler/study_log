//
//  UIKitPrjUIImage.m
//
//  Created by wang on 2011-09-24.
//

#import "UIKitPrjUIImage.h"
//实现UIView子类
@implementation DrawImageTest

- (void)dealloc {
  [image_ release];
  [super dealloc];
}

- (id)initWithImage:(UIImage*)image {
  if ( (self = [super init]) ) {
    image_ = image;    
  }
  return self;
}

- (void)drawRect:(CGRect)rect {
//在drawAtPoint:与drawInRect:间切换，比较具体效果
  [image_ drawAtPoint:rect.origin];
  //[image_ drawInRect:rect];
}

@end

@implementation UIKitPrjUIImage

- (void)viewDidLoad {
  [super viewDidLoad];

  // 读入图片文件
  UIImage* image = [UIImage imageNamed:@"dog.jpg"];
  // 创建定制的View
  DrawImageTest* test = [[[DrawImageTest alloc] initWithImage:image] autorelease];
  test.frame = self.view.bounds;
  test.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:test];
}

@end
