//
//  UIKitPrjBadge.m
//
//  Created by wang on 2011-10-01.
//

#import "UIKitPrjBadge.h"

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjBadge ()
- (void)updateLabel:(UILabel*)label withNumber:(NSInteger)number;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjBadge

- (void)dealloc {
  [label_ release];  
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  label_ = [[UILabel alloc] init];
  label_.frame = self.view.bounds;
  label_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label_.textAlignment = UITextAlignmentCenter;
  label_.backgroundColor = [UIColor blackColor];
  label_.textColor = [UIColor whiteColor];
  label_.font = [UIFont systemFontOfSize:128];
  [self.view addSubview:label_];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  badgeNumber_ = [UIApplication sharedApplication].applicationIconBadgeNumber;
  [self updateLabel:label_ withNumber:badgeNumber_];
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  [UIApplication sharedApplication].applicationIconBadgeNumber = badgeNumber_;
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  if ( 1 < [[touches anyObject] tapCount] ) {
    badgeNumber_ = 0;
  } else {
    ++badgeNumber_;
  }
  [self updateLabel:label_ withNumber:badgeNumber_];
}

#pragma mark ----- Private Methods -----

- (void)updateLabel:(UILabel*)label withNumber:(NSInteger)number {
  label.text = [NSString stringWithFormat:@"%d", number];
}

@end
