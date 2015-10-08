//
//  UIKitPrjInsertAndRemove.m
//
//  Created by wang on 2011-10-01.
//

#import "UIKitPrjInsertAndRemove.h"

@implementation UIKitPrjInsertAndRemove

- (void)dealloc {
  [segment_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  //初始化选择控件
  segment_ = [[UISegmentedControl alloc] init];
  segment_.segmentedControlStyle = UISegmentedControlStyleBordered;
  segment_.frame = CGRectMake( 10, 50, 300, 30 );
  [self.view addSubview:segment_];
  //向其中追加三个选项
  [segment_ insertSegmentWithTitle:@"3" atIndex:0 animated:NO];
  [segment_ insertSegmentWithTitle:@"2" atIndex:0 animated:NO];
  [segment_ insertSegmentWithTitle:@"1" atIndex:0 animated:NO];
  //在工具条上追加Insert、Remove、RemoveAll三个按钮，并注册三个按钮的响应方法
  UIBarButtonItem* insertButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"Insert"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(insertDidPush)] autorelease];
  UIBarButtonItem* removeButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"Remove"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(removeDidPush)] autorelease];
  UIBarButtonItem* removeAllButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"RemoveAll"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(removeAllDidPush)] autorelease];
  NSArray* items = [NSArray arrayWithObjects:insertButton, removeButton, removeAllButton, nil];
  [self setToolbarItems:items animated:YES];
}
//Insert按钮的响应方法
- (void)insertDidPush {
  NSNumber* number = [NSNumber numberWithInteger:segment_.numberOfSegments + 1];
  [segment_ insertSegmentWithTitle:[number stringValue]
                           atIndex:[number integerValue]
                          animated:YES];
}
//Remove按钮的响应方法
- (void)removeDidPush {
  [segment_ removeSegmentAtIndex:segment_.numberOfSegments - 1 animated:YES];
}
//RemoveAll按钮的响应方法
- (void)removeAllDidPush {
  [segment_ removeAllSegments];
}

@end
