//
//  ViewController.m
//  UIPageControl
//
//  Created by admin on 15/10/15.
//  Copyright © 2015年 MyObjC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIPageControl* pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 100, 320, 40)];
    pageControl.numberOfPages = 10;
    pageControl.currentPage = 2;
    //pageControl.enabled = NO;
    pageControl.hidesForSinglePage = YES; // 单页 隐藏
    [pageControl addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    pageControl.backgroundColor = [UIColor grayColor];
    [self.view addSubview:pageControl];
    
}

- (void)change:(id)sender
{
    NSLog(@"cur page = %d", ((UIPageControl*)sender).currentPage);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
