//
//  UIKitPrjLayoutSubviews.h
//
//  Created by wang on 2011-08-05.
//

#import "SampleBaseController.h"

#pragma mark ----- LayoutTest -----
//定义UIView的子类
//子类中拥有child1_以及child2_两个标签子元素
@interface LayoutTest : UILabel
{
 @private
  UILabel* child1_;
  UILabel* child2_;
}

@end 

#pragma mark ----- UIKitPrjLayoutSubviews -----

@interface UIKitPrjLayoutSubviews : SampleBaseController
{
 @private
  LayoutTest* label_;
}

@end

