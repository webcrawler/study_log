    //
//  UIKitPrjAlphaCompare.m
//  UIViewSample
//
//  Created by tiger on 12-2-8.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "UIKitPrjAlphaCompare.h"


@implementation UIKitPrjAlphaCompare

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
	// 背景设置为黑
	self.view.backgroundColor = [UIColor blackColor];
	
	// 追加图像View
	
	UIImage* image = [UIImage imageNamed:@"narrow_dog.jpg"] ;
	
	UIImageView *imageView_ = [[UIImageView alloc] initWithImage:image];
	imageView_.frame =  CGRectMake( 0, 0, 320, 320 );
	//imageView_.contentMode = UIViewContentModeScaleAspectFill;
	[self.view addSubview:imageView_];
	UILabel *labelParent_ = [[[UILabel alloc] init] autorelease];
	labelParent_.frame =  CGRectMake( 0, 0, 320, 320 );
	labelParent_.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
	labelParent_.textAlignment = UITextAlignmentCenter;
	labelParent_.backgroundColor = [UIColor blackColor];
	//label1.alpha = 0.5;
	labelParent_.backgroundColor = [labelParent_.backgroundColor colorWithAlphaComponent:0.5];
	labelParent_.text = @"Parent";
	
	UILabel *label2 = [[[UILabel alloc] init] autorelease];
	label2.frame =  CGRectMake( 10, 210, 100, 100 );
	label2.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
	label2.textAlignment = UITextAlignmentCenter;
	//label2.backgroundColor = [UIColor blackColor];
	label2.alpha = 0.6;
	label2.text = @"Child1";
	[labelParent_ addSubview:label2];
	UILabel *label3 = [[[UILabel alloc] init] autorelease];
	label3.frame =  CGRectMake( 210, 210, 100, 100 );
	label3.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
	label3.textAlignment = UITextAlignmentCenter;
	//label3.backgroundColor = [UIColor blackColor];
	label3.alpha = 0.2;
	label3.text = @"Child2";
	[labelParent_ addSubview:label3];
	[self.view addSubview:labelParent_];
}
- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
	[self.navigationController setNavigationBarHidden:NO animated:YES];
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
