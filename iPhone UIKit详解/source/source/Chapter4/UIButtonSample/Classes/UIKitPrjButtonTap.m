//
//  UIKitPrjButtonTap.m
//
//  Created by wang on 2011-08-15.
//

#import "UIKitPrjButtonTap.h"

@implementation UIKitPrjButtonTap

- (void)viewDidLoad {
  [super viewDidLoad];

  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"危险!请勿触摸!" forState:UIControlStateNormal];
  [button sizeToFit];
  [button addTarget:self
             action:@selector(buttonDidPush)
   forControlEvents:UIControlEventTouchUpInside];
  button.center = self.view.center;
  button.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                            UIViewAutoresizingFlexibleRightMargin |
                            UIViewAutoresizingFlexibleTopMargin |
                            UIViewAutoresizingFlexibleBottomMargin;
  [self.view addSubview:button];
}

- (void)buttonDidPush {
  UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
  alert.message = @"咚－－－－!!";
  [alert addButtonWithTitle:@"OK"];
  [alert show];
}

@end
