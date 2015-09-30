//
//  UIKitPrjActionSheetObserving.m
//
//  Created by wang on 2011-09-19.
//

#import "UIKitPrjActionSheetObserving.h"

@implementation UIKitPrjActionSheetObserving

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setToolbarHidden:NO animated:YES];
  self.title = @"ActionSheet";
  UIBarButtonItem* button =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                  target:self
                                                  action:@selector(buttonDidPush)];
  [self setToolbarItems:[NSArray arrayWithObjects:button, nil] animated:YES];
  [button release];
}

- (void)buttonDidPush {
  UIActionSheet* sheet = [[[UIActionSheet alloc] init] autorelease];
  sheet.delegate = self;
  [sheet addButtonWithTitle:@"回信"];
  [sheet addButtonWithTitle:@"转送"];
  [sheet addButtonWithTitle:@"取消"];
  sheet.cancelButtonIndex = 2;
  [sheet showFromToolbar:self.navigationController.toolbar];
}

- (void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  if ( buttonIndex == actionSheet.cancelButtonIndex ) {
    NSLog( @"pushed Cancel button." );
  } else {
    NSLog( @"pushed Any button." );
  }
}

- (void)willPresentActionSheet:(UIActionSheet*)actionSheet {
  NSLog( @"willPresentActionSheet" );
}

- (void)didPresentActionSheet:(UIActionSheet*)actionSheet {
  NSLog( @"didPresentActionSheet" );
}

- (void)actionSheetCancel:(UIActionSheet*)actionSheet {
  NSLog( @"actionSheetCancel" );
}

- (void)actionSheet:(UIActionSheet*)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex {
  NSLog( @"willDismissWithButtonIndex" );
}

- (void)actionSheet:(UIActionSheet*)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
  NSLog( @"didDismissWithButtonIndex" );
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return TRUE;
}

@end
