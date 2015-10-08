//
//  UIKitPrjPaging.h
//
//  Created by ToKoRo on 2009-10-20.
//  Last Change: 2011-11-21.
//

#import <UIKit/UIKit.h>

#pragma mark ----- MyViewController -----

@interface MyViewController : UIViewController
{
 @private
  NSInteger number_;
}

@property (nonatomic, assign) NSInteger number;
//传入数值初始化MyViewController实例的类方法
+ (MyViewController*)myViewControllerWithNumber:(NSInteger)number;

@end

#pragma mark ----- UIKitPrjPaging -----

@interface UIKitPrjPaging : UIViewController
@end
