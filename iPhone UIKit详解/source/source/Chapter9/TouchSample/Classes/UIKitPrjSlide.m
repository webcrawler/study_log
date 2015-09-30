//
//  UIKitPrjSlide.m
//
//  Created by wang on 2011-08-30.
//

#import "UIKitPrjSlide.h"

@implementation UIKitPrjSlide

- (void)dealloc {
  [label_ release];  
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor blackColor];

  label_ = [[UILabel alloc] init];
  label_.frame = self.view.bounds;
  label_.backgroundColor = [UIColor whiteColor];
  label_.textAlignment = UITextAlignmentCenter;
  label_.text = @"可上下左右滑动";
  label_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:label_];

  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(suspend)
                                               name:UIApplicationWillResignActiveNotification
                                             object:nil];
}

#pragma mark ----- Responder -----

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  // 保存触摸位置
  touchBegan_ = [[touches anyObject] locationInView:self.view];
  // 保存标签原位置
  labelOrigin_ = label_.center;
  // 初始化运动方向
  direction_ = kSlideNone;
}

- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
  static const NSInteger kNeedMove = 10;
  CGPoint point = [[touches anyObject] locationInView:self.view];
  // 计算初始触摸位置与当前位置的坐标差
  NSInteger distanceHorizontal = point.x - touchBegan_.x;
  NSInteger distanceVertical = point.y - touchBegan_.y;

  if ( kSlideNone == direction_ ) {
    // 判断运动方向
    if ( ABS( distanceHorizontal ) > ABS( distanceVertical )  ) {
      // 横向运动
      if ( kNeedMove <= ABS( distanceHorizontal ) ) {
        direction_ = kSlideHorizontal;
      } 
    } else {
      // 纵向运动
      if ( kNeedMove <= ABS( distanceVertical ) ) {
        direction_ = kSlideVertical;
      } 
    }
  }
  if ( kSlideNone != direction_ ) {
    // 判断运动距离
    CGPoint newPoint = labelOrigin_;
    if ( kSlideHorizontal == direction_ ) {
      newPoint.x += distanceHorizontal;
    } else {
      newPoint.y += distanceVertical;
    }
    // 移动的目标点
    label_.center = newPoint;
  }
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  // 放开手指的话，标签返回原位置
  [UIView beginAnimations:nil context:nil];
  label_.center = self.view.center;
  [UIView commitAnimations];
}

- (void)touchesCancelled:(NSSet*)touches withEvent:(UIEvent*)event {
  [self touchesEnded:touches withEvent:event];
}

- (void)suspend {
  [self touchesCancelled:nil withEvent:nil];
}

@end
