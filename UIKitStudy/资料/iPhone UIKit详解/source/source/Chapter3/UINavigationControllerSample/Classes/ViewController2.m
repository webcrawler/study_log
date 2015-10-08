//
//  ViewController2.m
//
//  Created by wang on 2011-08-15.
//

#import "ViewController2.h"

/* 本例中还留下了与UITabBarController相关的代码 */
/* 这些都与讲解过程有关 */

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

  // 追加您好、世界标签
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
