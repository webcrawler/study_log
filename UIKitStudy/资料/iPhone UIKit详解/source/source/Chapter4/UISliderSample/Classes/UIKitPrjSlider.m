//
//  UIKitPrjSlider.m
//
//  Created by wang on 2011-10-01.
//

#import "UIKitPrjSlider.h"

@implementation UIKitPrjSlider

- (void)dealloc {
  [label_ release]; 
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  label_ = [[UILabel alloc] init];
  label_.frame = self.view.bounds;
  label_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label_.text = @"0.5";
  label_.font = [UIFont boldSystemFontOfSize:36];
  label_.textAlignment = UITextAlignmentCenter;
  [self.view addSubview:label_];

  UISlider* slider = [[[UISlider alloc] init] autorelease];
  slider.frame = CGRectMake( 0, 0, 250, 50 );
  slider.minimumValue = 0.0;
  slider.maximumValue = 1.0;
  slider.value = 0.5; //< 初期値の設定
  slider.center = self.view.center;

  [slider addTarget:self
             action:@selector(sliderDidChange:)
   forControlEvents:UIControlEventValueChanged];

  [self.view addSubview:slider];
}

- (void)sliderDidChange:(id)sender {
  if ( [sender isKindOfClass:[UISlider class]] ) {
    UISlider* slider = sender;
    label_.text = [NSString stringWithFormat:@"%0.1f", slider.value];
  } 
}

@end
