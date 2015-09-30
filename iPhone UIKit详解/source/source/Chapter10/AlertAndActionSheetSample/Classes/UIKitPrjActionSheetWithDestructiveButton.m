//
//  UIKitPrjActionSheetWithDestructiveButton.m
//
//  Created by wang on 2011-09-19.
//

#import "UIKitPrjActionSheetWithDestructiveButton.h"

@implementation UIKitPrjActionSheetWithDestructiveButton

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setToolbarHidden:NO animated:YES];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"ActionSheet";
  UIBarButtonItem* button =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                                  target:self
                                                  action:@selector(buttonDidPush)];
  [self setToolbarItems:[NSArray arrayWithObjects:button, nil] animated:YES];
  [button release];
}

- (void)buttonDidPush {
  UIActionSheet* sheet = [[[UIActionSheet alloc] init] autorelease];
  sheet.delegate = self;
  [sheet addButtonWithTitle:@"删除"];
  [sheet addButtonWithTitle:@"取消"];
  sheet.destructiveButtonIndex = 0;
  sheet.cancelButtonIndex = 1;
  [sheet showFromToolbar:self.navigationController.toolbar];
}

- (void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  if ( buttonIndex == actionSheet.destructiveButtonIndex ) {
    NSLog( @"pushed Delete button." );
  } else if ( buttonIndex == actionSheet.cancelButtonIndex ) {
    NSLog( @"pushed Cancel button." );
  }
}

@end
