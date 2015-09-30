//
//  UIKitPrjPageControl.m
//
//  Created by wang on 2011-08-15.
//

#import "UIKitPrjPageControl.h"

@implementation UIKitPrjPageControl

- (void)dealloc {
  [pageControl_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  pageControl_ = [[UIPageControl alloc] init];
  pageControl_.frame = CGRectMake( 0, self.view.bounds.size.height - 30, 320, 30 );
  pageControl_.backgroundColor = [UIColor blackColor]; //< 必须改变背景色（很关键）
  [pageControl_ addTarget:self
                   action:@selector(pageControlDidChange:)
         forControlEvents:UIControlEventValueChanged];
  pageControl_.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
                                  UIViewAutoresizingFlexibleBottomMargin;
  pageControl_.numberOfPages = 5;
  pageControl_.currentPage = 0;
//  pageControl_.defersCurrentPageDisplay = YES;
  [self.view addSubview:pageControl_];

  UIBarButtonItem* addButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"追加页"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(addDidPush)] autorelease];
  UIBarButtonItem* delButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"删除页"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(delDidPush)] autorelease];
  NSArray* items = [NSArray arrayWithObjects:addButton, delButton, nil];
  [self setToolbarItems:items animated:NO];
}

- (void)pageControlDidChange:(id)sender {
  // 此处更新页控制显示
//  UIPageControl* pageControl = (UIPageControl*)sender;
//  [pageControl updateCurrentPageDisplay];
}

- (void)addDidPush {
  if ( 10 > pageControl_.numberOfPages ) {
    ++pageControl_.numberOfPages;
  } 
}

- (void)delDidPush {
  if ( 1 < pageControl_.numberOfPages ) {
    --pageControl_.numberOfPages;
    [self pageControlDidChange:pageControl_];
  } 
}

@end
