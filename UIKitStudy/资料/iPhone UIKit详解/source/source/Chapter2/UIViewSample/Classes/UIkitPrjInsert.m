//
//  UIKitPrjInsert.m
//
//  Created by wang on 2011-08-05.
//

#import "UIKitPrjInsert.h"

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjInsert ()
- (void)subviewsDidPush;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjInsert

// finalize
- (void)dealloc {
  [parent_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // 将背景设置成黑色
  self.view.backgroundColor = [UIColor blackColor];

  // 追加父标签
  parent_ = [[UILabel alloc] initWithFrame:CGRectMake( 0, 0, 320, 320 )];
  parent_.textAlignment = UITextAlignmentCenter;
  parent_.text = @"PARENT";
  [self.view addSubview:parent_];

  // 追加1个子标签
  UILabel* child3 = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
  child3.text = @"CHILD 3";
  [child3 sizeToFit];
  [parent_ insertSubview:child3 atIndex:0];

  // 在上一个标签CHILD 3 下插入 CHILD 1 
  UILabel* child1 = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
  child1.text = @"CHILD 1";
  [child1 sizeToFit];
  [parent_ insertSubview:child1 belowSubview:child3];

  // 在CHILD 1 上追加 CHILD 2 
  UILabel* child2 = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
  child2.text = @"CHILD 2";
  [child2 sizeToFit];
  [parent_ insertSubview:child2 aboveSubview:child1];

  // 让CHILD 1 与 CHILD 3 交換
  [parent_ exchangeSubviewAtIndex:0 withSubviewAtIndex:2];

  // 如果CHILD 3 为 PARENT 子元素的话
  if ( [child3 isDescendantOfView:parent_] ) {
    // 删除CHILD 3 
    [child3 removeFromSuperview];
  } 


  // 追加subviews按钮
  UIButton* subviewsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  subviewsButton.frame = CGRectMake( 0, 0, 150, 40 );
  CGPoint newPoint = self.view.center;
  newPoint.y = self.view.frame.size.height - 40;
  subviewsButton.center = newPoint;
  [subviewsButton setTitle:@"显示subviews" forState:UIControlStateNormal];
  [subviewsButton addTarget:self
                     action:@selector(subviewsDidPush)
           forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:subviewsButton];
}

#pragma mark ----- Private Methods -----

- (void)subviewsDidPush {

  NSMutableString* subviews = [[[NSMutableString alloc] initWithCapacity:64] autorelease];
  [subviews setString:@""];

  // 在subviews的text后附加字符串
  for ( id view in parent_.subviews ) {
    NSString* addString;
    if ( [view isKindOfClass:[UILabel class]] ) {
      addString = ((UILabel*)view).text;
    } else {
      addString = [view description];
    }
    if ( [subviews length] > 0 ) {
      [subviews appendString:@", "];
    }
    [subviews appendString:addString];
  }

  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:@"subviews"
                                                   message:subviews
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil ] autorelease];

  [alert show];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
