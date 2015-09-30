//
//  MultiViewAppDelegate.h
//  UIKitStudy
//
//  Created by admin on 15/9/29.
//  Copyright © 2015年 MyObjC. All rights reserved.
//

#ifndef MultiViewAppDelegate_h
#define MultiViewAppDelegate_h

#import "UIKit/UIkit.h"

@interface HelloDelegate: NSObject<UIApplicationDelegate>
{
    UIWindow* window;
    UIViewController* viewController1;
    UIViewController* viewController2;
}

@property (nonatomic, retain) UIWindow* window;

@end

#endif /* MultiViewAppDelegate_h */
