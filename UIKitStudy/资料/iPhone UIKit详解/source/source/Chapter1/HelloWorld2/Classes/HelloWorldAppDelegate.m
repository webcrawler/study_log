//
//  HelloWorldAppDelegate.m
//  HelloWorld
//
//  Created by user00 on 8/1/11.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "HelloWorldAppDelegate.h"

@implementation HelloWorldAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	// 初始化window对象
	CGRect bounds = [[UIScreen mainScreen] bounds];
	window = [[UIWindow alloc] initWithFrame:bounds];
	
	// 获取与应用程序窗口相同大小的边框
	CGRect rect = [window frame];	
	// 创建UILabel实例并初始化
	// 将上述边框作为初始化参数进行UILabel初始化
	UILabel* label = [[UILabel alloc] initWithFrame:rect];
	// 设置在UILabel中显示的信息「Hello, world!」
	label.text = @"Hello, world!";
	// 将创建完成的UILabel追加到window中
	[window addSubview:label];
	// 最后不要忘了进行release！
	[label release];
	

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
