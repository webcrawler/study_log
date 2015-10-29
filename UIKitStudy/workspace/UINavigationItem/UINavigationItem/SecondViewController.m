//
//  SecondViewController.m
//  UINavigationController
//
//  Created by admin on 15/10/24.
//  Copyright © 2015年 MyObjC. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void) loadView
{
    UIView* baseView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    baseView.backgroundColor = [UIColor purpleColor];
    self.view = baseView;
    self.title = @"secondView";
    
    // button
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"hide" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(90, 100, 140, 35)];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(hideOrshow) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1 setTitle:@"pop" forState:UIControlStateNormal];
    [btn1 setFrame:CGRectMake(90, 200, 140, 35)];
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2 setTitle:@"pushThirdView" forState:UIControlStateNormal];
    [btn2 setFrame:CGRectMake(90, 300, 140, 35)];
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(pushThirdView) forControlEvents:UIControlEventTouchUpInside];
    
    NSLog(@"second viewController: %p", self.navigationController);
    
    
    // UINavigationItem  titleView
    UIView* testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    testView.backgroundColor = [UIColor greenColor];
    self.navigationItem.titleView = testView;
    
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithTitle:@"自定义xx" style:UIBarButtonItemStyleBordered target:self action:nil];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

- (void) hideOrshow
{
    if (self.navigationController.toolbarHidden)
    {
        // 底部bar
        [self.navigationController setToolbarHidden:NO animated:YES];
        // 顶部bar
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
    else
    {
        [self.navigationController setToolbarHidden:YES animated:YES];
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
}

- (void) pop
{
    // 返回上一层视图控制器
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) pushThirdView
{
    ThirdViewController* secondView = [[ThirdViewController alloc] init];
    [self.navigationController pushViewController:secondView animated:YES];
}

- (void) dealloc
{
    NSLog(@"second view dead");
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 默认是隐藏的Toolbar
    //[self.navigationController setToolbarHidden:NO animated:YES];
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
