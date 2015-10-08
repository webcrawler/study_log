//
//  UIKitPrjFullScreenWithTransparent.m
//
//  Created by Wang on 2011-08-16.
//

#import "UIKitPrjFullScreenWithTransparent.h"

@implementation UIKitPrjFullScreenWithTransparent

- (void)viewDidLoad {
  [super viewDidLoad];

  // 图像追加
  UIImage* image = [UIImage imageNamed:@"town.jpg"];
  UIImageView* imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
  imageView.frame = self.view.bounds;
  imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  imageView.contentMode = UIViewContentModeScaleAspectFill;
  [self.view addSubview:imageView];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];

  fullScreen_ = NO;
  [self.navigationController setNavigationBarHidden:NO animated:NO];
  [self.navigationController setToolbarHidden:NO animated:NO];

  // 使状态条/导航条/工具条透明
  [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackTranslucent;
  self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
  self.navigationController.navigationBar.translucent = YES;
  self.navigationController.toolbar.barStyle = UIBarStyleBlack;
  self.navigationController.toolbar.translucent = YES;
  // 如果不指定此属性，状态条下将不能绘制图像
  self.wantsFullScreenLayout = YES;
}

#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  fullScreen_ = !fullScreen_;

  BOOL needAnimation = YES;

  if ( needAnimation ) {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
  } 

  [[UIApplication sharedApplication] setStatusBarHidden:fullScreen_ animated:needAnimation];
  self.navigationController.navigationBar.alpha = fullScreen_ ? 0.0 : 1.0;
  self.navigationController.toolbar.alpha = fullScreen_ ? 0.0 : 1.0;

  if ( needAnimation ) {
    [UIView commitAnimations];
  }
}

@end
