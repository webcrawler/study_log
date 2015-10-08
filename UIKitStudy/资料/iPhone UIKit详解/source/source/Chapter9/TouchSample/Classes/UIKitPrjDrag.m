//
//  UIKitPrjDrag.m
//
//  Created by wang on 2011-08-30.
//

#import "UIKitPrjDrag.h"

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjDrag ()
- (void)theCharacterWillWalk;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjDrag

- (void)dealloc {
  shouldWalk_ = NO;
  [character_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  // 为实现动画导入2枚图片
  UIImage* image1 = [UIImage imageNamed:@"chara1.png"];
  UIImage* image2 = [UIImage imageNamed:@"chara2.png"];
  NSArray* images = [[NSArray alloc] initWithObjects:image1, image2, nil];
  // 创建UIImageView实例并初始化
  character_ = [[UIImageView alloc] initWithImage:image1];
  // 将动画图片以数值形式设置到animationImages属性中
  character_.animationImages = images;
  character_.animationDuration = 0.3;
  [images release];
  [self.view addSubview:character_];
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  shouldWalk_ = NO;
}

#pragma mark ----- Responder -----

// 手指在画面上触摸的瞬间动画开始，调用人物移动的方法
// shouldWalk_为YES时持续调用人物移动方法
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  shouldWalk_ = YES;
  [character_ startAnimating];
  targetPoint_ = [[touches anyObject] locationInView:self.view];
  [self theCharacterWillWalk];
}

// 画面拖动时保持当时位置
- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
  targetPoint_ = [[touches anyObject] locationInView:self.view];
}

// 手指从画面离开时动画停止，并将shouldWalk_设置成NO
- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  shouldWalk_ = NO;
  [character_ stopAnimating];
}

// 放弃触摸状态后动画停止，并将shouldWalk_设置成NO
- (void)touchesCancelled:(NSSet*)touches withEvent:(UIEvent*)event {
  shouldWalk_ = NO;
  [character_ stopAnimating];
}

#pragma mark ----- Private Methods -----

// 向手指触摸位置一点点移动人物位置的方法
// shouldWalk_为YES时、以0.3秒为间隔递归调用本方法
- (void)theCharacterWillWalk {
  if ( !shouldWalk_ ) {
    return;
  } 

  static const NSInteger kMaximumSteps = 8;
  CGPoint newPoint = character_.center;
  if ( kMaximumSteps < abs( targetPoint_.x - newPoint.x  ) ) {
    if ( targetPoint_.x > newPoint.x ) {
      newPoint.x += kMaximumSteps;
    } else {
      newPoint.x -= kMaximumSteps;
    }
  } else {
    newPoint.x = targetPoint_.x;
  }
  if ( kMaximumSteps < abs( targetPoint_.y - newPoint.y  ) ) {
    if ( targetPoint_.y > newPoint.y ) {
      newPoint.y += kMaximumSteps;
    } else {
      newPoint.y -= kMaximumSteps;
    }
  } else {
    newPoint.y = targetPoint_.y;
  }

  character_.center = newPoint;

  [self performSelector:@selector(theCharacterWillWalk)
             withObject:nil
             afterDelay:0.3];
}

@end
