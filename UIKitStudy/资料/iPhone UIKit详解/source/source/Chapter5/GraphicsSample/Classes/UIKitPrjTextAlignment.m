//
//  UIKitPrjTextAlignment.m
//
//  Created by wang on 2011-09-24.
//

#import "UIKitPrjTextAlignment.h"

@implementation TextAlignmentTest

- (id)initWithTextAlignment:(UITextAlignment)textAlignment {
  if ( (self = [super init]) ) {
    textAlignment_ = textAlignment;
    self.backgroundColor = [UIColor whiteColor];    
    self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                            UIViewAutoresizingFlexibleRightMargin |
                            UIViewAutoresizingFlexibleTopMargin |
                            UIViewAutoresizingFlexibleBottomMargin;
  }
  return self;
}

- (void)drawRect:(CGRect)rect {
  NSString* message;
  switch ( textAlignment_ ) {
    case UITextAlignmentLeft:
      message = @"UITextAlignmentLeft";
      break;
    case UITextAlignmentCenter:
      message = @"UITextAlignmentCenter";
      break;
    case UITextAlignmentRight:
      message = @"UITextAlignmentRight";
      break;
    default:
      break;
  }
  UIFont* systemFont = [UIFont systemFontOfSize:18];
  [message drawInRect:rect
              withFont:systemFont
         lineBreakMode:UILineBreakModeWordWrap
             alignment:textAlignment_];
}

@end

@implementation UIKitPrjTextAlignment

- (void)viewDidLoad {
  [super viewDidLoad];

  TextAlignmentTest* test1 =
    [[[TextAlignmentTest alloc] initWithTextAlignment:UITextAlignmentLeft] autorelease];
  test1.frame = CGRectMake( 0, 10, 320, 40 );
  [self.view addSubview:test1];

  TextAlignmentTest* test2 =
    [[[TextAlignmentTest alloc] initWithTextAlignment:UITextAlignmentCenter] autorelease];
  test2.frame = CGRectMake( 0, 70, 320, 40 );
  [self.view addSubview:test2];

  TextAlignmentTest* test3 =
    [[[TextAlignmentTest alloc] initWithTextAlignment:UITextAlignmentRight] autorelease];
  test3.frame = CGRectMake( 0, 130, 320, 40 );
  [self.view addSubview:test3];
}

@end
