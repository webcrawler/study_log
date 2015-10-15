//
//  ViewController.m
//  UITextField
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
    
    UITextField* textField = [[UITextField alloc] initWithFrame:CGRectMake(60, 180, 200, 35)];
    textField.tag = 100;
    textField.delegate = self;
    textField.textColor = [UIColor redColor];
    textField.placeholder = @"请输入";
    textField.adjustsFontSizeToFitWidth = YES;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:textField];
    
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(60, 100, 50, 40);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"关闭键盘" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(end:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    // 成为第一响应者 （键盘自动弹出）
    //[btn becomeFirstResponder];
    
}

- (void)end:(id)sender
{
    UITextField* textField = (UITextField*)[self.view viewWithTag:100];
    // 移除键盘
    [textField resignFirstResponder];
}

/*************  UITextFieldDelegate **************/
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField        // return NO to disallow editing.
{
    return YES; // NO 则键盘失去第一响应者 键盘则不弹出  YES == [btn becomeFirstResponder]
}

- (void)textFieldDidBeginEditing:(UITextField *)textField          // became first responder
{
    NSLog(@"开始");
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField          // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
{
    return YES; // NO 则键盘失去第一响应者  键盘关闭不了
}

- (void)textFieldDidEndEditing:(UITextField *)textField            // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
{
    NSLog(@"结束： %@", textField.text);
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string   // return NO to not change text
{
    NSLog(@"shouldChangeCharactersInRange = %@", string);
    return YES; // NO 则无法编辑输入框
}

- (BOOL)textFieldShouldClear:(UITextField *)textField               // called when clear button pressed. return NO to ignore (no notifications)
{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField              // called when 'return' key pressed. return NO to ignore.
{
    [textField becomeFirstResponder];
    return YES;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
