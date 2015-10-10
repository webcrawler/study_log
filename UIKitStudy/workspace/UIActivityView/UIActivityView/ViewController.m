//
//  ViewController.m
//  UIActivityView
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
    
    // 转圈
    UIActivityIndicatorView* activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityView.center = CGPointMake(160, 200);
    activityView.backgroundColor = [UIColor redColor];
    //
    //activityView.hidesWhenStopped = NO;
    [activityView startAnimating];
    [self.view addSubview:activityView];
    
    // 3秒后调用call
    [NSTimer scheduledTimerWithTimeInterval:9999999 target:self selector:@selector(call:) userInfo:activityView repeats:NO];
    
    // 显示左上角转圈
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void) call:(NSTimer*)timer
{
    NSLog(@"转圈 stop");
    
    // 关闭左上角转圈
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    UIActivityIndicatorView* activityView = [timer userInfo];
    [activityView stopAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
