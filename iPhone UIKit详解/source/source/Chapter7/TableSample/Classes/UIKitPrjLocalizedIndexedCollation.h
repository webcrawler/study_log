//
//  UIKitPrjLocalizedIndexedCollation.h
//
//  Created by wang on 2011-10-18.
//

#import <UIKit/UIKit.h>

#pragma mark ----- Character -----
//声明拥有name及job属性的类
@interface Character : NSObject
{
 @private
  NSString* name_;
  NSString* job_;
}

@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* job;

@end

#pragma mark ----- UIKitPrjLocalizedIndexedCollation -----

@interface UIKitPrjLocalizedIndexedCollation : UITableViewController
{
 @private
  NSMutableArray* dataSource_;
}

@property (nonatomic, retain) NSMutableArray* dataSource;

@end
