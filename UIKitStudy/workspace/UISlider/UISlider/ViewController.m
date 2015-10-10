//
//  ViewController.m
//  UISlider
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
    
    //
    UISlider* slider = [[UISlider alloc] initWithFrame:CGRectMake(60, 100, 200, 20)];
    [self.view addSubview:slider];
    //slider.minimumValue = 0;
    //slider.maximumValue = 1;
    slider.value = 0.5;
    
    // 拖动事件
    [slider addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    
    // 定时器
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(test:) userInfo:slider repeats:NO];
}

- (void) test:(NSTimer*)timer
{
    UISlider* slider = [timer userInfo];
    [slider setValue:0.8 animated:YES];
}

- (void) change:(UISlider*)slider
{
    NSLog(@"value = %f", slider.value);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
