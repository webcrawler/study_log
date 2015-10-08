//
//  UIKitPrjHide.m
//
//  Created by wang on 2011-08-05.
//

#import "UIKitPrjHide.h"

@implementation UIKitPrjHide

#pragma mark ----- Override Methods -----

// finalize
- (void)dealloc {
  [label_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];

  label_ = [[UILabel alloc] initWithFrame:CGRectMake( 0, 0, 320, 200 )];
  label_.textAlignment = UITextAlignmentCenter;
  label_.backgroundColor = [UIColor blackColor];
  label_.textColor = [UIColor whiteColor];
  label_.text = @"I'm here!";

  [self.view addSubview:label_];

  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button.frame = CGRectMake( 0, 0, 100, 40 );
  CGPoint newPoint = self.view.center;
  newPoint.y = self.view.frame.size.height - 70;
  button.center = newPoint;
  [button setTitle:@"Toggle" forState:UIControlStateNormal];
  [button addTarget:self action:@selector(buttonDidPush) forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:button];
}

- (void)buttonDidPush {
  label_.hidden = !label_.hidden;
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
