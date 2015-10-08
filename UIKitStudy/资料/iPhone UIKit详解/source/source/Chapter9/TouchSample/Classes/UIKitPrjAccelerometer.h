//
//  UIKitPrjAccelerometer.h
//
//  Created by wang on 2011-08-30.
//

#import <UIKit/UIKit.h>

// 安装从UIAccelerometer接受通知UIAccelerometerDelegate协议
@interface UIKitPrjAccelerometer : UIViewController <UIAccelerometerDelegate>  
{
 @private
  UIImageView* imageView_;//球体图像
  UIAccelerationValue speedX_;//x轴方向的运动速度
  UIAccelerationValue speedY_;//y轴方向的运动速度
}

@end
