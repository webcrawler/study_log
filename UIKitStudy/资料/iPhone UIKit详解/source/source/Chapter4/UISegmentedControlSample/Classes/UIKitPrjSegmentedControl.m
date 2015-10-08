//
//  UIKitPrjSegmentedControl.m
//
//  Created by wang on 2011-10-01.
//

#import "UIKitPrjSegmentedControl.h"

@implementation UIKitPrjSegmentedControl

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];
  //创建两个选项的字符串数组
  NSArray* items = [NSArray arrayWithObjects:@"Black", @"White", nil];
  //以NSArray为参数初始化选择控件
  UISegmentedControl* segment =
    [[[UISegmentedControl alloc] initWithItems:items] autorelease];
  //左侧第一选项默认被选择
  segment.selectedSegmentIndex = 0;
  segment.frame = CGRectMake( 0, 0, 130, 30 );
  //注册选项被选择时调用方法
  [segment addTarget:self
              action:@selector(segmentDidChange:)
       forControlEvents:UIControlEventValueChanged];
  //将选择控件对象追加到导航条的右侧
  UIBarButtonItem* barButton =
    [[[UIBarButtonItem alloc] initWithCustomView:segment] autorelease];
  self.navigationItem.rightBarButtonItem = barButton;
}
//选项选择发生变化时调用此方法
- (void)segmentDidChange:(id)sender {
  if ( [sender isKindOfClass:[UISegmentedControl class]] ) {
    UISegmentedControl* segment = sender;
    if ( 0 == segment.selectedSegmentIndex ) {
	  //第一个选项被选择后将画面背景设置成黑色
      self.view.backgroundColor = [UIColor blackColor];
    } else {
	  //第二个选项被选择后将画面背景设置成白色
      self.view.backgroundColor = [UIColor whiteColor];
    }
  } 
}

@end
