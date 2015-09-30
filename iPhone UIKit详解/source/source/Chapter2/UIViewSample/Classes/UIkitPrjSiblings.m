//
//  UIKitPrjSiblings.m
//
//  Created by wang on 2011-08-05.
//

#import "UIKitPrjSiblings.h"

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjSiblings ()
- (void)bringFrontDidPush;
- (void)sendBackDidPush;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjSiblings

// finalize
- (void)dealloc {
  [labelA_ release];  
  [labelB_ release];  
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  // 追加标签A
  labelA_ = [[UILabel alloc] initWithFrame:CGRectMake( 10, 10, 150, 150 )];
  labelA_.backgroundColor = [UIColor redColor];
  labelA_.textAlignment = UITextAlignmentCenter;
  labelA_.text = @"A";
  [self.view addSubview:labelA_];

  // 追加标签B
  labelB_ = [[UILabel alloc] initWithFrame:CGRectMake( 100, 100, 150, 150 )];
  labelB_.backgroundColor = [UIColor blueColor];
  labelB_.textAlignment = UITextAlignmentCenter;
  labelB_.text = @"B";
  [self.view addSubview:labelB_];

  // 追加bringFront按钮
  UIButton* bringFrontButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  bringFrontButton.frame = CGRectMake( 0, 0, 100, 40 );
  CGPoint newPoint = self.view.center;
  newPoint.x -= 50;
  newPoint.y = self.view.frame.size.height - 100;
  bringFrontButton.center = newPoint;
  [bringFrontButton setTitle:@"bringFront" forState:UIControlStateNormal];
  [bringFrontButton addTarget:self
                       action:@selector(bringFrontDidPush)
            forControlEvents:UIControlEventTouchUpInside];


  // 追加sendBack按钮
  UIButton* sendBackButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  sendBackButton.frame = CGRectMake( 0, 0, 100, 40 );
  newPoint.x += 100;
  sendBackButton.center = newPoint;
  [sendBackButton setTitle:@"sendBack" forState:UIControlStateNormal];
  [sendBackButton addTarget:self
                     action:@selector(sendBackDidPush)
           forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:bringFrontButton];
  [self.view addSubview:sendBackButton];
}

#pragma mark ----- Private Methods -----

- (void)bringFrontDidPush {
  [self.view bringSubviewToFront:labelA_];
}

- (void)sendBackDidPush {
  [self.view sendSubviewToBack:labelA_];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
