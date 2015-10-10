//
//  ViewController.m
//  UIButton
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
    
    // 创建btn
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 20, 100, 40);
    [btn setTitle:@"xxx1" forState:UIControlStateNormal];
    [btn setTitle:@"xxx2" forState:UIControlStateHighlighted];
    //btn.enabled = NO;
    //btn.selected = NO;
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    // 设置背景图片
    //[btn setBackgroundImage:[UIImage imageNamed:"2.png"] forState:UIControlStateNormal]
    // 设置图片
    //[btn setImage]
    // 添加事件
    [btn addTarget:self action:@selector(btnCall:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:btn];
    
    
}

- (void) btnCall:(UIButton*)btn
{
    NSLog(@"call ");
    if (btn.selected)
    {
        NSLog(@"选中");
    }
    else
    {
        NSLog(@"非选中");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
