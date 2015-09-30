//
//  HelloWorldAppDelegate.h
//
//  Created by wang on 2011-08-15.
//

#import <UIKit/UIKit.h>

@interface HelloWorldAppDelegate : NSObject <UIApplicationDelegate> {
  UIWindow* window_;
  UIViewController* rootController_;
}

@property (nonatomic, retain) UIWindow* window;

@end

