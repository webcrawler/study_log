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
    
    
    // navigationItem
    UIBarButtonItem* leftItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(study)];
    // 一个导航控制器控制若干个视图控制器，
    // 一个导航控制器包含一个navigationbar和一个toolbar
    // navigationbar中的按钮是一个UINavigationItem (只有一个)
    // 通过设置UINavigationItem的属性，显示Item
    // UINavigationItem 不是由navigationbar控制，更不是由UINavigationController来控制，是由当前视图控制器控制
    self.navigationItem.leftBarButtonItem = leftItem;
    // 错误写法
    // self.navigationController.navigationItem.leftBarButtonItem = leftItem;
    
    
    UIButton* btnItem = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnItem setTitle:@"test" forState:UIControlStateNormal];
    [btnItem setFrame:CGRectMake(0, 0, 60, 35)];
    [btnItem addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithCustomView:btnItem];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    // UIToolbar
    UIToolbar* toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 500, 320, 44)];
    toolBar.barStyle = UIBarStyleDefault;
    [self.view addSubview:toolBar];
    
    UIBarButtonItem* addItem =  [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    UIBarButtonItem* saveItem =  [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:nil];
    UIBarButtonItem* titleItem =  [[UIBarButtonItem alloc] initWithTitle:@"title" style:UIBarButtonItemStyleDone target:self action:nil];
    UIBarButtonItem* imageItem =  [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"12"]style:UIBarButtonItemStylePlain target:self action:nil];
    
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"12"]];
    UIBarButtonItem* imageItem1 =  [[UIBarButtonItem alloc] initWithCustomView:imageView];
    
    // 设置间隔
    UIBarButtonItem* flexibleItem =  [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    // 自定义间隔
    UIBarButtonItem* fixItem =  [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    fixItem.width = 100;
    
    NSArray* items = @[addItem, fixItem, saveItem, flexibleItem, titleItem, flexibleItem, imageItem, flexibleItem, imageItem1];
    [toolBar setItems:items animated:YES];

    
    // 也可以使用 setToolbarItems （默认隐藏）
    //[self.navigationController setToolbarHidden:NO animated:YES];
    //[self setToolbarItems:items animated:YES];
    
    // 错误写法 （使每个页面都一样的toolbar）
    //[self.navigationController.toolbar setItems:items animated:YES];
    
}

- (void) study
{
    UIAlertView* alterView = [[UIAlertView alloc] initWithTitle:@"study" message:@"共享" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alterView show];
}

- (void) test
{
    UIActionSheet* action = [[UIActionSheet alloc] initWithTitle:@"title" delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"确定", nil];
     [action showInView:self.view];
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
