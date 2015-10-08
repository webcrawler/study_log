//
//  UIKitPrjEdgeInsets.m
//
//  Created by wang on 2011-08-15.
//

#import "UIKitPrjEdgeInsets.h"

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjEdgeInsets ()
- (UIButton*)buttonForThisSample;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjEdgeInsets 

- (void)viewDidLoad {
  [super viewDidLoad];

  UIButton* button1 = [self buttonForThisSample];
  button1.frame = CGRectMake( 0, 0, 150, 40 );
  button1.center = self.view.center;
  CGPoint newPoint = button1.center;
  newPoint.y -= 180;
  button1.center = newPoint;
  [self.view addSubview:button1];

  UIButton* button2 = [self buttonForThisSample];
  button2.frame = button1.frame;
  newPoint = button1.center;
  newPoint.y += 70;
  button2.center = newPoint;
  UIEdgeInsets insets;
  insets.top = insets.bottom = insets.left = insets.right = 10;
  button2.contentEdgeInsets = insets;
  [self.view addSubview:button2];

  UIButton* button3 = [self buttonForThisSample];
  button3.frame = button1.frame;
  newPoint = button2.center;
  newPoint.y += 70;
  button3.center = newPoint;
  insets.top = insets.bottom = insets.left = insets.right = 10;
  button3.titleEdgeInsets = insets;
  [self.view addSubview:button3];

  UIButton* button4 = [self buttonForThisSample];
  button4.frame = button1.frame;
  newPoint = button3.center;
  newPoint.y += 70;
  button4.center = newPoint;
  insets.top = insets.bottom = insets.left = insets.right = 10;
  button4.imageEdgeInsets = insets;
  [self.view addSubview:button4];
}

#pragma mark ----- Private Methods -----

- (UIButton*)buttonForThisSample {
  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                            UIViewAutoresizingFlexibleRightMargin |
                            UIViewAutoresizingFlexibleTopMargin |
                            UIViewAutoresizingFlexibleBottomMargin;
  button.titleLabel.font = [UIFont boldSystemFontOfSize:24];

  [button setTitle:@"UIButton" forState:UIControlStateNormal];
  UIImage* image = [UIImage imageNamed:@"Dog.png"];
  [button setImage:image forState:UIControlStateNormal];
  return button;
}

@end
