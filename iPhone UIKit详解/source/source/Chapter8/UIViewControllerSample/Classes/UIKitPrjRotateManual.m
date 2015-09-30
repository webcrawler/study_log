//
//  UIKitPrjRotateManual.m
//
//  Created by Wang on 2011-08-16.
//

#import "UIKitPrjRotateManual.h"

@implementation UIKitPrjRotateManual

- (void)dealloc {
  [imageView1_ release]; 
  [imageView2_ release]; 
  [super dealloc];
}

#pragma mark ----- Override Methods -----
//初始化实例变量imageView1_以及imageView2_，其中放置图像。
- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"Rotate";
  self.view.backgroundColor = [UIColor blackColor];
  //追加第一个图像
  UIImage* image1 = [UIImage imageNamed:@"town.jpg"];
  imageView1_ = [[UIImageView alloc] initWithImage:image1];
  imageView1_.contentMode = UIViewContentModeScaleAspectFill;
  imageView1_.clipsToBounds = YES;
  //在autoresizingMask属性中设置所有的自动调整参数
  imageView1_.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight
                                  | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin
                                  | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;  
  CGSize frameSize = self.view.frame.size;
  //将图像布置在画面的上半部分
  imageView1_.frame = CGRectMake( 0, 0, frameSize.width, frameSize.height / 2 );
  [self.view addSubview:imageView1_];
  //追加第二个图像
  UIImage* image2 = [UIImage imageNamed:@"dog.jpg"];
  imageView2_ = [[UIImageView alloc] initWithImage:image2];
  imageView2_.contentMode = UIViewContentModeScaleAspectFill;
  imageView2_.clipsToBounds = YES;
  imageView2_.autoresizingMask = imageView1_.autoresizingMask;
  //将图像布置在画面下半部分
  imageView2_.frame = CGRectMake( 0, frameSize.height / 2, frameSize.width, frameSize.height / 2 );
  [self.view addSubview:imageView2_];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:YES];
  [self.navigationController setNavigationBarHidden:NO animated:NO];
  [self.navigationController setToolbarHidden:NO animated:NO];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
  duration:(NSTimeInterval)duration
{
  NSLog( @"willRotateToInterfaceOrientation" );
}
//定制画面旋转后的布局
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
  duration:(NSTimeInterval)duration
{

  CGSize frameSize = self.view.frame.size;
  //画面旋转后根据画面的朝向进行布局定制
  switch ( interfaceOrientation ) {
    case UIInterfaceOrientationPortrait:
    case UIInterfaceOrientationPortraitUpsideDown:
	  //画面朝向为纵向的情况下
	  //将第一个图像布置在画面上方
      imageView1_.frame = CGRectMake( 0, 0, frameSize.width, frameSize.height / 2 );
	  //将第二个图像布置在画面下方
      imageView2_.frame = CGRectMake( 0, frameSize.height / 2, frameSize.width, frameSize.height / 2 );
      break;
    default:
	  //画面朝向为横向的情况下
	  //将第一个图像布置在画面左半部分
      imageView1_.frame = CGRectMake( 0, 0, frameSize.width / 2, frameSize.height );
	  //将第二个图像布置在画面右半部分
      imageView2_.frame = CGRectMake( frameSize.width / 2, 0, frameSize.width / 2, frameSize.height );
      break;
  }
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
  NSLog( @"didRotateFromInterfaceOrientation" );
}

@end
