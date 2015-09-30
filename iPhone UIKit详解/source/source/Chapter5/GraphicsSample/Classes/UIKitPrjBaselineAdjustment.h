//
//  UIKitPrjBaselineAdjustment.h
//
//  Created by wang on 2011-09-24.
//

#import <UIKit/UIKit.h>

@interface BaselineAdjustmentTest : UIView
{
 @private
  UIBaselineAdjustment baselineAdjustment_;
}

- (id)initWithBaselineAdjustment:(UIBaselineAdjustment)baselineAdjustment;

@end

@interface UIKitPrjBaselineAdjustment : UIViewController
@end
