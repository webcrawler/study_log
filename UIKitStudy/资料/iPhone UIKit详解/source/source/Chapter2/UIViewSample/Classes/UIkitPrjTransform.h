//
//  UIKitPrjTransform.h
//
//  Created by wang on 2011-08-05.
//

#import "SampleBaseController.h"

@interface UIKitPrjTransform : SampleBaseController
{
 @private
  UIImageView* imageView_;
  CGFloat rotate_;
  CGFloat scale_;
  bool    needFlip_;
}

@end
