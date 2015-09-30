//
//  UIKitPrjMomentary.m
//
//  Created by wang on 2011-10-01.
//

#import "UIKitPrjMomentary.h"

@implementation UIKitPrjMomentary

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];

  NSArray* items = [NSArray arrayWithObjects:@"Black", @"White", nil];
  UISegmentedControl* segment =
    [[[UISegmentedControl alloc] initWithItems:items] autorelease];
  segment.momentary = YES;
  segment.frame = CGRectMake( 0, 0, 130, 30 );
  [segment addTarget:self
              action:@selector(segmentDidChange:)
       forControlEvents:UIControlEventValueChanged];
  UIBarButtonItem* barButton =
    [[[UIBarButtonItem alloc] initWithCustomView:segment] autorelease];
  self.navigationItem.rightBarButtonItem = barButton;
}

- (void)segmentDidChange:(id)sender {
  if ( [sender isKindOfClass:[UISegmentedControl class]] ) {
    UISegmentedControl* segment = sender;
    if ( 0 == segment.selectedSegmentIndex ) {
      self.view.backgroundColor = [UIColor blackColor];
    } else {
      self.view.backgroundColor = [UIColor whiteColor];
    }
  } 
}

@end
