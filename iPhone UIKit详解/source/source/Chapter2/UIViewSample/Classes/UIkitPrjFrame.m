//
//  UIKitPrjFrame.m
//
//  Created by wang on 2011-08-05.
//

#import "UIKitPrjFrame.h"

@implementation UIKitPrjFrame

#pragma mark ----- Override Methods -----

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];

  UILabel* label1 = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
  label1.text = @"右上方";

  // 将label1的frame修改成任意的区域
  CGRect newFrame = CGRectMake( 220, 20, 100, 50 );
  label1.frame = newFrame;

  UILabel* label2 = [[[UILabel alloc] initWithFrame:[label1 frame]] autorelease];
  label2.textAlignment = UITextAlignmentCenter;
  label2.text = @"中心位置";

  // 将label2的center調整到画面中心
  CGPoint newPoint = self.view.center;
  // 空出状态条高度大小
  newPoint.y -= 20;
  label2.center = newPoint;

  // 向画面中追加label1 与 label2 
  [self.view addSubview:label1];
  [self.view addSubview:label2];

  /* sample
  UILabel* label = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
  // frame的设置
  label.frame = CGRectMake( 0, 0, 200, 50 );
  // center设置
  label.center = CGPointMake( 160, 240 );
  // frame的参照
  NSLog( @"x = %f", label.frame.origin.x );
  NSLog( @"y = %f", label.frame.origin.y );
  NSLog( @"width = %f", label.frame.size.width );
  NSLog( @"height = %f", label.frame.size.height );
  // center的参照
  NSLog( @"x = %f", label.center.x );
  NSLog( @"y = %f", label.center.y );
  */
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
