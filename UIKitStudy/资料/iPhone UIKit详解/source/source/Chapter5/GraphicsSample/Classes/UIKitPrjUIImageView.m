//
//  UIKitPrjUIImageView.m
//
//  Created by wang on 2011-09-24.
//

#import "UIKitPrjUIImageView.h"

@implementation UIKitPrjUIImageView

- (void)viewDidLoad {
  [super viewDidLoad];

  // 读入图片文件
  UIImage* image = [UIImage imageNamed:@"dog.jpg"];
  // UIImageView的创建
  UIImageView* imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
  // 设置中心位置以及自动调节参数
  imageView.center = self.view.center;
  imageView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
                               UIViewAutoresizingFlexibleBottomMargin;
  // 将图片View追加到self.view中
  [self.view addSubview:imageView];
}

@end
