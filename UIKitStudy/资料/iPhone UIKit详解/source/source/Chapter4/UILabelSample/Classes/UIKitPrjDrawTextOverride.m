//
//  UIKitPrjDrawTextOverride.m
//
//  Created by wang on 2011-09-25.
//

#import "UIKitPrjDrawTextOverride.h"

@implementation ThickTextLabel

- (void)drawTextInRect:(CGRect)rect {
  for ( int y = -2; y <= 4; ++y ){
    for ( int x = -2; x <= 4; ++x ){
      CGRect drawRect = CGRectMake( rect.origin.x + x,
                                    rect.origin.y + y,
                                    rect.size.width,
                                    rect.size.height );
      [self.text drawInRect:drawRect withFont:self.font
                                lineBreakMode:self.lineBreakMode
                                    alignment:self.textAlignment];
    }
  }
}

@end

@implementation UIKitPrjDrawTextOverride

- (void)viewDidLoad {
  [super viewDidLoad];

  // 普通的UILabel
  UILabel* normalLabel = [[[UILabel alloc] init] autorelease];
  normalLabel.frame = CGRectMake( 0, 50, 320, 60 );
  normalLabel.textAlignment = UITextAlignmentCenter;
  normalLabel.font = [UIFont systemFontOfSize:48];
  normalLabel.text = @"普通文本";
  [self.view addSubview:normalLabel];

  // 使用定制UILabel子类
  ThickTextLabel* newLabel = [[[ThickTextLabel alloc] init] autorelease];
  newLabel.frame = CGRectMake( 0, 130, 320, 60 );
  newLabel.textAlignment = UITextAlignmentCenter;
  newLabel.font = [UIFont systemFontOfSize:48];
  newLabel.text = @"普通文本";
  [self.view addSubview:newLabel];
}

@end
