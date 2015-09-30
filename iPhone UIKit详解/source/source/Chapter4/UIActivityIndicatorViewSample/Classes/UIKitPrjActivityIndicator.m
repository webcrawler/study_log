//
//  UIKitPrjActivityIndicator.m
//
//  Created by wang on 2011-08-15.
//

#import "UIKitPrjActivityIndicator.h"

@implementation UIKitPrjActivityIndicator

- (void)dealloc {
  [indicator_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor lightGrayColor];

  UIBarButtonItem* playButton =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay
                                                   target:self
                                                   action:@selector(playDidPush)] autorelease];
  UIBarButtonItem* pauseButton =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPause
                                                   target:self
                                                   action:@selector(pauseDidPush)] autorelease];
  UIBarButtonItem* changeButton =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward
                                                   target:self
                                                   action:@selector(changeDidPush)] autorelease];
  NSArray* items = [NSArray arrayWithObjects:playButton, pauseButton, changeButton, nil];
  [self setToolbarItems:items animated:YES];

  indicator_ =
    [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
  [self.view addSubview:indicator_];
}

- (void)playDidPush {
  if ( UIActivityIndicatorViewStyleWhiteLarge == indicator_.activityIndicatorViewStyle ) {
    indicator_.frame = CGRectMake( 0, 0, 50, 50 );
  } else {
    indicator_.frame = CGRectMake( 0, 0, 20, 20 );
  }
  indicator_.center = self.view.center;
  [indicator_ startAnimating];
}

- (void)pauseDidPush {
  indicator_.hidesWhenStopped = NO;
  [indicator_ stopAnimating];
}

- (void)changeDidPush {
  [self pauseDidPush];
  if ( UIActivityIndicatorViewStyleGray < ++indicator_.activityIndicatorViewStyle ) {
    indicator_.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
  } 
  [self playDidPush];
}

@end
