//
//  UIKitPrjActionSheetStyle.m
//
//  Created by wang on 2011-09-19.
//

#import "UIKitPrjActionSheetStyle.h"

@implementation UIKitPrjActionSheetStyle

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setToolbarHidden:YES animated:YES];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  actionSheetStyle_ = UIActionSheetStyleAutomatic;
  self.title = @"ActionSheet";
  UIBarButtonItem* button =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                  target:self
                                                  action:@selector(buttonDidPush)];
  self.navigationItem.rightBarButtonItem = button;
  [button release];

  UIImage* image = [UIImage imageNamed:@"town.jpg"];
  UIImageView* imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
  imageView.frame = self.view.bounds;
  imageView.contentMode = UIViewContentModeScaleAspectFill;
  imageView.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:imageView];
}

- (void)buttonDidPush {
  UIActionSheet* sheet = [[[UIActionSheet alloc] init] autorelease];
  sheet.delegate = self;
  sheet.actionSheetStyle = actionSheetStyle_;
  sheet.title = @"请选择UIActionSheetStyle";
  [sheet addButtonWithTitle:@"StyleDefault"];
  [sheet addButtonWithTitle:@"StyleBlackTranslucent"];
  [sheet addButtonWithTitle:@"StyleBlackOpaque"];
  [sheet addButtonWithTitle:@"Cancel"];
  sheet.cancelButtonIndex = 3;
  [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  switch ( buttonIndex ) {
    case 0:
      actionSheetStyle_ = UIActionSheetStyleDefault;
      break;
    case 1:
      actionSheetStyle_ = UIActionSheetStyleBlackTranslucent;
      break;
    case 2:
      actionSheetStyle_ = UIActionSheetStyleBlackOpaque;
      break;
    default:
      actionSheetStyle_ = UIActionSheetStyleAutomatic;
      break;
  }
}

@end
