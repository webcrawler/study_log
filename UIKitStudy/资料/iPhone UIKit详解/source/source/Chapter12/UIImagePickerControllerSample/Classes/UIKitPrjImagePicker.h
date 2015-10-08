//
//  UIKitPrjImagePicker.h
//
//  Created by wang on 2011-10-01.
//

#import <UIKit/UIKit.h>

@interface UIKitPrjImagePicker : UIViewController <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
 @private
  UIImageView* imageView_;
}

@end
