//
//  UIKitPrjVideoEditor.m
//
//  Created by wang on 2011-10-01.
//

#import "UIKitPrjVideoEditor.h"

@implementation UIKitPrjVideoEditor

- (void)viewDidLoad {
  [super viewDidLoad];

  UIBarButtonItem* barButton =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                   target:self
                                                   action:@selector(barButtonDidPush)] autorelease];
  [self setToolbarItems:[NSArray arrayWithObject:barButton] animated:NO];
}

- (void)barButtonDidPush {
  UIActionSheet* sheet = [[[UIActionSheet alloc] init] autorelease];
  sheet.delegate = self;
  [sheet addButtonWithTitle:@"VideoEditor"];
  [sheet addButtonWithTitle:@"取消"];
  sheet.cancelButtonIndex = 1;
  [sheet showFromToolbar:self.navigationController.toolbar];
}

- (void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  if ( buttonIndex == actionSheet.cancelButtonIndex ) {
  } else {
    UIVideoEditorController* videoEditor = [[[UIVideoEditorController alloc] init] autorelease];
    videoEditor.delegate = self;
	//准备使用Resources目录中的test.MOV视频文件
    NSString* videoPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"MOV"];
    if ( [UIVideoEditorController canEditVideoAtPath:videoPath] ) {
      videoEditor.videoPath = videoPath;
      [self presentModalViewController:videoEditor animated:YES];
    } else {
      NSLog( @"can't edit video at %@", videoPath );
    }
  }
}

- (void)videoEditorControllerDidCancel:(UIVideoEditorController*)editor {
  [editor dismissModalViewControllerAnimated:YES];
}

- (void)videoEditorController:(UIVideoEditorController*)editor
  didSaveEditedVideoToPath:(NSString*)editedVideoPath
{
  // 保存到相册中
  if ( UIVideoAtPathIsCompatibleWithSavedPhotosAlbum( editedVideoPath ) ) {
    UISaveVideoAtPathToSavedPhotosAlbum( editedVideoPath,
                                         self,
                                         @selector(video:didFinishSavingWithError:contextInfo:),
                                         NULL );
  } else {
    NSLog( @"不能保持到相册时的处理" );
  }
  [editor dismissModalViewControllerAnimated:YES];
}

- (void)videoEditorController:(UIVideoEditorController*)editor didFailWithError:(NSError*)error {
  NSLog( @"%X", error );
  [editor dismissModalViewControllerAnimated:YES];
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
