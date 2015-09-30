//
//  UIKitPrjCameraOverlay.h
//
//  Created by wang on 2011-10-01.
//

#import <UIKit/UIKit.h>

@interface CameraOverlayView : UIImageView
{
 @private
  UIImagePickerController* pickerController_;
}

@property (nonatomic, assign) UIImagePickerController* pickerController;

@end

@interface UIKitPrjCameraOverlay : UIViewController <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
 @private
  UIImageView* imageView_;
}

@end
