//
//  UIKitPrjCreatingColor.m
//
//  Created by wang on 2011-10-15.
//

#import "UIKitPrjCreatingColor.h"

@implementation UIKitPrjCreatingColor

- (void)viewDidLoad {
  [super viewDidLoad];

  UILabel* label1 = [[[UILabel alloc] init] autorelease];
  label1.frame = CGRectMake( 0, 0, 320, 20 );
  label1.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                            UIViewAutoresizingFlexibleRightMargin |
                            UIViewAutoresizingFlexibleTopMargin |
                            UIViewAutoresizingFlexibleBottomMargin;
  label1.backgroundColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.0 alpha:1.0];
  [self.view addSubview:label1];

  UILabel* label2 = [[[UILabel alloc] init] autorelease];
  label2.frame = CGRectMake( 0, 20, 320, 20 );
  label2.autoresizingMask = label1.autoresizingMask;
  label2.backgroundColor = [UIColor colorWithHue:0.5 saturation:1.0 brightness:0.5 alpha:1.0];
  [self.view addSubview:label2];

  UILabel* label3 = [[[UILabel alloc] init] autorelease];
  label3.frame = CGRectMake( 0, 40, 320, 20 );
  label3.autoresizingMask = label1.autoresizingMask;
  label3.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1.0];
  [self.view addSubview:label3];

  UILabel* label4 = [[[UILabel alloc] init] autorelease];
  label4.frame = CGRectMake( 0, 60, 320, 20 );
  label4.autoresizingMask = label1.autoresizingMask;
  UIColor* red = [UIColor redColor];
  label4.backgroundColor = [red colorWithAlphaComponent:0.5];
  [self.view addSubview:label4];
}

@end
