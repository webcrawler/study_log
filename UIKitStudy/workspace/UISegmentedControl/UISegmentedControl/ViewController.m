//
//  ViewController.m
//  UISegmentedControl
//
//  Created by admin on 15/10/10.
//  Copyright © 2015年 MyObjC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 分段 页面切换
    NSArray* items = @[@"搜索", @"图片", @"音乐", @"视频"];
    UISegmentedControl* sc = [[UISegmentedControl alloc] initWithItems:items];
    sc.frame = CGRectMake(100, 100, 150, 30);
    sc.selectedSegmentIndex = 0;
    sc.segmentedControlStyle = UISegmentedControlStyleBordered;
    [self.view addSubview:sc];
    
    // 事件
    [sc addTarget:self action:@selector(test:) forControlEvents:UIControlEventValueChanged];
    
}

- (void) test:(UISegmentedControl*) sc
{
    NSLog(@"index = %d", sc.selectedSegmentIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
