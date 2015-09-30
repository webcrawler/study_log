//
//  UIKitPrjToolbar.m
//
//  Created by Wang on 2011-08-16.
//

#import "UIKitPrjToolbar.h"

@interface NextViewController ()
- (void)nextDidPush;
@end 

@implementation NextViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"Next";
  self.view.backgroundColor = [UIColor whiteColor];

  // 设置跳转到下一画面的按钮
  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"下一画面" forState:UIControlStateNormal];
  [button sizeToFit];
  button.center = self.view.center;
  button.autoresizingMask =
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
  [button addTarget:self
             action:@selector(nextDidPush)
   forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];
}

- (void)nextDidPush {
  UIViewController* nextViewController = [[[NextViewController alloc] init] autorelease];

  // 开始时先将hidesBottomBarWhenPushed设置成YES
  static BOOL nowFirst = YES;
  if ( nowFirst ) {
    nextViewController.hidesBottomBarWhenPushed = YES;
    nowFirst = FALSE;
    NSLog( @"nowFirst" );
  } 

  [self.navigationController pushViewController:nextViewController animated:YES];
}

@end

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjToolbar ()
- (void)buttonDidPush;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjToolbar

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"UIKitPrjToolbar";

  // 工具条左侧显示的按钮
  UIBarButtonItem* button1 =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                   target:self
                                                   action:@selector(buttonDidPush) ] autorelease];
  // 自动伸缩按钮以及按钮将的空白
  UIBarButtonItem* spacer =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                   target:nil
                                                   action:nil ] autorelease];
  // 工具条右侧显示的按钮
  UIBarButtonItem* button2 =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemUndo
                                                   target:self
                                                   action:@selector(buttonDidPush) ] autorelease];
  // 全部保存到NSArray中
  NSArray* buttons = [NSArray arrayWithObjects:button1, spacer, button2, nil];

  // 将准备好的NSArray作为工具条的项目设置进去
  [self setToolbarItems:buttons animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setNavigationBarHidden:NO animated:YES];
  [self.navigationController setToolbarHidden:NO animated:YES];
}

#pragma mark ----- Private Methods -----

- (void)buttonDidPush {
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:@"INFORMATION"
                                                   message:@"buttonDidPush"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil ] autorelease];

  [alert show];
}

@end
