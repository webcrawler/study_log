//
//  ThirdViewController.m
//  UINavigationController
//
//  Created by admin on 15/10/24.
//  Copyright © 2015年 MyObjC. All rights reserved.
//

#import "ThirdViewController.h"
#import "ViewController.h"
#import "SecondViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController


- (void) loadView
{
    UIView* baseView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    baseView.backgroundColor = [UIColor blueColor];
    self.view = baseView;
    self.title = @"thirdView";
    
    // button
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"push" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(90, 60, 140, 35)];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1 setTitle:@"pop" forState:UIControlStateNormal];
    [btn1 setFrame:CGRectMake(90, 150, 140, 35)];
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2 setTitle:@"root" forState:UIControlStateNormal];
    [btn2 setFrame:CGRectMake(90, 240, 140, 35)];
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(root) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn3 setTitle:@"index" forState:UIControlStateNormal];
    [btn3 setFrame:CGRectMake(90, 330, 140, 35)];
    [self.view addSubview:btn3];
    [btn3 addTarget:self action:@selector(index) forControlEvents:UIControlEventTouchUpInside];
    
    NSLog(@"second viewController: %p", self.navigationController);
}

- (void) push
{
    ThirdViewController* thirdView = [[ThirdViewController alloc] init];
    [self.navigationController pushViewController:thirdView animated:YES];
}

- (void) pop
{
    [self.navigationController popViewControllerAnimated:YES];
}

// 返回到根view 其他view全部出栈 dealloc
- (void) root
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

// 返回到指定view 其他在该view上面的的view全部出栈 dealloc
- (void) index
{
    UIViewController* vc = [[self.navigationController viewControllers] objectAtIndex:1];
    [self.navigationController popToViewController:vc animated:YES];
}

- (void) dealloc
{
    NSLog(@"third view dead");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
