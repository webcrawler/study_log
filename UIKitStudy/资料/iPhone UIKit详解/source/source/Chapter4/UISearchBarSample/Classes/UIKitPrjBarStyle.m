//
//  UIKitPrjBarStyle.m
//
//  Created by wang on 2011-10-06.
//

#import "UIKitPrjBarStyle.h"

@implementation UIKitPrjBarStyle

- (void)viewDidLoad {
  [super viewDidLoad];

  searchBar_.barStyle = UIBarStyleBlack;
  searchBar_.translucent = YES;
  searchBar_.tintColor = nil;

  UIBarButtonItem* blackButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"black"
                                      style:UIBarButtonItemStyleDone
                                     target:self
                                     action:@selector(blackDidPush:)] autorelease];
  UIBarButtonItem* translucentButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"translucent"
                                      style:UIBarButtonItemStyleDone
                                     target:self
                                     action:@selector(translucentDidPush:)] autorelease];
  UIBarButtonItem* tintButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"tintColor"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(tintDidPush:)] autorelease];
  NSArray* items = [NSArray arrayWithObjects:blackButton, translucentButton, tintButton, nil];
  [self setToolbarItems:items animated:NO];
}

- (void)blackDidPush:(UIBarButtonItem*)sender {
  if ( UIBarButtonItemStyleDone == sender.style ) {
    searchBar_.barStyle = UIBarStyleDefault;
    sender.style = UIBarButtonItemStyleBordered;
  } else {
    searchBar_.barStyle = UIBarStyleBlack;
    sender.style = UIBarButtonItemStyleDone;
  }
}

- (void)translucentDidPush:(UIBarButtonItem*)sender {
  if ( UIBarButtonItemStyleDone == sender.style ) {
    searchBar_.translucent = NO;
    sender.style = UIBarButtonItemStyleBordered;
  } else {
    searchBar_.translucent = YES;
    sender.style = UIBarButtonItemStyleDone;
  }
}

- (void)tintDidPush:(UIBarButtonItem*)sender {
  if ( UIBarButtonItemStyleDone == sender.style ) {
    searchBar_.tintColor = nil;
    sender.style = UIBarButtonItemStyleBordered;
  } else {
    searchBar_.tintColor = [UIColor redColor];
    sender.style = UIBarButtonItemStyleDone;
  }
}

@end
