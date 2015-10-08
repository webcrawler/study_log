//
//  UIKitPrjPatternImage.m
//
//  Created by wang on 2011-10-15.
//

#import "UIKitPrjPatternImage.h"

@implementation UIKitPrjPatternImage

- (void)viewDidLoad {
  [super viewDidLoad];

  UILabel* label = [[[UILabel alloc] init] autorelease];
  label.frame = self.view.bounds;
  label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  UIImage* image = [UIImage imageNamed:@"dog.png"];
  label.backgroundColor = [UIColor colorWithPatternImage:image];
  [self.view addSubview:label];
}

@end
