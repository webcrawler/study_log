    //
//  UIKitPrjSaveAnyClass.m
//  ApplicationAndDeviceSample
//
//  Created by tiger on 12-2-6.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "UIKitPrjSaveAnyClass.h"
#import "TitleAndBody.h"

#define kPasteboardTypeSample @"sample"

@implementation UIKitPrjSaveAnyClass

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
	
	TitleAndBody *object = [[TitleAndBody alloc] init];
	object.title = @"tit";
	object.body  = @"bod";
	//将自定义转换成NSData
	NSData *data = [NSKeyedArchiver archivedDataWithRootObject:object];
	[object release];
	//指定类型名将NSData保存于剪贴板
	[pasteboard setData:data forPasteboardType:kPasteboardTypeSample];
	
	//指定类型名从剪贴板中读取NSData
	if ([pasteboard containsPasteboardTypes:[NSArray arrayWithObject:kPasteboardTypeSample]]) {
		NSData *pasteData = [pasteboard dataForPasteboardType:kPasteboardTypeSample];
		//将NSData复原成自定义类
		TitleAndBody *pasteObj = [NSKeyedUnarchiver unarchiveObjectWithData:pasteData];
		NSLog(pasteObj.title);
		NSLog(pasteObj.body);
	}
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
