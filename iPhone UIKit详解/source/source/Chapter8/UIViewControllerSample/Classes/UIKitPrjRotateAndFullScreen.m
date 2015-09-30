//
//  UIKitPrjRotateAndFullScreen.m
//
//  Created by Wang on 2011-08-16.
//

#import "UIKitPrjRotateAndFullScreen.h"

@implementation UIKitPrjRotateAndFullScreen

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

  //实例变量，记录显示是否为全屏显示
  //此实例变量在@interface中定义
  fullScreen_ = NO;
  //显示导航条、工具条
  [self.navigationController setNavigationBarHidden:NO animated:NO];
  [self.navigationController setToolbarHidden:NO animated:NO];

  // 使状态条/导航条/工具条透明
  [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackTranslucent;
  self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
  self.navigationController.navigationBar.translucent = YES;
  self.navigationController.toolbar.barStyle = UIBarStyleBlack;
  self.navigationController.toolbar.translucent = YES;
  // 指定此属性，使状态条下也可绘制图像
  self.wantsFullScreenLayout = YES;
}
//重写UIViewController中此方法，让其返回YES即可实现画面旋转
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  //全屏显示与非全屏显示间的切换
  fullScreen_ = !fullScreen_;
  //设置动画标志
  BOOL needAnimation = YES;
  //动画标志为YES时，动画定义开始
  if ( needAnimation ) {
	//动画定义开始
    [UIView beginAnimations:nil context:NULL];
	//设置动画持续时间，将动画持续时间设置成与状态条消失时间相同
    [UIView setAnimationDuration:0.3];
  } 
  //隐藏状态条（状态条逐渐消失）
  [[UIApplication sharedApplication] setStatusBarHidden:fullScreen_ animated:needAnimation];
  // API参考中不推荐直接改变navigationBar的alpha值
  self.navigationController.navigationBar.alpha = fullScreen_ ? 0.0 : 1.0;
  self.navigationController.toolbar.alpha = fullScreen_ ? 0.0 : 1.0;
  //动画结束
  if ( needAnimation ) {
    [UIView commitAnimations];
  }

  if ( !fullScreen_ ) {
    // 不进行如下设置、当全屏状态下旋转后再解除全屏状态时导航条的位置将偏移
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self.navigationController setToolbarHidden:YES animated:NO];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.navigationController setToolbarHidden:NO animated:NO];
  } 
}

@end
