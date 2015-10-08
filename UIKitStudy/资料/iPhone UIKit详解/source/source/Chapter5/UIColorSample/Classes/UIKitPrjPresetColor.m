//
//  UIKitPrjPresetColor.m
//
//  Created by wang on 2011-10-15.
//

#import "UIKitPrjPresetColor.h"

@implementation UIKitPrjPresetColor

- (void)viewDidLoad {
  [super viewDidLoad];

  const NSUInteger kBarHeight = 30;
  NSUInteger top = 0;
  UILabel* label1 = [[[UILabel alloc] init] autorelease];
  label1.frame = CGRectMake( 0, 0, 320, kBarHeight );
  label1.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                            UIViewAutoresizingFlexibleRightMargin |
                            UIViewAutoresizingFlexibleTopMargin |
                            UIViewAutoresizingFlexibleBottomMargin;
  label1.backgroundColor = [UIColor blackColor];
  [self.view addSubview:label1];

  top += kBarHeight;
  UILabel* label2 = [[[UILabel alloc] init] autorelease];
  label2.frame = CGRectMake( 0, top, 320, kBarHeight );
  label2.autoresizingMask = label1.autoresizingMask;
  label2.backgroundColor = [UIColor darkGrayColor];
  [self.view addSubview:label2];

  top += kBarHeight;
  UILabel* label3 = [[[UILabel alloc] init] autorelease];
  label3.frame = CGRectMake( 0, top, 320, kBarHeight );
  label3.autoresizingMask = label1.autoresizingMask;
  label3.backgroundColor = [UIColor lightGrayColor];
  [self.view addSubview:label3];

  top += kBarHeight;
  UILabel* label4 = [[[UILabel alloc] init] autorelease];
  label4.frame = CGRectMake( 0, top, 320, kBarHeight );
  label4.autoresizingMask = label1.autoresizingMask;
  label4.backgroundColor = [UIColor whiteColor];
  [self.view addSubview:label4];

  top += kBarHeight;
  UILabel* label5 = [[[UILabel alloc] init] autorelease];
  label5.frame = CGRectMake( 0, top, 320, kBarHeight );
  label5.autoresizingMask = label1.autoresizingMask;
  label5.backgroundColor = [UIColor grayColor];
  [self.view addSubview:label5];

  top += kBarHeight;
  UILabel* label6 = [[[UILabel alloc] init] autorelease];
  label6.frame = CGRectMake( 0, top, 320, kBarHeight );
  label6.autoresizingMask = label1.autoresizingMask;
  label6.backgroundColor = [UIColor redColor];
  [self.view addSubview:label6];

  top += kBarHeight;
  UILabel* label7 = [[[UILabel alloc] init] autorelease];
  label7.frame = CGRectMake( 0, top, 320, kBarHeight );
  label7.autoresizingMask = label1.autoresizingMask;
  label7.backgroundColor = [UIColor greenColor];
  [self.view addSubview:label7];

  top += kBarHeight;
  UILabel* label8 = [[[UILabel alloc] init] autorelease];
  label8.frame = CGRectMake( 0, top, 320, kBarHeight );
  label8.autoresizingMask = label1.autoresizingMask;
  label8.backgroundColor = [UIColor blueColor];
  [self.view addSubview:label8];

  top += kBarHeight;
  UILabel* label9 = [[[UILabel alloc] init] autorelease];
  label9.frame = CGRectMake( 0, top, 320, kBarHeight );
  label9.autoresizingMask = label1.autoresizingMask;
  label9.backgroundColor = [UIColor cyanColor];
  [self.view addSubview:label9];

  top += kBarHeight;
  UILabel* label10 = [[[UILabel alloc] init] autorelease];
  label10.frame = CGRectMake( 0, top, 320, kBarHeight );
  label10.autoresizingMask = label1.autoresizingMask;
  label10.backgroundColor = [UIColor yellowColor];
  [self.view addSubview:label10];

  top += kBarHeight;
  UILabel* label11 = [[[UILabel alloc] init] autorelease];
  label11.frame = CGRectMake( 0, top, 320, kBarHeight );
  label11.autoresizingMask = label1.autoresizingMask;
  label11.backgroundColor = [UIColor magentaColor];
  [self.view addSubview:label11];

  top += kBarHeight;
  UILabel* label12 = [[[UILabel alloc] init] autorelease];
  label12.frame = CGRectMake( 0, top, 320, kBarHeight );
  label12.autoresizingMask = label1.autoresizingMask;
  label12.backgroundColor = [UIColor orangeColor];
  [self.view addSubview:label12];

  top += kBarHeight;
  UILabel* label13 = [[[UILabel alloc] init] autorelease];
  label13.frame = CGRectMake( 0, top, 320, kBarHeight );
  label13.autoresizingMask = label1.autoresizingMask;
  label13.backgroundColor = [UIColor purpleColor];
  [self.view addSubview:label13];

  top += kBarHeight;
  UILabel* label14 = [[[UILabel alloc] init] autorelease];
  label14.frame = CGRectMake( 0, top, 320, kBarHeight );
  label14.autoresizingMask = label1.autoresizingMask;
  label14.backgroundColor = [UIColor brownColor];
  [self.view addSubview:label14];

  top += kBarHeight;
  UILabel* label15 = [[[UILabel alloc] init] autorelease];
  label15.frame = CGRectMake( 0, top, 320, kBarHeight );
  label15.autoresizingMask = label1.autoresizingMask;
  label15.backgroundColor = [UIColor clearColor];
  [self.view addSubview:label15];
}

@end
