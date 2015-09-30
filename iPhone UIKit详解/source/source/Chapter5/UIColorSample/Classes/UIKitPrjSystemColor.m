//
//  UIKitPrjSystemColor.m
//
//  Created by wang on 2011-10-15.
//

#import "UIKitPrjSystemColor.h"

@implementation UIKitPrjSystemColor

- (void)viewDidLoad {
  [super viewDidLoad];

  const NSUInteger kBarHeight = 80;
  NSUInteger top = 0;
  UILabel* label1 = [[[UILabel alloc] init] autorelease];
  label1.frame = CGRectMake( 0, top, 320, kBarHeight );
  label1.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                            UIViewAutoresizingFlexibleRightMargin |
                            UIViewAutoresizingFlexibleTopMargin |
                            UIViewAutoresizingFlexibleBottomMargin;
  label1.backgroundColor = [UIColor lightTextColor];
  [self.view addSubview:label1];

  top += kBarHeight;
  UILabel* label2 = [[[UILabel alloc] init] autorelease];
  label2.frame = CGRectMake( 0, top, 320, kBarHeight );
  label2.autoresizingMask = label1.autoresizingMask;
  label2.backgroundColor = [UIColor darkTextColor];
  [self.view addSubview:label2];

  top += kBarHeight;
  UILabel* label3 = [[[UILabel alloc] init] autorelease];
  label3.frame = CGRectMake( 0, top, 320, kBarHeight );
  label3.autoresizingMask = label1.autoresizingMask;
  label3.backgroundColor = [UIColor groupTableViewBackgroundColor];
  [self.view addSubview:label3];

  top += kBarHeight;
  UILabel* label4 = [[[UILabel alloc] init] autorelease];
  label4.frame = CGRectMake( 0, top, 320, kBarHeight );
  label4.autoresizingMask = label1.autoresizingMask;
  label4.backgroundColor = [UIColor viewFlipsideBackgroundColor];
  [self.view addSubview:label4];
}

@end
