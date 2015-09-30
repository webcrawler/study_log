//
//  UIKitPrjFullScreen.m
//
//  Created by Wang on 2011-08-16.
//

#import "UIKitPrjFullScreen.h"

@implementation UIKitPrjFullScreen

- (void)viewDidLoad {
  [super viewDidLoad];

  // 画像の追加
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
}

#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  fullScreen_ = !fullScreen_;
  // ステータスバー → ナビゲーションバーの順番にしないと変な空間が開いてしまう
  [[UIApplication sharedApplication] setStatusBarHidden:fullScreen_ animated:YES];
  [self.navigationController setNavigationBarHidden:fullScreen_ animated:YES];
  [self.navigationController setToolbarHidden:fullScreen_ animated:YES];
	
  CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
  CGRect bounds = [[UIScreen mainScreen] bounds];
  NSLog( @"applicationFrame( %f, %f, %f, %f )", applicationFrame.origin.x, applicationFrame.origin.y, applicationFrame.size.width, applicationFrame.size.height );
  NSLog( @"bounds( %f, %f, %f, %f )", bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height );	
}

@end
