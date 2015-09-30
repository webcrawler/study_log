//
//  UIKitPrjBarColor.m
//
//  Created by Wang on 2011-08-16.
//

#import "UIKitPrjBarColor.h"

@implementation UIKitPrjBarColor

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"tintColor";

  UIBarButtonItem* button1 =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize
                                                   target:nil
                                                   action:nil] autorelease];
  UIBarButtonItem* spacer =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                   target:nil
                                                   action:nil ] autorelease];
  UIBarButtonItem* button2 =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemUndo
                                                   target:nil
                                                   action:nil ] autorelease];
  NSArray* buttons = [NSArray arrayWithObjects:button1, spacer, button2, nil];
  [self setToolbarItems:buttons animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];

  [self.navigationController setNavigationBarHidden:NO animated:NO];
  [self.navigationController setToolbarHidden:NO animated:NO];

  // 将导航条变成红色
  self.navigationController.navigationBar.tintColor = [UIColor redColor];
  // 将工具条变成蓝色
  self.navigationController.toolbar.tintColor = [UIColor blueColor];
}

@end
