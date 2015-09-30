//
//  UIKitPrjPaging.m
//
//  Created by wang on 2011-10-04.
//

#import "UIKitPrjPaging.h"

#pragma mark ----- MyViewController -----

@implementation MyViewController

@synthesize number = number_;
//传入数值初始化MyViewController实例的类方法
+ (MyViewController*)myViewControllerWithNumber:(NSInteger)number {
  MyViewController* myViewController = [[[MyViewController alloc] init] autorelease];
  myViewController.number = number;
  return myViewController;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  UILabel* label = [[[UILabel alloc] init] autorelease];
  label.frame = self.view.bounds;
  label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label.backgroundColor = ( self.number % 2 ) ? [UIColor blackColor] : [UIColor whiteColor];
  label.textColor = !( self.number % 2 ) ? [UIColor blackColor] : [UIColor whiteColor];
  label.textAlignment = UITextAlignmentCenter;
  label.font = [UIFont boldSystemFontOfSize:128];
  label.text = [NSString stringWithFormat:@"%d", self.number];
  [self.view addSubview:label];
}

@end

#pragma mark ----- UIKitPrjPaging -----

@implementation UIKitPrjPaging

static const NSInteger kNumberOfPages = 3;
static const NSInteger kViewHeight = 360;

- (void)viewDidLoad {
  [super viewDidLoad];

  // ScrollView的初始化
  UIScrollView* scrollView = [[[UIScrollView alloc] init] autorelease];
  scrollView.frame = self.view.bounds;
  scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  // 为了能进行画面横向翻滚，设置内容的横向长度
  scrollView.contentSize = CGSizeMake( 320 * kNumberOfPages, kViewHeight );
  // 以页为单位翻滚
  scrollView.pagingEnabled = YES;
  // 隐藏滚动条
  scrollView.showsHorizontalScrollIndicator = NO;
  scrollView.showsVerticalScrollIndicator = NO;
  // 关闭翻滚到顶部
  scrollView.scrollsToTop = NO;
  // 将各画面追加到ScrollView
  for ( int i = 0; i < kNumberOfPages; ++i ){
    MyViewController* myViewController = [MyViewController myViewControllerWithNumber:i];
    myViewController.view.frame = CGRectMake( 320 * i, 0, 320, kViewHeight );
    [scrollView addSubview:myViewController.view];
  }
  // 将ScrollView追加到主画面
  [self.view addSubview:scrollView];
}

@end
