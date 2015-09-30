//
//  UIKitPrjAutoResize.m
//
//  Created by wang on 2011-08-05.
//

#import "UIKitPrjAutoResize.h"

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjAutoResize ()
- (void)resizeDidPush;
- (void)leftDidSwitch:(id)sender;
- (void)rightDidSwitch:(id)sender;
- (void)topDidSwitch:(id)sender;
- (void)bottomDidSwitch:(id)sender;
- (void)widthDidSwitch:(id)sender;
- (void)heightDidSwitch:(id)sender;
- (void)addSwitch:(NSString*)caption frame:(CGRect)frame action:(SEL)action;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjAutoResize

// finalize
- (void)dealloc {
  [child_ release];
  [parent_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // 背景设置成黑色
  self.view.backgroundColor = [UIColor blackColor];

  // 追加父标签
  parent_ = [[UILabel alloc] initWithFrame:CGRectMake( 0, 0, 160, 160 )];
  parent_.backgroundColor = [UIColor whiteColor];
  [self.view addSubview:parent_];

  // 追加一个子元素标签
  child_ = [[UILabel alloc] initWithFrame:CGRectInset( parent_.bounds, 30, 30 )];
  child_.text = @"CHILD 1";
  child_.backgroundColor = [UIColor redColor];
  child_.textColor = [UIColor blackColor];
  [parent_ addSubview:child_];

  // 追加Resize按钮
  UIButton* resizeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  resizeButton.frame = CGRectMake( 0, 0, 150, 40 );
  CGPoint newPoint = self.view.center;
  newPoint.y = self.view.frame.size.height - 40;
  resizeButton.center = newPoint;
  [resizeButton setTitle:@"Resize" forState:UIControlStateNormal];
  [resizeButton addTarget:self
                   action:@selector(resizeDidPush)
         forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:resizeButton];

  // 追加Switch
  CGRect labelRect = CGRectMake( 5, 201, 310, 30 );
  [self addSwitch:@"FlexibleLeftMargin" frame:labelRect action:@selector(leftDidSwitch:)];
  labelRect.origin = CGPointMake( 5, labelRect.origin.y + 30 );
  [self addSwitch:@"FlexibleRightMargin" frame:labelRect action:@selector(rightDidSwitch:)];
  labelRect.origin = CGPointMake( 5, labelRect.origin.y + 30 );
  [self addSwitch:@"FlexibleTopMargin" frame:labelRect action:@selector(topDidSwitch:)];
  labelRect.origin = CGPointMake( 5, labelRect.origin.y + 30 );
  [self addSwitch:@"FlexibleBottomMargin" frame:labelRect action:@selector(bottomDidSwitch:)];
  labelRect.origin = CGPointMake( 5, labelRect.origin.y + 30 );
  [self addSwitch:@"FlexibleWidth" frame:labelRect action:@selector(widthDidSwitch:)];
  labelRect.origin = CGPointMake( 5, labelRect.origin.y + 30 );
  [self addSwitch:@"FlexibleHeight" frame:labelRect action:@selector(heightDidSwitch:)];
}

#pragma mark ----- Private Methods -----

- (void)resizeDidPush {
  if ( 200 == parent_.frame.size.width ) {
    parent_.frame = CGRectMake( 0, 0, 160, 160 );
  } else {
    parent_.frame = CGRectMake( 0, 0, 200, 200 );
  }
}

- (void)leftDidSwitch:(id)sender {
  if ( [sender isOn] ) {
    child_.autoresizingMask |= UIViewAutoresizingFlexibleLeftMargin;
  } else {
    child_.autoresizingMask &= ~UIViewAutoresizingFlexibleLeftMargin; 
  }
}

- (void)rightDidSwitch:(id)sender {
  if ( [sender isOn] ) {
    child_.autoresizingMask |= UIViewAutoresizingFlexibleRightMargin;
  } else {
    child_.autoresizingMask &= ~UIViewAutoresizingFlexibleRightMargin; 
  }
}

- (void)topDidSwitch:(id)sender {
  if ( [sender isOn] ) {
    child_.autoresizingMask |= UIViewAutoresizingFlexibleTopMargin;
  } else {
    child_.autoresizingMask &= ~UIViewAutoresizingFlexibleTopMargin; 
  }
}

- (void)bottomDidSwitch:(id)sender {
  if ( [sender isOn] ) {
    child_.autoresizingMask |= UIViewAutoresizingFlexibleBottomMargin;
  } else {
    child_.autoresizingMask &= ~UIViewAutoresizingFlexibleBottomMargin; 
  }
}

- (void)widthDidSwitch:(id)sender {
  if ( [sender isOn] ) {
    child_.autoresizingMask |= UIViewAutoresizingFlexibleWidth;
  } else {
    child_.autoresizingMask &= ~UIViewAutoresizingFlexibleWidth;
  }
}

- (void)heightDidSwitch:(id)sender {
  if ( [sender isOn] ) {
    child_.autoresizingMask |= UIViewAutoresizingFlexibleHeight;
  } else {
    child_.autoresizingMask &= ~UIViewAutoresizingFlexibleHeight;
  }
}

- (void)addSwitch:(NSString*)caption frame:(CGRect)frame action:(SEL)action {

  UILabel* label = [[[UILabel alloc] initWithFrame:frame] autorelease];
  label.text = caption;
  UISwitch* newSwitch = [[[UISwitch alloc] initWithFrame:CGRectZero] autorelease];
  CGPoint newPoint = label.center;
  newPoint.x += 100;
  newSwitch.center = newPoint;
  [newSwitch addTarget:self action:action forControlEvents:UIControlEventValueChanged];
  [self.view addSubview:label];
  [self.view addSubview:newSwitch];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
