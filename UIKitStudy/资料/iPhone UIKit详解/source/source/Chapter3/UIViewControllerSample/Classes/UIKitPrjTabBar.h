//
//  UIKitPrjTabBar.h
//
//  Created by Wang on 2011-08-16.
//

#import <UIKit/UIKit.h>

@interface UIKitPrjTabBar : UITabBarController
@end

@interface SampleScene : UIViewController
- (id)initWithSystemItem:(UITabBarSystemItem)item badge:(NSString*)badge;
- (id)initWithFileName:(NSString*)fileName title:(NSString*)title;
@end

