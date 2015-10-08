//
//  UIKitPrjProgressViewOnToolbar.h
//
//  Created by wang on 2011-10-04.
//

#import <UIKit/UIKit.h>

#pragma mark ----- ProgressViewWithLabel -----

@interface ProgressViewWithLabel : UIView
{
 @protected
  UIProgressView* progressView_;
  UILabel* textLabel_;
}

@property (nonatomic, retain) UIProgressView* progressView;
@property (nonatomic, retain) UILabel* textLabel;

@end

#pragma mark ----- UIKitPrjProgressViewOnToolbar -----

@interface UIKitPrjProgressViewOnToolbar : UIViewController
{
 @private
  ProgressViewWithLabel* component_;
}

@end
