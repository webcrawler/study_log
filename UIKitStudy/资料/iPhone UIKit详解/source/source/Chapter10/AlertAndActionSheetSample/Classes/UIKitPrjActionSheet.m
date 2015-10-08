//
//  UIKitPrjActionSheet.m
//
//  Created by wang on 2011-09-19.
//

#import "UIKitPrjActionSheet.h"

@implementation UIKitPrjActionSheet

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  //隐藏工具条
  [self.navigationController setToolbarHidden:YES animated:NO];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"ActionSheet";
  UIBarButtonItem* button =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                  target:self
                                                  action:@selector(buttonDidPush)];
  self.navigationItem.rightBarButtonItem = button;
  [button release];
}

- (void)buttonDidPush {
  UIActionSheet* sheet = [[[UIActionSheet alloc] init] autorelease];
  sheet.delegate = self;
  [sheet addButtonWithTitle:@"动作1"];
  [sheet addButtonWithTitle:@"动作2"];
  [sheet addButtonWithTitle:@"取消"];
  sheet.cancelButtonIndex = 2;
  [sheet showInView:self.view];

  /* 如此也可以实现相同的功能
  UIActionSheet* sheet = [[[UIActionSheet alloc] initWithTitle:nil
                                                      delegate:self
                                             cancelButtonTitle:@"取消"
                                        destructiveButtonTitle:nil
                                             otherButtonTitles:@"动作1", @"动作2", nil] autorelease];
  [sheet showInView:self.view];
  */
}

- (void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  if ( buttonIndex == actionSheet.cancelButtonIndex ) {
    NSLog( @"pushed Cancel button." );
  }
}

@end
