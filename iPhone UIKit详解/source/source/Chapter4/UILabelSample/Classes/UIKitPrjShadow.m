//
//  UIKitPrjShadow.m
//
//  Created by wang on 2011-09-25.
//

#import "UIKitPrjShadow.h"

@implementation UIKitPrjShadow

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"shadowOffset";

  self.view.backgroundColor = [UIColor blackColor];

  UILabel* label0 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 10, 320, 40 )] autorelease];
  UILabel* label1 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 60, 320, 40 )] autorelease];
  UILabel* label2 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 110, 320, 40 )] autorelease];
  UILabel* label3 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 160, 320, 40 )] autorelease];

  label0.textAlignment = UITextAlignmentCenter;
  label1.textAlignment = UITextAlignmentCenter;
  label2.textAlignment = UITextAlignmentCenter;
  label3.textAlignment = UITextAlignmentCenter;

  label1.shadowColor = [UIColor grayColor];
  label2.shadowColor = [UIColor grayColor];
  label3.shadowColor = [UIColor grayColor];
  label2.shadowOffset = CGSizeMake( 1, 1 );
  label3.shadowOffset = CGSizeMake( 3, 0 );
  label0.text = @"无阴影";
  label1.text = @"默认的shadowOffset";
  label2.text = @"shadowOffset = CGSizeMake( 1, 1 )";
  label3.text = @"shadowOffset = CGSizeMake( 3, 0 )";

  [self.view addSubview:label0];
  [self.view addSubview:label1];
  [self.view addSubview:label2];
  [self.view addSubview:label3];
}

@end
