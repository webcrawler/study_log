//
//  HelloWorldAppDelegate.h
//
//  Created by Wang on 2011-10-15.
//

#import <UIKit/UIKit.h>

@interface HelloWorldAppDelegate : NSObject <UIApplicationDelegate> {
  UIWindow *window_;
  UIViewController* viewController1_;
  UIViewController* viewController2_;
}

@property (nonatomic, retain) UIWindow* window;

@end

