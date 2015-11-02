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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
