//
//  UIKitPrjReversesTitleShadow.m
//
//  Created by wang on 2011-08-15.
//

#import "UIKitPrjReversesTitleShadow.h"

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjReversesTitleShadow ()
- (UIButton*)buttonForThisSample;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjReversesTitleShadow

- (void)viewDidLoad {
  [super viewDidLoad];
  UIButton* button1 = [self buttonForThisSample];
  button1.frame = CGRectMake( 0, 0, 200, 60 );
  button1.center = self.view.center;
  button1.reversesTitleShadowWhenHighlighted = YES;
  [self.view addSubview:button1];

  UIButton* button2 = [self buttonForThisSample];
  button2.frame = button1.frame;
  CGPoint newPoint = button1.center;
  newPoint.y += 100;
  button2.center = newPoint;
  [self.view addSubview:button2];

}

#pragma mark ----- Private Methods -----

- (UIButton*)buttonForThisSample {
  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                            UIViewAutoresizingFlexibleRightMargin |
                            UIViewAutoresizingFlexibleTopMargin |
                            UIViewAutoresizingFlexibleBottomMargin;
  button.titleLabel.font = [UIFont boldSystemFontOfSize:24];
  button.titleLabel.shadowOffset = CGSizeMake( 3.0, 3.0 );

  [button setTitle:@"UIButton" forState:UIControlStateNormal];
  [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [button setTitleShadowColor:[UIColor grayColor] forState:UIControlStateNormal];
  return button;
}

@end
