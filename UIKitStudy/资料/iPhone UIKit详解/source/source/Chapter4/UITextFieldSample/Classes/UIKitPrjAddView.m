//
//  UIKitPrjAddView.m
//
//  Created by wang on 2011-10-01.
//

#import "UIKitPrjAddView.h"

@implementation UIKitPrjAddView

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  UIImage* imageForLeft = [UIImage imageNamed:@"leftDog.png"];
  UIImageView* imageViewForLeft = [[[UIImageView alloc] initWithImage:imageForLeft] autorelease];
  UIImage* imageForRight = [UIImage imageNamed:@"rightDog.png"];
  UIImageView* imageViewForRight = [[[UIImageView alloc] initWithImage:imageForRight] autorelease];

  UITextField* textField1 = [[[UITextField alloc] init] autorelease];
  textField1.borderStyle = UITextBorderStyleRoundedRect;
  textField1.frame = CGRectMake( 20, 30, 280, 50 );
  textField1.text = @"一直在左右显示图片";
  textField1.textAlignment = UITextAlignmentCenter;
  textField1.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
  textField1.leftView = imageViewForLeft;//输入框左侧追加UIImageView
  textField1.rightView = imageViewForRight;//输入框右侧追加UIImageView
  textField1.leftViewMode = UITextFieldViewModeAlways;//让左侧UIView一直显示
  textField1.rightViewMode = UITextFieldViewModeAlways;//让右侧UIView一直显示
  [self.view addSubview:textField1];

  UITextField* textField2 = [[[UITextField alloc] init] autorelease];;
  textField2.borderStyle = UITextBorderStyleRoundedRect;
  textField2.frame = CGRectMake( 20, 100, 280, 50 );
  textField2.text = @"非编辑状态时右侧显示详细按钮";
  textField2.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
  UIButton* button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
  textField2.rightView = button;//输入框的右侧追加详细按钮
  textField2.rightViewMode = UITextFieldViewModeUnlessEditing;//只在非编辑模式下才显示
  [self.view addSubview:textField2];
}

@end
