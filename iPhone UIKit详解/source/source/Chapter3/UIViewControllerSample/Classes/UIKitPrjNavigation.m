//
//  UIKitPrjNavigation.m
//
//  Created by Wang on 2011-08-16.
//

#import "UIKitPrjNavigation.h"

@implementation UIKitPrjNavigation

- (void)viewDidLoad {
  [super viewDidLoad];

  // 第１行信息的追加
  self.navigationItem.prompt = @"第１行信息";
  // 设置标题
  self.navigationItem.title = @"标题";

  // 在右侧追加按钮
  UIBarButtonItem* rightItem =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose
                                                   target:nil
                                                   action:nil ] autorelease];
  self.navigationItem.rightBarButtonItem = rightItem;


  // 在左侧追加UIImageView
  UIImage* image = [UIImage imageNamed:@"face.jpg"];
  UIImageView* imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
  UIBarButtonItem* icon =
    [[[UIBarButtonItem alloc] initWithCustomView:imageView] autorelease];
  self.navigationItem.leftBarButtonItem = icon;

  UILabel* label = [[[UILabel alloc] init] autorelease];
  label.frame = self.view.bounds;
  label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label.backgroundColor = [UIColor blackColor];
  [self.view addSubview:label];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setNavigationBarHidden:NO animated:NO];
  [self.navigationController setToolbarHidden:NO animated:NO];
}

#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  self.navigationItem.leftBarButtonItem = nil;
}

@end
