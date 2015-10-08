//
//  UIKitPrjLineBreak.m
//
//  Created by wang on 2011-09-25.
//

#import "UIKitPrjLineBreak.h"

@implementation UIKitPrjLineBreak

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"LineBreak";
  self.view.backgroundColor = [UIColor blackColor];

  UILabel* label0 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 10, 320, 40 )] autorelease];
  UILabel* label1 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 60, 320, 40 )] autorelease];
  UILabel* label2 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 110, 320, 40 )] autorelease];
  UILabel* label3 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 160, 320, 40 )] autorelease];
  UILabel* label4 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 210, 320, 40 )] autorelease];
  UILabel* label5 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 260, 320, 40 )] autorelease];

  label0.text = @"UILineBreakModeWordWrap________ test/test test/test test/test abcdefghijklmnopqrstuwxyz12345678901234567890";
  label1.text = @"UILineBreakModeCharacterWrap___ test/test test/test test/test abcdefghijklmnopqrstuwxyz12345678901234567890";
  label2.text = @"UILineBreakModeClip____________ test/test test/test test/test abcdefghijklmnopqrstuwxyz12345678901234567890";
  label3.text = @"UILineBreakModeHeadTruncation__ test/test test/test test/test abcdefghijklmnopqrstuwxyz12345678901234567890";
  label4.text = @"UILineBreakModeTailTruncation__ test/test test/test test/test abcdefghijklmnopqrstuwxyz12345678901234567890";
  label5.text = @"UILineBreakModeMiddleTruncation test/test test/test test/test abcdefghijklmnopqrstuwxyz12345678901234567890";

  label0.numberOfLines = 2;
  label1.numberOfLines = 2;
  label2.numberOfLines = 2;
  label3.numberOfLines = 2;
  label4.numberOfLines = 2;
  label5.numberOfLines = 2;

  label0.lineBreakMode = UILineBreakModeWordWrap;
  label1.lineBreakMode = UILineBreakModeCharacterWrap;
  label2.lineBreakMode = UILineBreakModeClip;
  label3.lineBreakMode = UILineBreakModeHeadTruncation;
  label4.lineBreakMode = UILineBreakModeTailTruncation;
  label5.lineBreakMode = UILineBreakModeMiddleTruncation;

  [self.view addSubview:label0];
  [self.view addSubview:label1];
  [self.view addSubview:label2];
  [self.view addSubview:label3];
  [self.view addSubview:label4];
  [self.view addSubview:label5];
}

@end
