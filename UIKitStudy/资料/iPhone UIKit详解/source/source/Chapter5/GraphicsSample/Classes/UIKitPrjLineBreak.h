//
//  UIKitPrjLineBreak.h
//
//  Created by wang on 2011-09-24.
//

#import <UIKit/UIKit.h>

@interface LineBreakTest : UIView
{
 @private
  UILineBreakMode lineBreakMode_;
}

- (id)initWithLineBreakMode:(UILineBreakMode)mode;

@end

@interface UIKitPrjLineBreak : UIViewController
@end
