//
//  UIKitPrjUIImage.h
//
//  Created by wang on 2011-09-24.
//

#import <UIKit/UIKit.h>
//UIView的子类
@interface DrawImageTest : UIView
{
 @private
  UIImage* image_;
}

- (id)initWithImage:(UIImage*)image;

@end
//画面
@interface UIKitPrjUIImage : UIViewController
@end
