//
//  ViewController.m
//  UIImageView
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
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 600, 600)];
    imageView.backgroundColor = [UIColor redColor];
    
    // 默认事件响应未打开
    //imageView.userInteractionEnabled = YES;
    
    //imageView.highlighted = YES;
    imageView.image = [UIImage imageNamed:@"1.jpg"];
    imageView.highlightedImage = [UIImage imageNamed:@"2.jpg"];
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
