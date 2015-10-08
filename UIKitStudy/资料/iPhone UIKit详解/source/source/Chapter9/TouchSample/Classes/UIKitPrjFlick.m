//
//  UIKitPrjFlick.m
//
//  Created by wang on 2011-08-30.
//

#import "UIKitPrjFlick.h"

@implementation UIKitPrjFlick

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark ----- Responder -----

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  // 保存触摸时间与位置
  UITouch* touch = [touches anyObject];
  timestampBegan_ = event.timestamp;
  pointBegan_ = [touch locationInView:self.view];
}


- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  static const NSTimeInterval kFlickJudgeTimeInterval = 0.3;
  static const NSInteger kFlickMinimumDistance = 10;
  UITouch* touchEnded = [touches anyObject];
  CGPoint pointEnded = [touchEnded locationInView:self.view];
  NSInteger distanceHorizontal = ABS( pointEnded.x - pointBegan_.x );
  NSInteger distanceVertical = ABS( pointEnded.y - pointBegan_.y );
  if ( kFlickMinimumDistance > distanceHorizontal && kFlickMinimumDistance > distanceVertical ) {
    // 纵向与横向如果几乎都没有移动的话，方法返回（return）
    return;
  } 
  NSTimeInterval timeBeganToEnded = event.timestamp - timestampBegan_;
  if ( kFlickJudgeTimeInterval > timeBeganToEnded ) {
    // 快速滑动处理
    NSString* message;
    // 判断向那个方向滑动
    if ( distanceHorizontal > distanceVertical ) {
      if ( pointEnded.x > pointBegan_.x ) {
        message = @"检测到右滑动！";
      } else {
        message = @"检测到左滑动！";
      }
    } else {
      if ( pointEnded.y > pointBegan_.y ) {
        message = @"检测到下滑动！";
      } else {
        message = @"检测到上滑动！";
      }
    }
    UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                     message:message
                                                    delegate:nil
                                           cancelButtonTitle:nil
                                           otherButtonTitles:@"OK", nil] autorelease];
    [alert show];
  } 
}

@end
