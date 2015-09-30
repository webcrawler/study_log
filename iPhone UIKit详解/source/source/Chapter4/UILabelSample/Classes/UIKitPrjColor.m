//
//  UIKitPrjColor.m
//
//  Created by wang on 2011-09-25.
//

#import "UIKitPrjColor.h"

@implementation UIKitPrjColor

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"textColor";

  self.view.backgroundColor = [UIColor blackColor];

  NSInteger y = 0;
  for ( int r = 0; r < 2; ++r ){
      for ( int g = 0; g < 2; ++g ){
        for ( int b = 0; b < 2; ++b ){
          UIColor* color = [[[UIColor alloc] initWithRed:r*0.5
                                                   green:g*0.5
                                                    blue:b*0.5
                                                     alpha:1.0] autorelease];
          UILabel* label =
            [[[UILabel alloc] initWithFrame:CGRectMake( 0, y, 320, 30 )] autorelease];
          label.textColor = color;
          label.text =
            [NSString stringWithFormat:@"  R:%.1f  G:%.1f  B:%.1f", r*0.5, g*0.5, b*0.5];
          [self.view addSubview:label];

          y += 40;
      }
    }
  }
}

@end
