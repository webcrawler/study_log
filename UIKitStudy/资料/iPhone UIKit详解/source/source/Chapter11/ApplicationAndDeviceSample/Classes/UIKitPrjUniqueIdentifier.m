//
//  UIKitPrjUniqueIdentifier.m
//
//  Created by wang on 2011-10-01.
//

#import "UIKitPrjUniqueIdentifier.h"

@implementation UIKitPrjUniqueIdentifier

- (void)dealloc {
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  UILabel* label = [[[UILabel alloc] init] autorelease];
  label.frame = self.view.bounds;
  label.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label.numberOfLines = 4;
  NSString* identifier = [UIDevice currentDevice].uniqueIdentifier;
  label.text = [NSString stringWithFormat:@"uniqueIdentifier: %@", identifier];
  label.font = [UIFont systemFontOfSize:36];
  [self.view addSubview:label];
}

- (void)copy:(id)sender {
  [UIPasteboard generalPasteboard].string = [UIDevice currentDevice].uniqueIdentifier;
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  if ( [self becomeFirstResponder] ) {
    UITouch* touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    UIMenuController* menu = [UIMenuController sharedMenuController];
    CGRect minRect;
    minRect.origin = point;
    [menu setTargetRect:minRect inView:self.view];
    [menu setMenuVisible:YES animated:YES];
  } 
}

- (BOOL)canBecomeFirstResponder {
  return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
  if ( @selector(copy:) == action ) {
    return YES;
  }
  return [super canPerformAction:action withSender:sender];
}

@end
