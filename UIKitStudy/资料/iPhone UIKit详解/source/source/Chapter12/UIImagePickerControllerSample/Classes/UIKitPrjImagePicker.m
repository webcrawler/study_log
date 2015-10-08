//
//  UIKitPrjImagePicker.m
//
//  Created by wang on 2011-10-01.
//

#import "UIKitPrjImagePicker.h"

@implementation UIKitPrjImagePicker

- (void)dealloc {
  [imageView_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  UIBarButtonItem* barButton =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
                                                   target:self
                                                   action:@selector(barButtonDidPush)] autorelease];
  [self setToolbarItems:[NSArray arrayWithObject:barButton] animated:NO];

  imageView_ = [[UIImageView alloc] init];
  imageView_.frame = self.view.bounds;
  imageView_.contentMode = UIViewContentModeScaleAspectFit;
  imageView_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:imageView_];
}

- (void)barButtonDidPush {
  UIActionSheet* sheet = [[[UIActionSheet alloc] init] autorelease];
  sheet.delegate = self;
  [sheet addButtonWithTitle:@"PhotoLibrary"];
  [sheet addButtonWithTitle:@"Camera"];
  [sheet addButtonWithTitle:@"SavedPhotosAlbum"];
  [sheet addButtonWithTitle:@"取消"];
  sheet.cancelButtonIndex = 3;
  [sheet showFromToolbar:self.navigationController.toolbar];
}

- (void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  if ( buttonIndex == actionSheet.cancelButtonIndex ) {
  } else {
    UIImagePickerControllerSourceType sourceType = buttonIndex;
    if ( [UIImagePickerController isSourceTypeAvailable:sourceType] ) {
      UIImagePickerController* picker = [[[UIImagePickerController alloc] init] autorelease];
      picker.delegate = self;
      picker.sourceType = sourceType;
      picker.allowsEditing = YES;
	  //picker.cameraViewTransform = CGAffineTransformMakeScale(3.0, 1.0);
	  [self presentModalViewController:picker animated:YES];
    } else {
      NSLog( @"%d is not available.", sourceType );
    }
  }
}

//UIKIT_EXTERN NSString *const UIImagePickerControllerMediaType;      // an NSString (UTI, i.e. kUTTypeImage)
//UIKIT_EXTERN NSString *const UIImagePickerControllerOriginalImage;  // a UIImage
//UIKIT_EXTERN NSString *const UIImagePickerControllerEditedImage;    // a UIImage
//UIKIT_EXTERN NSString *const UIImagePickerControllerCropRect;       // an NSValue (CGRect)
//UIKIT_EXTERN NSString *const UIImagePickerControllerMediaURL;       // an NSURL

- (void)imagePickerController:(UIImagePickerController*)picker
  didFinishPickingMediaWithInfo:(NSDictionary*)info
{
  // 取得选择的照片
  UIImage* image = [info objectForKey:UIImagePickerControllerEditedImage];
  if ( !image ) {
    image = [info objectForKey:UIImagePickerControllerOriginalImage];
  } 
  imageView_.image = image;
  // 保存于相册时的处理如下
  UIImageWriteToSavedPhotosAlbum( image,
                                  self, 
                                  @selector(image:didFinishSavingWithError:contextInfo:),
                                  NULL );
  //关闭相册
  [self dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController*)picker {
  //取消时的处理动作，关闭相册
  [self dismissModalViewControllerAnimated:YES];
}

- (void)image:(UIImage*)image
  didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo
{
  if ( error ) {
    // error非nil保存失败
    NSLog( [error localizedDescription] );
  } else {
    // nil时保存成功
  }
}

@end
