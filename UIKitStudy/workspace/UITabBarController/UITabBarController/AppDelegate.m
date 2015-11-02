//
//  AppDelegate.m
//  UITabBarController
//
//  Created by admin on 15/11/2.
//  Copyright © 2015年 MyObjC. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "SearchViewController.h"
#import "SettingViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    

    // 创建若干个子视图控制器 （并列关系）
    // 
    HomeViewController* vec1 = [[HomeViewController alloc] init];
    // 创建UITabBarItem 赋值给相应地子视图控制器
    UITabBarItem* homeItem = [[UITabBarItem alloc] initWithTitle:@"消息" image:[UIImage imageNamed:@"123"] tag:3];
    vec1.tabBarItem = homeItem;
//    vec1.title = @"首页";
//    vec1.view.backgroundColor = [UIColor redColor];
    
    MessageViewController* vec2 = [[MessageViewController alloc] init];
    UITabBarItem* MessageItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
    vec2.tabBarItem = MessageItem;
//    vec2.title = @"新闻";
//    vec2.view.backgroundColor = [UIColor yellowColor];
    
    SearchViewController* vec3 = [[SearchViewController alloc] init];
//    vec3.title = @"历史";
//    vec3.view.backgroundColor = [UIColor blueColor];
    
    SettingViewController* vec4 = [[SettingViewController alloc] init];
//    vec4.title = @"搜索";
//    vec4.view.backgroundColor = [UIColor purpleColor];
    
//    UIViewController* vec5 = [[UIViewController alloc] init];
//    vec5.title = @"设置";
//    vec5.view.backgroundColor = [UIColor orangeColor];
    
    NSArray* viewArr = @[vec1, vec2, vec3, vec4];
    
    // 分栏视图控制器
    UITabBarController* tabBar = [[UITabBarController alloc] init];
    // or    tabBar.viewControllers = viewArr;
    [tabBar setViewControllers:viewArr animated:YES];
    self.window.rootViewController = tabBar; //rootView;
    
    // delegate
    tabBar.delegate = self;
    
    
    
    
    
    
    
    
    
    
    
    return YES;
}

// UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController NS_AVAILABLE_IOS(3_0)
{
    NSLog(@"shouldSelectViewController");
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"didSelectViewController");
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
