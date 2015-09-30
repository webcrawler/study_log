//
//  UIKitPrjStatusBarColor.m
//
//  Created by Wang on 2011-08-16.
//

#import "UIKitPrjStatusBarColor.h"

@implementation UIKitPrjStatusBarColor

- (void)viewDidLoad {
  [super viewDidLoad];

  UILabel* label = [[[UILabel alloc] init] autorelease];
  label.frame = self.view.bounds;
  label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label.text = @"触摸画面后，切换状态条颜色";
  label.numberOfLines = 2;
  [self.view addSubview:label];

  self.wantsFullScreenLayout = YES;
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:YES];
  [self.navigationController setNavigationBarHidden:NO animated:NO];
  [self.navigationController setToolbarHidden:YES animated:NO];
}

#pragma mark ----- Responder -----
  
- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  UIApplication* app = [UIApplication sharedApplication];
  if ( UIStatusBarStyleDefault == app.statusBarStyle ) {
    app.statusBarStyle = UIStatusBarStyleBlackOpaque;
    [self.navigationController setNavigationBarHidden:NO animated:NO];
  } else if ( UIStatusBarStyleBlackOpaque == app.statusBarStyle ) {
    app.statusBarStyle = UIStatusBarStyleBlackTranslucent;
    [self.navigationController setNavigationBarHidden:YES animated:NO];
  } else {
    app.statusBarStyle = UIStatusBarStyleDefault;
    [self.navigationController setNavigationBarHidden:NO animated:NO];
  }
}

@end
