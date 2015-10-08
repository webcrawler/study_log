//
//  UIKitPrjChangeTextByState.m
//
//  Created by wang on 2011-08-15.
//

#import "UIKitPrjChangeTextByState.h"

@implementation UIKitPrjChangeTextByState

- (void)dealloc {
  [button_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  button_ = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
  button_.frame = CGRectMake( 0, 0, 200, 60 );
  button_.center = self.view.center;
  button_.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                            UIViewAutoresizingFlexibleRightMargin |
                            UIViewAutoresizingFlexibleTopMargin |
                            UIViewAutoresizingFlexibleBottomMargin;
  [self.view addSubview:button_];
  //设置按钮标题字体及阴影颜色
  button_.titleLabel.font = [UIFont boldSystemFontOfSize:24];
  button_.titleLabel.shadowOffset = CGSizeMake( 1.0, 1.0 );
  //设置通常状态下的显示特征
  [button_ setTitle:@"StateNormal" forState:UIControlStateNormal];
  [button_ setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [button_ setTitleShadowColor:[UIColor grayColor] forState:UIControlStateNormal];
  //设置按钮被触摸时即高亮状态下的显示特征
  [button_ setTitle:@"StateHighlighted" forState:UIControlStateHighlighted];
  [button_ setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
  [button_ setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
  //设置按钮非活性（无效）状态下的显示特征
  [button_ setTitle:@"StateDisable" forState:UIControlStateDisabled];
  [button_ setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
  [button_ setTitleShadowColor:[UIColor blackColor] forState:UIControlStateDisabled];

  UIBarButtonItem* disableButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"DISABLE"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(disableDidPush)] autorelease];
  NSArray* barButtons = [NSArray arrayWithObjects:disableButton, nil];
  [self setToolbarItems:barButtons animated:YES];
}

- (void)disableDidPush {
  button_.enabled = !button_.enabled;
}

@end
