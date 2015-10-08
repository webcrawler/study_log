//
//  UIKitPrjNetworkActivityIndicator.m
//
//  Created by wang on 2011-09-19.
//

#import "UIKitPrjNetworkActivityIndicator.h"

@implementation UIKitPrjNetworkActivityIndicator

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  UIApplication* application = [UIApplication sharedApplication];
  application.networkActivityIndicatorVisible = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  UIApplication* application = [UIApplication sharedApplication];
  application.networkActivityIndicatorVisible = NO;
}

@end
