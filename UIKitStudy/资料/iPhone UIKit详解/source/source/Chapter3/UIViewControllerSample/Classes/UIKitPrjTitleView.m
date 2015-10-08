//
//  UIKitPrjTitleView.m
//
//  Created by Wang on 2011-08-16.
//

#import "UIKitPrjTitleView.h"


//声明私有方法
@interface UIKitPrjTitleView ()
- (void)sliderDidChange;
@end 


@implementation UIKitPrjTitleView

// finalize
- (void)dealloc {
  [slider_ release];
  [label_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  //顶部信息设置
  self.navigationItem.prompt = @"移动滑块后将改变画面颜色";
  //创建UISlider实例，滑块变化时调用sliderDidChange方法
  slider_ = [[UISlider alloc] init];
  slider_.frame = self.navigationController.navigationBar.bounds;
  slider_.minimumValue = 0.0;
  slider_.maximumValue = 1.0;
  slider_.value = slider_.maximumValue / 2.0;
  [slider_ addTarget:self
             action:@selector(sliderDidChange)
   forControlEvents:UIControlEventValueChanged];
  self.navigationItem.titleView = slider_;
  //创建标签，并根据滑块的值改变标签的颜色
  label_ = [[UILabel alloc] init];
  label_.frame = CGRectInset( self.view.bounds, 10, 10 );
  label_.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label_.backgroundColor = [UIColor blackColor];
  [self.view addSubview:label_];
  //调用sliderDidChange方法设置滑块初始值
  [self sliderDidChange];
}
//确保显示导航条以及工具条
- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setNavigationBarHidden:NO animated:NO];
  [self.navigationController setToolbarHidden:NO animated:NO];
  [self.navigationItem setHidesBackButton:YES animated:NO];
}

#pragma mark ----- Private Methods -----
//画面显示时隐藏返回按钮，触摸画面后显示返回按钮
- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationItem setHidesBackButton:NO animated:YES];
}
//实现滑块移动时调用的方法，改变标签的颜色
- (void)sliderDidChange {
  UIColor* color = [[[UIColor alloc] initWithRed:slider_.value
                                           green:slider_.value
                                            blue:slider_.value
                                           alpha:1.0 ] autorelease];
  label_.backgroundColor = color;
}

@end
