//
//  UIKitPrjFit.m
//
//  Created by wang on 2011-08-05.
//

#import "UIKitPrjFit.h"

@implementation UIKitPrjFit

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];

  // 追加短标签
  UILabel* label1 = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
  label1.backgroundColor = [UIColor blueColor];
  label1.textColor = [UIColor whiteColor];
  label1.text = @"短字符串";
  [label1 sizeToFit];
  [self.view addSubview:label1];

  // 追加长标签
  UILabel* label2 = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
  label2.backgroundColor = [UIColor blueColor];
  label2.textColor = [UIColor whiteColor];
  label2.text = @"长ーーーーーーーーーー字符串";
  [label2 sizeToFit];
  CGPoint newPoint = label2.center;
  newPoint.y += 50;
  label2.center = newPoint;
  [self.view addSubview:label2];

  // 追加DoubleLabel
  DoubleLabel* doubleLabel = [[[DoubleLabel alloc] init] autorelease];
  doubleLabel.frame = CGRectMake( 0, 100, 320, 200 );
  [doubleLabel sizeToFit];
  [self.view addSubview:doubleLabel];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end

@implementation DoubleLabel

- (void)dealloc {
  [label1_ release]; 
  [label2_ release]; 
  [super dealloc];
}

- (id)init {
  if ( (self = [super init]) ) {
    self.backgroundColor = [UIColor blackColor];
    label1_ = [[UILabel alloc] initWithFrame:CGRectZero];
    label1_.text = @"ABC";
    [label1_ sizeToFit];
    label2_ = [[UILabel alloc] initWithFrame:CGRectZero];
    label2_.text = @"ABCDEFGHIJKLMN";
    [label2_ sizeToFit];
    CGPoint newPoint = label2_.center;
    newPoint.x += 100;
    newPoint.y += 50;
    label2_.center = newPoint;
    [self addSubview:label1_];
    [self addSubview:label2_];
  }
  return self;
}
//此类为UIView的子类
//其中包含了label1_与label2_两个UILabel
- (CGSize)sizeThatFits:(CGSize)size {
  CGFloat x1, x2, y1, y2;

  // 将label1_与label2_中延伸的一方左侧的坐标设置成x1
  if ( label1_.frame.origin.x < label2_.frame.origin.x ) {
    x1 = label1_.frame.origin.x;
  }  else {
    x1 = label2_.frame.origin.x;
  }

  // 将label1_与label2_中延伸的一方右侧的坐标设置成x2
  if ( label1_.frame.origin.x + label1_.frame.size.width >
        label2_.frame.origin.x + label2_.frame.size.width )
  {
    x2 = label1_.frame.origin.x + label1_.frame.size.width;
  }  else {
    x2 = label2_.frame.origin.x + label2_.frame.size.width;
  }

  // 将label1_与label2_中向上延伸的一方左侧的坐标设置成y1
  if ( label1_.frame.origin.y < label2_.frame.origin.y ) {
    y1 = label1_.frame.origin.y;
  }  else {
    y1 = label2_.frame.origin.y;
  }

  // 将label1_与label2_中向下延伸的一方右侧的坐标设置成y2
  if ( label1_.frame.origin.y + label1_.frame.size.height >
        label2_.frame.origin.y + label2_.frame.size.height )
  {
    y2 = label1_.frame.origin.y + label1_.frame.size.height;
  }  else {
    y2 = label2_.frame.origin.y + label2_.frame.size.height;
  }

  // 新尺寸的设置
  size.width = x2 - x1;
  size.height = y2 - y1;
  return size;
}

@end
