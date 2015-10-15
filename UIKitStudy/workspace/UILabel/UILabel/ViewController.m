//
//  ViewController.m
//  UILabel
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
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(90, 100, 100, 100)];
    label.text = @"ghhfeeesgsgdsgszvvvvvvvvvvvvddddddhjf";
    label.numberOfLines = 2;
    label.font = [UIFont fontWithName:@"Arail" size:20];
    label.backgroundColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blueColor];
    [label sizeToFit]; // 根据内容适应
    
    
    
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
