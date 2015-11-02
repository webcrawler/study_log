//
//  ViewController.m
//  UINavigationController
//
//  Created by admin on 15/10/24.
//  Copyright © 2015年 MyObjC. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) loadView
{
    UIView* baseView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    baseView.backgroundColor = [UIColor purpleColor];
    self.view = baseView;
    self.title = @"root";
    
    // button
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"push" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(90, 100, 140, 35)];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
}

- (void) push
{
    SecondViewController* secondView = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondView animated:YES];
}

- (void) dealloc
{
    NSLog(@"root view dead");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 设置代理, 监听视图控制器切换
    self.navigationController.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - navigationController delegate

// Called when the navigation controller shows a new top view controller via a push, pop or setting of the view controller stack.
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSLog(@"willShowViewController");
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated;
{
    NSLog(@"didShowViewController");
}


@end



