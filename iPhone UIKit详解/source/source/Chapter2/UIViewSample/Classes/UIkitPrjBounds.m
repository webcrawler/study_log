//
//  UIKitPrjBounds.m
//
//  Created by wang on 2011-08-05.
//

#import "UIKitPrjBounds.h"

@implementation UIKitPrjBounds

- (void)viewDidLoad {
  [super viewDidLoad];

  // 背景设置为黑色
  self.view.backgroundColor = [UIColor blackColor];

  // 追加图片View
  NSString* path = [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], @"dog.jpg"];
  UIImage* image = [[[UIImage alloc] initWithContentsOfFile:path] autorelease];
  UIImageView* imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
  imageView.backgroundColor = [UIColor grayColor];
  imageView.frame = CGRectMake( imageView.frame.origin.x, imageView.frame.origin.y, 100, 100 );
  imageView.clipsToBounds = YES;
  imageView.contentMode = UIViewContentModeRedraw;
//  CGPoint newPoint = self.view.center;
//  newPoint.y = self.view.center.y - 60;
//  imageView.center = newPoint;
  imageView.frame = CGRectMake( 5, 5, 73, 88 );
  imageView.bounds = CGRectMake( 50, 100, 73, 88 );
  [self.view addSubview:imageView];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
