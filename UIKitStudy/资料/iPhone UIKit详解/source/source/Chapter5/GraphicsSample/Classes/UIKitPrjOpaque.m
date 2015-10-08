//
//  UIKitPrjOpaque.m
//
//  Created by wang on 2011-09-24.
//

#import "UIKitPrjOpaque.h"

@implementation OpaqueTest

- (void)drawRect:(CGRect)rect {
  UIFont* systemFont = [UIFont systemFontOfSize:[UIFont systemFontSize]];
  [@"OPAQUE" drawAtPoint:CGPointMake( 0, 0 ) withFont:systemFont];
}

@end

@implementation UIKitPrjOpaque

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor grayColor];

  OpaqueTest* test11 = [[[OpaqueTest alloc] init] autorelease];
  test11.opaque = YES;
  test11.frame = CGRectMake( 50, 50, 100, 100 );

  OpaqueTest* test12 = [[[OpaqueTest alloc] init] autorelease];
  test12.opaque = NO;
  test12.frame = CGRectMake( 150, 50, 100, 100 );

  OpaqueTest* test21 = [[[OpaqueTest alloc] init] autorelease];
  test21.opaque = YES;
  test21.alpha = 0.0;
  test21.frame = CGRectMake( 50, 150, 100, 100 );

  OpaqueTest* test22 = [[[OpaqueTest alloc] init] autorelease];
  test22.opaque = YES;
  test22.backgroundColor = [UIColor whiteColor];
  test22.frame = CGRectMake( 150, 150, 100, 100 );

  [self.view addSubview:test11];
  [self.view addSubview:test12];
  [self.view addSubview:test21];
  [self.view addSubview:test22];
}

@end
