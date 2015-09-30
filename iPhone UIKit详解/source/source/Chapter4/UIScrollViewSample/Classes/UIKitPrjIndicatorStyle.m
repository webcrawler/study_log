//
//  UIKitPrjIndicatorStyle.m
//
//  Created by wang on 2011-10-04.
//
		
#import "UIKitPrjIndicatorStyle.h"

@implementation UIKitPrjIndicatorStyle

- (void)dealloc {
  [scrollView_ release]; 
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // ScrollView初始化
  scrollView_ = [[UIScrollView alloc] init];
  scrollView_.frame = self.view.bounds;
  scrollView_.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  // 设置能翻滚的区域
  UIView* view = [[[UIView alloc] init] autorelease];
  view.frame = CGRectMake( 0, 0, 800, 600 );
  view.backgroundColor = [UIColor grayColor];
  scrollView_.contentSize = view.bounds.size;
  [scrollView_ addSubview:view];
  // 将ScrollView追加到画面上
  [self.view addSubview:scrollView_];

  UIBarButtonItem* barButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"Style切换"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(changeButtonDidPush)] autorelease];
  [self setToolbarItems:[NSArray arrayWithObject:barButton]];
}

- (void)changeButtonDidPush {
  if ( UIScrollViewIndicatorStyleWhite < ++scrollView_.indicatorStyle ) {
    scrollView_.indicatorStyle = UIScrollViewIndicatorStyleDefault;
  } 
}

@end
