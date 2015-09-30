//
//  ViewController1.m
//
//  Created by wang on 2011-08-15.
//

#import "ViewController1.h"

/* 本例中还留下了与UITabBarController相关的代码 */
/* 这些都与讲解过程有关 */

@implementation ViewController1

// initialize
- (id)init {
  if ( (self = [super init]) ) {
    // 设置tabBar的标题
    self.title = @"Hello";
    UIImage* icon = [UIImage imageNamed:@"ball1.png"];
    self.tabBarItem =
      [[[UITabBarItem alloc] initWithTitle:@"Hello" image:icon tag:0] autorelease];
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // 追加Hello, world!标签 
  // 背景为白色，文字为黑色
  UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
  label.text = @"Hello, world!";
  label.textAlignment = UITextAlignmentCenter;
  label.backgroundColor = [UIColor whiteColor];
  label.textColor = [UIColor blackColor];
  label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:label];
}

@end
