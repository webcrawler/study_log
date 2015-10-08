    //
//  UIKitPrjCopyBase.m
//  ApplicationAndDeviceSample
//
//  Created by tiger on 12-2-6.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "UIKitPrjCopyBase.h"


@implementation UIKitPrjCopyBase




// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	label_ = [[UILabel alloc] init];
	label_.frame = [[UIScreen mainScreen] bounds];
	label_.font = [UIFont boldSystemFontOfSize:48];
	label_.numberOfLines = 3;
	label_.text = @"将此标签中字符串复制到粘贴板中";
	[self.view addSubview:label_];
}
//不成为第一响应者无法显示编辑菜单
- (BOOL)canBecomeFirstResponder {
	return YES;
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
	UITouch* touch = [touches anyObject];
	if ( [self becomeFirstResponder] && 1 < [touch tapCount] ) {
		// 连续两次触碰后显示编辑菜单
		UIMenuController* menu = [UIMenuController sharedMenuController];
		CGPoint touchPoint_ = [touch locationInView:self.view];
		CGRect minRect;
		minRect.origin = touchPoint_;
		[menu setTargetRect:minRect inView:self.view];
		[menu setMenuVisible:YES animated:YES];
	} 
}
//使复制命令可被使用
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
	if ( @selector(copy:) == action ) {
		return YES;
	} 
	return [super canPerformAction:action withSender:sender];
}
//执行复制命令时被调用
//label_为UILabel的实例
- (void)copy:(id)sender {
	[UIPasteboard generalPasteboard].string = label_.text;
}




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
