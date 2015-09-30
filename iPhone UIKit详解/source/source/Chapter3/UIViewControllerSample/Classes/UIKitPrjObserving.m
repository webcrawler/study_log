//
//  UIKitPrjObserving.m
//
//  Created by Wang on 2011-08-16.
//

#import "UIKitPrjObserving.h"

@implementation UIKitPrjObserving

// finalize
- (void)dealloc {
  NSLog( @"dealloc" );
  [imageView_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  NSLog( @"viewDidLoad" );
  NSLog( @"%d", [self isViewLoaded] );
  [super viewDidLoad];

  UIImage* image = [UIImage imageNamed:@"town.jpg"];
  imageView_ = [[UIImageView alloc] initWithImage:image];
  imageView_.frame = self.view.bounds;
  imageView_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:imageView_];

  count_ = self.navigationController.viewControllers.count;
}

- (void)loadView {
  NSLog( @"loadView" );
  NSLog( @"before loadView: %d", [self isViewLoaded] );
  [super loadView];
  NSLog( @"after loadView: %d", [self isViewLoaded] );
}

- (void)viewDidUnload {
  NSLog( @"### viewDidUnload %d", count_ );
  [super viewDidUnload];

  [imageView_ release];
  imageView_ = nil;
}

- (void)viewWillAppear:(BOOL)animated {
  NSLog( @"viewWillAppear" );
  NSLog( @"%d", [self isViewLoaded] );
  [super viewWillAppear:animated];
  [self.navigationController setNavigationBarHidden:NO animated:NO];
  [self.navigationController setToolbarHidden:NO animated:NO];
}

- (void)viewDidAppear:(BOOL)animated {
  NSLog( @"viewDidAppear" );
  [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
  NSLog( @"viewWillDisappear" );
  [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
  NSLog( @"viewDidDisappear" );
  [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
  NSLog( @"# didReceiveMemoryWarning %d", count_ );
  [super didReceiveMemoryWarning];
}

#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  id nextViewController = [[[UIKitPrjObserving alloc] init] autorelease];
  [self.navigationController pushViewController:nextViewController animated:YES];
}

@end
