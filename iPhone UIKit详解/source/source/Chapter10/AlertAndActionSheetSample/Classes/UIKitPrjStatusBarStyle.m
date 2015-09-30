//
//  UIKitPrjStatusBarStyle.m
//
//  Created by wang on 2011-09-19.
//

#import "UIKitPrjStatusBarStyle.h"

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjStatusBarStyle ()
- (void)changeStatusBarStyle;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjStatusBarStyle

- (void)viewDidLoad {
  [super viewDidLoad];
  UIImage* image = [UIImage imageNamed:@"town.jpg"];
  UIImageView* imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
  imageView.frame = self.view.bounds;
  imageView.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  imageView.contentMode = UIViewContentModeScaleAspectFill;
  [self.view addSubview:imageView];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setNavigationBarHidden:YES animated:YES];
  self.wantsFullScreenLayout = YES;
}

#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self changeStatusBarStyle];
}

#pragma mark ----- Private Methods -----

- (void)changeStatusBarStyle {
  static UIStatusBarStyle statusBarStyle = UIStatusBarStyleBlackTranslucent;
  UIApplication* application = [UIApplication sharedApplication];
  [application setStatusBarStyle:statusBarStyle animated:YES];

  if ( UIStatusBarStyleBlackOpaque < ++statusBarStyle ) {
    statusBarStyle = UIStatusBarStyleDefault;
  } 
}

@end
