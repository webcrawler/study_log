//
//  UIKitPrjSlide.h
//
//  Created by wang on 2011-08-30.
//

#import <UIKit/UIKit.h>
//标示滑动方向的枚举类型定义
typedef enum
{
  kSlideNone,//原状态
  kSlideHorizontal,//横向滑动
  kSlideVertical,//纵向滑动
} DirectionForSlide;

@interface UIKitPrjSlide : UIViewController
{
 @private
  UILabel* label_;
  CGPoint touchBegan_;
  CGPoint labelOrigin_;
  DirectionForSlide direction_;
}

@end
