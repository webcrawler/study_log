//
//  UIKitPrjDrag.h
//
//  Created by wang on 2011-08-30.
//

#import <UIKit/UIKit.h>

@interface UIKitPrjDrag : UIViewController
{
 @private
  UIImageView* character_;//显示人偶用的UIImageView
  BOOL shouldWalk_;//移动标志（控制人偶移动）
  CGPoint targetPoint_;//当前手指位置
}

@end
