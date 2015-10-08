//
//  UIKitPrjTouch.m
//
//  Created by wang on 2011-09-25. 
//

#import "UIKitPrjTouch.h"

#pragma mark ----- LabelChild -----

@implementation LabelChild

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:@"LabelChild"
                                                   message:@"touchesBegan"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil ] autorelease];

  [alert show];
}

@end

#pragma mark ----- UIKitPrjTouch -----

@implementation UIKitPrjTouch

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"Touch";
  self.view.backgroundColor = [UIColor blackColor];

  LabelChild* label0 = [[[LabelChild alloc] initWithFrame:CGRectMake( 0, 10, 320, 40 )] autorelease];
  LabelChild* label1 = [[[LabelChild alloc] initWithFrame:CGRectMake( 0, 60, 320, 40 )] autorelease];

  label0.textAlignment = UITextAlignmentCenter;
  label1.textAlignment = UITextAlignmentCenter;

  label0.userInteractionEnabled = NO;
  label1.userInteractionEnabled = YES;

  label0.text = @"userInteractionEnabled = NO";
  label1.text = @"userInteractionEnabled = YES";

  [self.view addSubview:label0];
  [self.view addSubview:label1];
}

@end
