//
//  UIKitPrjSimple.m
//
//  Created by wang on 2011-10-01.
//

#import "UIKitPrjSimple.h"

@implementation UIKitPrjSimple

- (void)dealloc {
  [textFields_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  UITextField* textField1 = [[[UITextField alloc] init] autorelease];
  textField1.delegate = self;
  textField1.frame = CGRectMake( 20, 20, 280, 30 );
  textField1.borderStyle = UITextBorderStyleLine;
  textField1.text = @"UITextBorderStyleLine";
  textField1.returnKeyType = UIReturnKeyNext;
  [self.view addSubview:textField1];

  UITextField* textField2 = [[[UITextField alloc] init] autorelease];
  textField2.delegate = self;
  textField2.frame = CGRectMake( 20, 60, 280, 30 );
  textField2.borderStyle = UITextBorderStyleBezel;
  textField2.text = @"UITextBorderStyleBezel";
  textField2.returnKeyType = UIReturnKeyNext;
  [self.view addSubview:textField2];

  UITextField* textField3 = [[[UITextField alloc] init] autorelease];
  textField3.delegate = self;
  textField3.frame = CGRectMake( 20, 100, 280, 30 );
  textField3.borderStyle = UITextBorderStyleRoundedRect;
  textField3.text = @"UITextBorderStyleRoundedRect";
  textField3.returnKeyType = UIReturnKeyNext;
  [self.view addSubview:textField3];

  UITextField* textField4 = [[[UITextField alloc] init] autorelease];
  textField4.delegate = self;
  textField4.frame = CGRectMake( 20, 140, 280, 30 );
  textField4.borderStyle = UITextBorderStyleNone;
  textField4.text = @"UITextBorderStyleNone";
  textField4.returnKeyType = UIReturnKeyNext;
  [self.view addSubview:textField4];

  textFields_ = [[NSArray alloc] initWithObjects:textField1, textField2, textField3, textField4, nil];
}

- (void)textFieldDidBeginEditing:(UITextField*)textField {
  currentFieldIndex_ = [textFields_ indexOfObject:textField];
}

- (BOOL)textFieldShouldReturn:(UITextField*)textField {
  if ( textFields_.count <= ++currentFieldIndex_ ) {
    currentFieldIndex_ = 0;
  } 
  UITextField* newField = [textFields_ objectAtIndex:currentFieldIndex_];
  if ( [newField canBecomeFirstResponder] ) {
    [newField becomeFirstResponder];
  } 
  return YES;
}

@end
