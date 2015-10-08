//
//  UIKitPrjWithVideo.m
//
//  Created by wang on 2011-10-01.
//

#import "UIKitPrjWithVideo.h"
#import <MobileCoreServices/MobileCoreServices.h>

@implementation UIKitPrjWithVideo

- (void)viewDidLoad {
  [super viewDidLoad];

  UIBarButtonItem* barButton =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
                                                   target:self
                                                   action:@selector(barButtonDidPush)] autorelease];
  [self setToolbarItems:[NSArray arrayWithObject:barButton] animated:NO];
}

- (void)barButtonDidPush {
  UIActionSheet* sheet = [[[UIActionSheet alloc] init] autorelease];
  sheet.delegate = self;
  [sheet addButtonWithTitle:@"PhotoLibrary"];
  [sheet addButtonWithTitle:@"Video"];
  [sheet addButtonWithTitle:@"取消"];
  sheet.cancelButtonIndex = 2;
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
      picker.videoQuality = UIImagePickerControllerQualityTypeLow;
      picker.videoMaximumDuration = 10;
	  //调查指定sourceType是否支持视频
      NSArray* mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:sourceType];
      if ( [mediaTypes containsObject:(NSString*)kUTTypeMovie] ) {
		//支持视频的情况下，将kUTTypeMovie追加到mediaTypes属性中
        picker.mediaTypes = [NSArray arrayWithObject:(NSString*)kUTTypeMovie];
      } else {
        NSLog( @"%@ is not available.", kUTTypeMovie );
      }
      [self presentModalViewController:picker animated:YES];
    } else {
      NSLog( @"%d is not available.", sourceType );
    }
  }
}

- (void)imagePickerController:(UIImagePickerController*)picker
  didFinishPickingMediaWithInfo:(NSDictionary*)info
{
  // 判定选择的是否为视频
  NSString* mediaType = [info objectForKey:UIImagePickerControllerMediaType];
  if ( [mediaType isEqualToString:(NSString*)kUTTypeMovie] ) {
    NSURL* mediaURL = [info objectForKey:UIImagePickerControllerMediaURL];
    NSString* mediaPath = [mediaURL path];
    if ( UIVideoAtPathIsCompatibleWithSavedPhotosAlbum( mediaPath ) ) {
	  //将视频保存于相册中
	  //方法UISaveVideoAtPathToSavedPhotosAlbum的第2个参数以后与保存照片时完全相同，此处省略说明
      UISaveVideoAtPathToSavedPhotosAlbum( mediaPath,
                                           self,
                                           @selector(video:didFinishSavingWithError:contextInfo:),
                                           NULL );
    } else {
      NSLog( @"不能保存到相册中的处理" );
    }
  } else {
    NSLog( @"非视频时的处理" );
  }
  [self dismissModalViewControllerAnimated:YES];
}

- (void)video:(NSString*)videoPath
  didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo
{
  if ( error ) {
    // error非空（nil）时保存失败
    NSLog( [error localizedDescription] );
  } else {
    // 否则保存成功
  }
}

@end
