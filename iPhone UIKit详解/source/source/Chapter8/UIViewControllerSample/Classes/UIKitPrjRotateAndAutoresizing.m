//
//  UIKitPrjRotateAndAutoresizing.m
//
//  Created by Wang on 2011-08-16.
//

#import "UIKitPrjRotateAndAutoresizing.h"

@implementation UIKitPrjRotateAndAutoresizing

- (void)dealloc {
  [imageView_ release]; 
  [super dealloc];
}

#pragma mark ----- Override Methods -----

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"Rotate";
  self.view.backgroundColor = [UIColor blackColor];
  //创建图像的UIImageView实例
  UIImage* image = [UIImage imageNamed:@"town.jpg"];
  imageView_ = [[UIImageView alloc] initWithImage:image];
  //设置此项后，当imageView_的尺寸发生变化时，其中的图像比例不会改变
  imageView_.contentMode = UIViewContentModeScaleAspectFill;
  //将clipsToBounds设置成YES后，超出frame以外的图像不再绘制
  imageView_.clipsToBounds = YES;
  //向autoresizingMask设置此两常量后，将随着母体View的变化改变图像宽度与高度
  imageView_.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;  

  [self.view addSubview:imageView_];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:YES];

  [self.navigationController setNavigationBarHidden:NO animated:NO];
  [self.navigationController setToolbarHidden:NO animated:NO];

}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:YES];

  imageView_.frame = CGRectInset( self.view.bounds, 20, 20 );
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

@end
