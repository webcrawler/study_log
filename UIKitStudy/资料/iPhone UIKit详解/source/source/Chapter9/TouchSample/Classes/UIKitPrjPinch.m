//
//  UIKitPrjPinch.m
//
//  Created by wang on 2011-08-30.
//

#import "UIKitPrjPinch.h"
#import <math.h>

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjPinch ()
- (CGFloat)distanceWithPointA:(CGPoint)pointA pointB:(CGPoint)pointB;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjPinch

- (void)dealloc {
  [imageView_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];
  self.view.multipleTouchEnabled = YES;

  UIImage* image = [UIImage imageNamed:@"dog.jpg"];
  imageView_ = [[UIImageView alloc] initWithImage:image];
  imageView_.center = self.view.center;
  imageView_.contentMode = UIViewContentModeScaleAspectFill;
  imageView_.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                                UIViewAutoresizingFlexibleRightMargin |
                                UIViewAutoresizingFlexibleTopMargin |
                                UIViewAutoresizingFlexibleBottomMargin;
  [self.view addSubview:imageView_];
}

#pragma mark ----- Responder -----

- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
  if ( 2 == [touches count] ) {
    // 如果两个手指触摸的情况下，计算2点间的距离
    // 将当前的距离与上次的距离进行比较，以判断距离是缩短了还是扩大了
    NSArray* twoFingers = [touches allObjects];
    UITouch* touch1 = [twoFingers objectAtIndex:0];
    UITouch* touch2 = [twoFingers objectAtIndex:1];
    CGPoint previous1 = [touch1 previousLocationInView:self.view];
    CGPoint previous2 = [touch2 previousLocationInView:self.view];
    CGPoint now1 = [touch1 locationInView:self.view];
    CGPoint now2 = [touch2 locationInView:self.view];
    CGFloat previousDistance = [self distanceWithPointA:previous1 pointB:previous2];
    CGFloat distance = [self distanceWithPointA:now1 pointB:now2];

    CGFloat scale = 1.0;
    if ( previousDistance > distance ) {
      // 距离缩短了的话，进行缩小处理
      scale -= ( previousDistance - distance ) / 300.0;
    } else if ( distance > previousDistance ) {
      // 距离扩大了的话，进行扩大处理
      scale += ( distance - previousDistance ) / 300.0;
    } 
    CGAffineTransform newTransform =
      CGAffineTransformScale( imageView_.transform, scale, scale ); 
    imageView_.transform = newTransform;
    imageView_.center = self.view.center;
  } 
}

#pragma mark ----- Private Methods -----

- (CGFloat)distanceWithPointA:(CGPoint)pointA pointB:(CGPoint)pointB {
  CGFloat dx = fabs( pointB.x - pointA.x );
  CGFloat dy = fabs( pointB.y - pointA.y );
  return sqrt( dx * dx + dy * dy );
}

@end
