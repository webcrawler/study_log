//
//  UIKitPrjBackground.m
//
//  Created by wang on 2011-10-01.
//

#import "UIKitPrjBackground.h"

@implementation UIKitPrjBackground

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  //导入背景图片，并设置成自动伸缩
  UIImage* imageWhitePaper = [UIImage imageNamed:@"paper.png"];
  UIImage* stretchableWhitePaper = [imageWhitePaper stretchableImageWithLeftCapWidth:20 topCapHeight:20];
  UIImage* imageGrayPaper = [UIImage imageNamed:@"paperGray.png"];
  UIImage* stretchableGrayPaper = [imageGrayPaper stretchableImageWithLeftCapWidth:20 topCapHeight:20];
  //创建UITextField实例
  UITextField* textField = [[[UITextField alloc] init] autorelease];
  textField.delegate = self;
  textField.frame = CGRectMake( 20, 100, 280, 50 );
  textField.background = stretchableWhitePaper;//设置背景图片
  textField.disabledBackground = stretchableGrayPaper;
  textField.text = @"MEMO";
  textField.textAlignment = UITextAlignmentCenter;
  textField.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
  [self.view addSubview:textField];
}

- (BOOL)textFieldShouldReturn:(UITextField*)textField {
  textField.enabled = NO;
  return YES;
}

@end
