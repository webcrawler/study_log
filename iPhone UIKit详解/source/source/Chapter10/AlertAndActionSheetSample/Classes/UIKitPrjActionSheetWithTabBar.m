//
//  UIKitPrjActionSheetWithTabBar.m
//
//  Created by wang on 2011-09-19.
//

#import "UIKitPrjActionSheetWithTabBar.h"

@interface ViewController : UIViewController <UIActionSheetDelegate>
@end

@implementation ViewController

- (id)init {
  if ( (self = [super init]) ) {
    self.tabBarItem =
      [[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:0] autorelease];    
  }
  return self;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	UIBarButtonItem* button =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                  target:self
                                                  action:@selector(buttonDidPush)];
	self.parentViewController.navigationItem.rightBarButtonItem = button;
	[button release];
}

- (void)buttonDidPush {
	UIActionSheet* sheet = [[[UIActionSheet alloc] init] autorelease];
	sheet.delegate = self;
	[sheet addButtonWithTitle:@"回信"];
	[sheet addButtonWithTitle:@"转送"];
	[sheet addButtonWithTitle:@"取消"];
	sheet.cancelButtonIndex = 2;
	[sheet showFromTabBar:[(UITabBarController*)self.parentViewController tabBar]];
}

- (void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	if ( buttonIndex == actionSheet.cancelButtonIndex ) {
		NSLog( @"pushed Cancel button." );
	}
}

@end

@implementation UIKitPrjActionSheetWithTabBar

- (void)viewDidLoad {
  [super viewDidLoad];
  ViewController* tab1 = [[[ViewController alloc] init] autorelease];
  ViewController* tab2 = [[[ViewController alloc] init] autorelease];
  self.viewControllers = [NSArray arrayWithObjects:tab1, tab2, nil];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setToolbarHidden:YES animated:YES];
  self.title = @"ActionSheet";
}

@end
