//
//  UIKitPrjCameraOverlay.m
//
//  Created by wang on 2011-10-01.
//

#import "UIKitPrjCameraOverlay.h"

#pragma mark ----- CameraOverlayView -----

@implementation CameraOverlayView

@synthesize pickerController = pickerController_;

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.pickerController takePicture];
}

@end

#pragma mark ----- UIKitPrjCameraOverlay -----

@implementation UIKitPrjCameraOverlay

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
  [sheet addButtonWithTitle:@"Camera"];
  [sheet addButtonWithTitle:@"取消"];
  sheet.cancelButtonIndex = 1;
  [sheet showFromToolbar:self.navigationController.toolbar];
}

- (void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  if ( buttonIndex == actionSheet.cancelButtonIndex ) {
  } else {
    if ( [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] ) {
      UIImagePickerController* picker = [[[UIImagePickerController alloc] init] autorelease];
      picker.delegate = self;
      picker.sourceType = UIImagePickerControllerSourceTypeCamera;
	  //隐藏默认的摄影控制
      picker.showsCameraControls = NO;
	  //创建重叠用的UIView实例
      UIImage* image = [UIImage imageNamed:@"sniper.png"];
	  //创建并初始化CameraOverlayView实例（关于CameraOverlayView后面有介绍）
      CameraOverlayView* overlayView = [[[CameraOverlayView alloc] initWithImage:image] autorelease];
      overlayView.pickerController = picker;
      overlayView.frame = picker.view.bounds;
      overlayView.contentMode = UIViewContentModeScaleAspectFill;
      overlayView.autoresizingMask =
        UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
      overlayView.alpha = 0.5;
      overlayView.userInteractionEnabled = YES;
      picker.cameraOverlayView = overlayView;
      [self presentModalViewController:picker animated:YES];
    } else {
      NSLog( @"UIImagePickerControllerSourceTypeCamera is not available." );
    }
  }
}

- (void)imagePickerController:(UIImagePickerController*)picker
  didFinishPickingMediaWithInfo:(NSDictionary*)info
{
  // 获取选择或者拍摄的照片
  UIImage* image = [info objectForKey:UIImagePickerControllerEditedImage];
  if ( !image ) {
    image = [info objectForKey:UIImagePickerControllerOriginalImage];
  } 
  imageView_.image = image;

  [self dismissModalViewControllerAnimated:YES];
}

@end
