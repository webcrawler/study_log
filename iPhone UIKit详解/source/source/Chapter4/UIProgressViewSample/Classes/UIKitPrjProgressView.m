//
//  UIKitPrjProgressView.m
//
//  Created by wang on 2011-10-04.
//

#import "UIKitPrjProgressView.h"

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjProgressView ()
- (void)updateProgress:(UIProgressView*)progressView;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjProgressView

- (void)dealloc {
  [progressView_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  progressView_ =
    [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
  progressView_.center = self.view.center;
  progressView_.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
                                   UIViewAutoresizingFlexibleBottomMargin;
  [self.view addSubview:progressView_];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self updateProgress:progressView_];
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  progressView_.hidden = YES;
}

- (void)updateProgress:(UIProgressView*)progressView {
  if ( [progressView isHidden] || 1.0 <= progressView.progress ) {
    return;
  } 
  progressView.progress += 0.1;
  [self performSelector:@selector(updateProgress:)
             withObject:progressView
             afterDelay:1.0];
}

@end
