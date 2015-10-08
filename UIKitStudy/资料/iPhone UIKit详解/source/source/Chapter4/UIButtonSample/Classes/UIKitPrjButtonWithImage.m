//
//  UIKitPrjButtonWithImage.m
//
//  Created by wang on 2011-08-15.
//

#import "UIKitPrjButtonWithImage.h"

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjButtonWithImage()
- (UIButton*)buttonForThisSample;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjButtonWithImage

- (void)viewDidLoad {
  [super viewDidLoad];
  UIButton* button1 = [self buttonForThisSample];
  button1.frame = CGRectMake( 0, 0, 150, 40 );
  button1.center = self.view.center;
  CGPoint newPoint = button1.center;
  newPoint.y -= 120;
  button1.center = newPoint;
  UIImage* image1 = [UIImage imageNamed:@"Dog.png"];
  [button1 setImage:image1 forState:UIControlStateNormal];
  UIImage* image2 = [UIImage imageNamed:@"DogHighlight.png"];
  [button1 setImage:image2 forState:UIControlStateHighlighted];
  UIImage* image3 = [UIImage imageNamed:@"DogDisable.png"];
  [button1 setImage:image3 forState:UIControlStateDisabled];
  [self.view addSubview:button1];

  UIButton* button2 = [self buttonForThisSample];
  button2.frame = button1.frame;
  newPoint = button1.center;
  newPoint.y += 60;
  button2.center = newPoint;
  [button2 setImage:image1 forState:UIControlStateNormal];
  button2.adjustsImageWhenHighlighted = NO;
  [self.view addSubview:button2];

  UIButton* button3 = [self buttonForThisSample];
  button3.frame = button2.frame;
  newPoint = button2.center;
  newPoint.y += 60;
  button3.center = newPoint;
  [button3 setImage:image1 forState:UIControlStateNormal];
  [self.view addSubview:button3];

  UIButton* button4 = [self buttonForThisSample];
  button4.frame = button3.frame;
  newPoint = button3.center;
  newPoint.y += 60;
  button4.center = newPoint;
  [button4 setImage:image1 forState:UIControlStateNormal];
  button4.enabled = NO;
  button4.adjustsImageWhenDisabled = YES;
  [self.view addSubview:button4];

  UIButton* button5 = [self buttonForThisSample];
  button5.frame = CGRectMake( 0, 0, 180, 60 );
  newPoint = button4.center;
  newPoint.y += 80;
  button5.center = newPoint;
 // [button5 setImage:image1 forState:UIControlStateNormal];
  UIImage* backImage = [UIImage imageNamed:@"frame.png"];
  UIImage* stretchableImage = [backImage stretchableImageWithLeftCapWidth:20 topCapHeight:20];
  [button5 setBackgroundImage:stretchableImage forState:UIControlStateNormal];
  [self.view addSubview:button5];
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
  return button;
}

@end
