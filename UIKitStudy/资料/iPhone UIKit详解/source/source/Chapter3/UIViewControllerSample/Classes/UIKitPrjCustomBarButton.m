//
//  UIKitPrjCustomBarButton.m
//
//  Created by Wang on 2011-08-16.
//

#import "UIKitPrjCustomBarButton.h"

@implementation UIKitPrjCustomBarButton

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"CustomBarButton";

  // 在导航条中追加UIImageView
  UIImage* image = [UIImage imageNamed:@"face.jpg"];
  UIImageView* imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
  UIBarButtonItem* icon =
    [[[UIBarButtonItem alloc] initWithCustomView:imageView] autorelease];
  self.navigationItem.rightBarButtonItem = icon;

  // 向工具条中追加UISwitch
  UISwitch* theSwitch = [[[UISwitch alloc] init] autorelease];
  theSwitch.on = YES;
  UIBarButtonItem* switchBarButton =
    [[[UIBarButtonItem alloc] initWithCustomView:theSwitch] autorelease];


  // 向工具条中追加UISegmentedControl
  NSArray* segments = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
  UISegmentedControl* segmentedControl =
    [[[UISegmentedControl alloc] initWithItems:segments] autorelease];
  segmentedControl.selectedSegmentIndex = 1;
  segmentedControl.frame = CGRectMake( 0, 0, 100, 30 );
  UIBarButtonItem* segmentedBarButton =
    [[[UIBarButtonItem alloc] initWithCustomView:segmentedControl] autorelease];

  [self setToolbarItems:[NSArray arrayWithObjects:
          switchBarButton,
          segmentedBarButton,
          nil]];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setNavigationBarHidden:NO animated:NO];
  [self.navigationController setToolbarHidden:NO animated:NO];
}

@end
