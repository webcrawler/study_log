//
//  ViewController.m
//  UIKit
//
//  Created by admin on 15/10/10.
//  Copyright © 2015年 MyObjC. All rights reserved.
//

#import "ViewController.h"
#import "MyAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 按钮
    UIButton* btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(10, 100, 140, 40);
    [btn1 setTitle:@"alterView" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(showAlertView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton* btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame = CGRectMake(170, 100, 140, 40);
    [btn2 setTitle:@"actionView" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(showActionView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}

- (void) showAlertView
{
    // UIAlertView
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"提示内容" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"other", @"other2", @"other3", nil];
    [alertView show];
    
    // 自定义alertview
//    MyAlertView* alertView = [[MyAlertView alloc] initWithTitle:@"提示1" message:@"提示内容1" delegate:self cancelButtonTitle:@"cancel1" otherButtonTitles:@"other", @"other2", @"other3", nil];
//    alertView.tag = 104;
//    [alertView show];
}

- (void) showActionView
{
    UIActionSheet* actionSheet = [[UIActionSheet alloc] initWithTitle:@"title" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"destructiveButtonTitle" otherButtonTitles:@"other1", nil];
    [actionSheet showInView:self.view];
}

// alertview delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"button index: %d", buttonIndex);
}

// actionsheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
     NSLog(@"button index1: %d", buttonIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
