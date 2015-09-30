//
//  UIKitPrjTag.m
//
//  Created by wang on 2011-08-05.
//

#import "UIKitPrjTag.h"

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjTag ()
- (void)searchDidPush;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjTag

// finalize
- (void)dealloc {
  [parent_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // 背景设置成黑色
  self.view.backgroundColor = [UIColor blackColor];

  // 追加父标签
  parent_ = [[UILabel alloc] initWithFrame:CGRectMake( 0, 0, 320, 320 )];
  parent_.textAlignment = UITextAlignmentCenter;
  parent_.text = @"PARENT";
  [self.view addSubview:parent_];

  // 追加10个子标签
  for ( int i = 1; i <= 10; ++i ){
    UILabel* child = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
    child.text = [NSString stringWithFormat:@"CHILD %d", i];
    [child sizeToFit];
    CGPoint newPoint = child.center;
    newPoint.y += 30 * i;
    child.center = newPoint;
    [parent_ addSubview:child];
    // 将第８个标签的tag设置成999
    if ( 8 == i ) {
      child.tag = 999;
    } 
  }

  // 追加search按钮
  UIButton* searchButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  searchButton.frame = CGRectMake( 0, 0, 150, 40 );
  CGPoint newPoint = self.view.center;
  newPoint.y = self.view.frame.size.height - 40;
  searchButton.center = newPoint;
  [searchButton setTitle:@"search 999" forState:UIControlStateNormal];
  [searchButton addTarget:self
                   action:@selector(searchDidPush)
         forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:searchButton];
}

#pragma mark ----- Private Methods -----

- (void)searchDidPush {

  NSString* message;
  //从parent_的子元素中检索tag为999的元素，找到后显示警告框
  UILabel* label = (UILabel*)[parent_ viewWithTag:999];
  if ( label ) {
    message = label.text;
  } else {
    message = @"nothing";
  }

  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:@"search 999"
                                                   message:message
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil ] autorelease];

  [alert show];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end

