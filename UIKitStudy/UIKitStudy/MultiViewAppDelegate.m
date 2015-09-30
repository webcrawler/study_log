//
//  MultiViewAppDelegate.m
//  UIKitStudy
//
//  Created by admin on 15/9/29.
//  Copyright © 2015年 MyObjC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MultiViewAppDelegate.h"

#import "ViewController1.h"
#import "ViewController2.h"

@implementation HelloDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    // 初始化window
    CGRect bound = [[UIScreen mainScreen] bounds];
    window = [[UIWindow alloc] initWithFrame:bound];
    
    // 创建viewcontroller
    viewController1 = [[ViewController1 alloc] init];
    viewController2 = [[ViewController2 alloc] init];
    
//    [window addSubview:viewController1.view];
//    [window addSubview:viewController2.view];
//    // viewcontroller1 放前面
//    [window bringSubviewToFront:viewController1.view];
    

    self.window.rootViewController = viewController1;
}

- (void)dealloc
{
//    [viewController1 release];
//    [viewController2 release];
//    [window release];
}

@end

