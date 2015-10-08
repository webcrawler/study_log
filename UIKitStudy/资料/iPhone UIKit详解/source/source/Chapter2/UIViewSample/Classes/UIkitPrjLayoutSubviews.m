//
//  UIKitPrjLayoutSubviews.m
//
//  Created by wang on 2011-08-05.
//

#import "UIKitPrjLayoutSubviews.h"

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjLayoutSubviews ()
- (void)setNeedsDidPush;
- (void)resizeDidPush;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjLayoutSubviews

// finalize
- (void)dealloc {
  [label_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor grayColor];

  label_ = [[LayoutTest alloc] init];

  [self.view addSubview:label_];

  // 追加setNeedsLayout按钮
  UIButton* setNeedsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  setNeedsButton.frame = CGRectMake( 0, 0, 150, 40 );
  CGPoint newPoint = self.view.center;
  newPoint.x -= 75;
  newPoint.y = self.view.frame.size.height - 40;
  setNeedsButton.center = newPoint;
  [setNeedsButton setTitle:@"setNeedsLayout" forState:UIControlStateNormal];
  [setNeedsButton addTarget:self
                     action:@selector(setNeedsDidPush)
           forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:setNeedsButton];

  // 追加layoutIfNeeded按钮
  UIButton* layoutButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  layoutButton.frame = CGRectMake( 0, 0, 150, 40 );
  newPoint.x += 150;
  layoutButton.center = newPoint;
  [layoutButton setTitle:@"layoutIfNeeded" forState:UIControlStateNormal];
  [layoutButton addTarget:self
                     action:@selector(resizeDidPush)
           forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:layoutButton];
}

#pragma mark ----- Private Methods -----

- (void)setNeedsDidPush {
  // 取得child1_并使之尺寸变大
  UIView* child1 = (UIView*)[label_.subviews objectAtIndex:0];
  child1.frame = CGRectMake( 0, 0, 160, 160 );
  child1.center = label_.center;
}

- (void)resizeDidPush {
  //此后，调用setNeedsLayout方法
  //layoutSubviews方法将会被自动调用
  [label_ setNeedsLayout];
  [label_ layoutIfNeeded];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
	[self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end

#pragma mark ----- Implementation For LayoutTest -----
//实现LayoutTest类
@implementation LayoutTest

// 释放处理
- (void)dealloc {
  [child1_ release]; 
  [child2_ release]; 
  [super dealloc];
}

// 初始化处理
- (id)init {
  if ( (self = [super init]) ) {
	//调整自己的大小，追加两个标签
    self.frame = CGRectMake( 0, 0, 320, 320 );
    child1_ = [[UILabel alloc] initWithFrame:CGRectZero]; 
    child1_.text = @"CHILD 1";
    [child1_ sizeToFit];
    child1_.backgroundColor = [UIColor redColor];
    child1_.textColor = [UIColor whiteColor];
    child2_ = [[UILabel alloc] initWithFrame:CGRectZero]; 
    child2_.text = @"CHILD 2";
    [child2_ sizeToFit];
    child2_.backgroundColor = [UIColor blueColor];
    child2_.textColor = [UIColor whiteColor];
    child2_.center = CGPointMake( child2_.center.x, child2_.center.y + 30 );
    [self addSubview:child1_];
    [self addSubview:child2_];
  }
  return self;
}
//外观调整方法
- (void)layoutSubviews {
  // 调用父类中的相同方法
  [super layoutSubviews];

  // 再显示子元素
  
  // 将child1_移动到左下
  CGRect newRect = child1_.frame;
  newRect.origin.x = 0;
  newRect.origin.y = self.frame.size.height - child1_.frame.size.height;
  child1_.frame = newRect;

  // 将child2_移动到右上
  newRect = child2_.frame;
  newRect.origin.x = self.frame.size.width - child2_.frame.size.width;
  newRect.origin.y = 0;
  child2_.frame = newRect;
}

@end 
