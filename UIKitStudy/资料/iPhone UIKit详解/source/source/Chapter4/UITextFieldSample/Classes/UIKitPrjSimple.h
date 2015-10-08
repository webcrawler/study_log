//
//  UIKitPrjSimple.h
//
//  Created by wang on 2011-10-01.
//

#import <UIKit/UIKit.h>

@interface UIKitPrjSimple : UIViewController <UITextFieldDelegate>
{
 @private
  NSArray* textFields_;
  NSUInteger currentFieldIndex_;
}
@end
