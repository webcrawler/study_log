//
//  ViewController.m
//  UIKitStudy
//
//  Created by admin on 15/9/29.
//  Copyright © 2015年 MyObjC. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 视图
    UIView *view1 = [[UIView alloc] init];
    view1.frame = CGRectMake(0, 0, 200, 300);
    view1.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view1];
    
    // button
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [btn setTitle:@"hello1" forState:UIControlStateNormal];
    [btn sizeToFit];
    CGPoint point = self.view.center;
    point.y += 50;
    btn.center = point;
    btn.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [btn addTarget:self action:@selector(buttonDidPush) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: btn];
    
    NSLog(@"哈哈哈");
}

// 按钮响应
- (void)buttonDidPush
{
    [self.view.window sendSubviewToBack:self.view];
    NSLog(@" ViewController1 buttonDidPush");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
