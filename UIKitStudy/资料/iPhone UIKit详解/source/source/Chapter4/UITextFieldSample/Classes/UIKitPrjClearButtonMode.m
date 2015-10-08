//
//  UIKitPrjClearButtonMode.m
//
//  Created by wang on 2011-10-01.
//

#import "UIKitPrjClearButtonMode.h"

@implementation UIKitPrjClearButtonMode

- (void)dealloc {
  [textFields_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  UITextField* textField1 = [[[UITextField alloc] init] autorelease];
  textField1.delegate = self;
  textField1.clearsOnBeginEditing = YES;
  textField1.frame = CGRectMake( 20, 20, 280, 30 );
  textField1.borderStyle = UITextBorderStyleRoundedRect;
  textField1.clearButtonMode = UITextFieldViewModeNever;
  textField1.text = @"UITextFieldViewModeNever";
  [self.view addSubview:textField1];

  UITextField* textField2 = [[[UITextField alloc] init] autorelease];
  textField2.delegate = self;
  textField2.frame = CGRectMake( 20, 60, 280, 30 );
  textField2.borderStyle = UITextBorderStyleRoundedRect;
  textField2.clearButtonMode = UITextFieldViewModeWhileEditing;
  textField2.text = @"UITextFieldViewModeWhileEditing";
  [self.view addSubview:textField2];

  UITextField* textField3 = [[[UITextField alloc] init] autorelease];
  textField3.delegate = self;
  textField3.frame = CGRectMake( 20, 100, 280, 30 );
  textField3.borderStyle = UITextBorderStyleRoundedRect;
  textField3.clearButtonMode = UITextFieldViewModeUnlessEditing;
  textField3.text = @"UITextFieldViewModeUnlessEditing";
  [self.view addSubview:textField3];

  UITextField* textField4 = [[[UITextField alloc] init] autorelease];
  textField4.delegate = self;
  textField4.frame = CGRectMake( 20, 140, 280, 30 );
  textField4.borderStyle = UITextBorderStyleRoundedRect;
  textField4.clearButtonMode = UITextFieldViewModeAlways;
  textField4.text = @"UITextFieldViewModeAlways";
  [self.view addSubview:textField4];

  textFields_ = [[NSArray alloc] initWithObjects:textField1, textField2, textField3, textField4, nil];
}

- (BOOL)textFieldShouldClear:(UITextField*)textField {
  NSLog( @"textFieldShouldClear:%@", textField.text );
  return YES;
}

@end
