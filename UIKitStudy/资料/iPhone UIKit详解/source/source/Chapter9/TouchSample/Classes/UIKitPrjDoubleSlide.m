//
//  UIKitPrjDoubleSlide.m
//
//  Created by wang on 2011-08-30.
//

#import "UIKitPrjDoubleSlide.h"

@implementation UIKitPrjDoubleSlide

- (void)dealloc {
  [label_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];
  self.view.multipleTouchEnabled = YES;

  label_ = [[UILabel alloc] init];
  label_.frame = self.view.bounds;
  label_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label_.textAlignment = UITextAlignmentCenter;
  label_.text = @"2个手指滑动后可让屏幕上下移动";
  [self.view addSubview:label_];
}

#pragma mark ----- Responder -----

- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
  if ( 2 == [touches count] ) {
    // 2个手指触摸的情况下计算各自纵向的移动距离
    NSInteger distance[2];
    int i = 0;
    for ( UITouch* touch in touches ) {
      CGPoint before = [touch previousLocationInView:self.view];
      CGPoint now = [touch locationInView:self.view];
      distance[i] = now.y - before.y;
      ++i;
    }
    CGPoint newPoint = label_.center;
    if ( 0 < distance[0] && 0 < distance[1] ) {
      // 双方都向下移动的话，标签也向下移动
      newPoint.y += MAX( distance[0], distance[1] );
    } else if ( 0 > distance[0] && 0 > distance[1] ) {
      // 双方都向上移动的话，标签也向上移动
      newPoint.y += MAX( distance[0], distance[1] );
    } 
    label_.center = newPoint;
  } 
}

@end
