//
//  ViewController2.m
//
//  Created by ToKoRo on 2009-08-15.
//

#import "ViewController2.h"

@implementation ViewController2

// initialize
- (id)init {
  if ( (self = [super init]) ) {
    // 设置tabBar的标题
    self.title = @"您好";
    UIImage* icon = [UIImage imageNamed:@"ball2.png"];
    self.tabBarItem =
      [[[UITabBarItem alloc] initWithTitle:@"您好" image:icon tag:0] autorelease];
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // 追加您好、世界！标签
  // 背景为黑色、文字为白色
  UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
  label.text = @"您好、世界！";
  label.textAlignment = UITextAlignmentCenter;
  label.backgroundColor = [UIColor blackColor];
  label.textColor = [UIColor whiteColor];
  label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:label];
}

@end
