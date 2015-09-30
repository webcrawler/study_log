//
//  UIKitPrjTransparent.m
//
//  Created by wang on 2011-08-05.
//

#import "UIKitPrjTransparent.h"

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjTransparent ()
- (void)alphaDidPush;
- (void)bgAlphaDidPush;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjTransparent

// finalize
- (void)dealloc {
  [labelParent_ release]; 
  [labelChild1_ release]; 
  [labelChild2_ release]; 
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];

  // 追加透明时显示的图像
  UIImage* image = [UIImage imageNamed:@"dog.jpg"];
  UIImageView* imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
  imageView.frame = CGRectMake( 10, 10, 300, 300 );
  imageView.contentMode = UIViewContentModeScaleAspectFill;
  imageView.clipsToBounds = YES;
  [self.view addSubview:imageView];

  // 追加父标签
  labelParent_ = [[UILabel alloc] initWithFrame:CGRectMake( 0, 0, 300, 300 )];
  labelParent_.backgroundColor = [UIColor blackColor];
  labelParent_.textAlignment = UITextAlignmentCenter;
  labelParent_.text = @"Parent";
  [imageView addSubview:labelParent_];

  // 追加1个子标签
  labelChild1_ = [[UILabel alloc] initWithFrame:CGRectMake( 10, 190, 100, 100 )];
  labelChild1_.backgroundColor = [UIColor redColor];
  labelChild1_.textAlignment = UITextAlignmentCenter;
  labelChild1_.text = @"Child1";
  [labelParent_ addSubview:labelChild1_];

  // 追加第二个子标签
  labelChild2_ = [[UILabel alloc] initWithFrame:CGRectMake( 190, 190, 100, 100 )];
  labelChild2_.backgroundColor = [UIColor blueColor];
  labelChild2_.textAlignment = UITextAlignmentCenter;
  labelChild2_.text = @"Child2";
  [labelParent_ addSubview:labelChild2_];

  // 追加alpha按钮
  UIButton* alphaButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  alphaButton.frame = CGRectMake( 0, 0, 100, 40 );
  CGPoint newPoint = self.view.center;
  newPoint.x -= 50;
  newPoint.y = self.view.frame.size.height - 100;
  alphaButton.center = newPoint;
  [alphaButton setTitle:@"alpha" forState:UIControlStateNormal];
  [alphaButton addTarget:self
                  action:@selector(alphaDidPush)
        forControlEvents:UIControlEventTouchUpInside];


  // 追加bgAlpha按钮
  UIButton* bgAlphaButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  bgAlphaButton.frame = CGRectMake( 0, 0, 100, 40 );
  newPoint.x += 100;
  bgAlphaButton.center = newPoint;
  [bgAlphaButton setTitle:@"bgAlpha" forState:UIControlStateNormal];
  [bgAlphaButton addTarget:self
                    action:@selector(bgAlphaDidPush)
          forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:alphaButton];
  [self.view addSubview:bgAlphaButton];
}

#pragma mark ----- Private Methods -----

- (void)alphaDidPush {
  labelParent_.backgroundColor = [UIColor blackColor];
  labelParent_.alpha = 0.25;
}

- (void)bgAlphaDidPush {
  labelParent_.alpha = 1.0;
  labelParent_.backgroundColor = [labelParent_.backgroundColor colorWithAlphaComponent:0.25];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
