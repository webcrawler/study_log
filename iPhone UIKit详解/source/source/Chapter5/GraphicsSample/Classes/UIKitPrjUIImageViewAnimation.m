//
//  UIKitPrjUIImageViewAnimation.m
//
//  Created by wang on 2011-09-24.
//

#import "UIKitPrjUIImageViewAnimation.h"

@implementation UIKitPrjUIImageViewAnimation

- (void)dealloc {
  [imageView_ release];  
  [super dealloc];
}

- (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 // 动画开始
 [imageView_ startAnimating];
}

- (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 // 动画停止
 [imageView_ stopAnimating];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];

  UIImage* chara1 = [UIImage imageNamed:@"chara1.png"];
  UIImage* chara2 = [UIImage imageNamed:@"chara2.png"];

  imageView_ = [[UIImageView alloc] init];
  imageView_.frame = CGRectMake( 0, 0, 64, 64 );
  // 在NSArray数组中设置动画素材用的图片
  imageView_.animationImages = [NSArray arrayWithObjects:chara1, chara2, nil];
  // 将动画素材设置为每隔0.5秒改变一次
  imageView_.animationDuration = 0.5;
	imageView_.alpha=0.5;

  imageView_.center = self.view.center;
  imageView_.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                                UIViewAutoresizingFlexibleRightMargin |
                                UIViewAutoresizingFlexibleTopMargin |
                                UIViewAutoresizingFlexibleBottomMargin;
  [self.view addSubview:imageView_];
}

@end
