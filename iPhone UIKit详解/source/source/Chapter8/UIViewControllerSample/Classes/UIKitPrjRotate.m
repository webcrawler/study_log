//
//  UIKitPrjRotate.m
//
//  Created by ToKoRo on 2009-08-22.
//

#import "UIKitPrjRotate.h"

@implementation UIKitPrjRotate


- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"Rotate";
  self.view.backgroundColor = [UIColor blackColor];

  UIImage* image = [UIImage imageNamed:@"town.jpg"];
  UIImageView* imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
  imageView.frame = CGRectMake( 30, 0, 240, 240 );
  imageView.contentMode = UIViewContentModeScaleAspectFit;
  
  [self.view addSubview:imageView];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];

  [self.navigationController setNavigationBarHidden:NO animated:NO];
  [self.navigationController setToolbarHidden:NO animated:NO];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

@end
