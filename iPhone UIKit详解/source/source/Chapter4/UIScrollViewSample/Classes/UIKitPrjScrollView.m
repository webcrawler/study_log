//
//  UIKitPrjScrollView.m
//
//  Created by wang on 2011-10-04..
//

#import "UIKitPrjScrollView.h"

@implementation UIKitPrjScrollView

- (void)viewDidLoad {
  [super viewDidLoad];

  // ScrollView的初始化
  UIScrollView* scrollView = [[[UIScrollView alloc] init] autorelease];
  scrollView.frame = self.view.bounds;
  scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  // ScrollView中设置图片 
  UIImage* image = [UIImage imageNamed:@"town.jpg"];
  UIImageView* imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
  [scrollView addSubview:imageView];
  scrollView.contentSize = imageView.bounds.size;
  // ScrollView追加到主画面
  [self.view addSubview:scrollView];

  // 扩大/縮小功能
  scrollView.delegate = self;
  scrollView.minimumZoomScale = 0.1;
  scrollView.maximumZoomScale = 3.0;
}

// 扩大/縮小功能
- (UIView*)viewForZoomingInScrollView:(UIScrollView*)scrollView {
  for ( id subview in scrollView.subviews ) {
    if ( [subview isKindOfClass:[UIImageView class]] ) {
      return subview;
    }
  }
  return nil;
}

@end
