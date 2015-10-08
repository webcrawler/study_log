    //
//  UIKitPrjScrollPaging.m
//  UIScrollViewSample
//
//  Created by tiger on 12-2-16.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "UIKitPrjScrollPaging.h"


@implementation UIKitPrjScrollPaging


- (void)viewDidLoad 
{
	self.navigationItem.title = @"ScrollPaging测试";
	self.view.backgroundColor = [UIColor blackColor];
	//初始化UIScrollView及UIPageControl实例，为了给UIPageControl控件流出显示位置，将起点坐标定为(0, 344)
	scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 345)];
	pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 344, 320, 36)];
	//初始化图片文件名数组
	images = [NSMutableArray arrayWithObjects:@"PHP5.jpg",@"mysql.jpg",@"iphone1.jpg",@"iphone2.jpg",@"jQuery.png",@"html5.png",nil];
	//将UIScrollView及UIPageControl实例追加到画面中
	[self.view addSubview:scrollView];
	[self.view addSubview:pageControl];
	//setupPage为本例中定义的实现图片显示的私有方法
	[self setupPage];
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload 
{
	[images release];
	[scrollView release];
	[pageControl release];
}


- (void)dealloc 
{
    [super dealloc];
}

#pragma mark -
#pragma mark The Guts
- (void)setupPage
{
	//设置UIScrollView实例各显示特性
	//设置委托类为自身，其中必须实现UIScrollViewDelegate协议中定义的scrollViewDidScroll:及scrollViewDidEndDecelerating:方法
	scrollView.delegate = self;
	[scrollView setBackgroundColor:[UIColor blackColor]];
	[scrollView setCanCancelContentTouches:NO];
	//设置滚动条类型
	scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
	scrollView.clipsToBounds = YES;
	scrollView.scrollEnabled = YES;
	//只有pagingEnabled为YES时才可进行画面切换
	scrollView.pagingEnabled = YES;
	scrollView.directionalLockEnabled =NO;
	//隐藏滚动条设置
	scrollView.alwaysBounceVertical=NO;
	scrollView.alwaysBounceHorizontal =NO;
	scrollView.showsVerticalScrollIndicator=NO;
	scrollView.showsHorizontalScrollIndicator=NO;

	NSUInteger nimages = 0;
	CGFloat cx = 0;
	//循环导入数值中的图片
	for (NSString *imagepath in images) {
		//初始化图片的UIImageView实例
		UIImageView *imageView = [[[UIImageView alloc] initWithFrame:CGRectZero] autorelease];
		//设置背景
		[imageView setBackgroundColor:[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0]];
		//导入图片
		UIImage *img = [UIImage imageNamed:imagepath];
		[imageView setImage:img];
		//设置各UIImageView实例位置，及UIImageView实例的frame属性值
		CGRect rect = scrollView.frame;
		rect.size.height = scrollView.frame.size.height;
		rect.size.width = scrollView.frame.size.width;
		rect.origin.x = cx;
		rect.origin.y = 0;
		imageView.frame = rect;
		//将图片内容的显示模式设置为自适应模式
		imageView.contentMode = UIViewContentModeScaleAspectFill;
		
		[scrollView addSubview:imageView];
		//移动左边准备导入下一图片
		cx += scrollView.frame.size.width;
		nimages++;
	}
	//注册UIPageControl实例的响应方法（事件为UIControlEventValueChanged）
	[pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
	//设置总页数
	pageControl.numberOfPages = nimages;
	//默认当前页为第1页
	pageControl.currentPage =0;
	pageControl.tag=0;
	//重置UIScrollView的尺寸
	[scrollView setContentSize:CGSizeMake(cx, [scrollView bounds].size.height)];
}

//实现UIScrollViewDelegate 中定义的方法
//滚动时调用的方法，其中判断画面滚动时机
- (void)scrollViewDidScroll:(UIScrollView *)_scrollView
{
    if (pageControlIsChangingPage) {
        return;
    }
	/*
	 *	下一画面拖动到超过50%时，进行切换
	 */
    CGFloat pageWidth = _scrollView.frame.size.width;
    int page = floor((_scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
}
//滚动完成时调用的方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)_scrollView 
{
    pageControlIsChangingPage = NO;
}

//UIPageControl实例的响应方法（事件为UIControlEventValueChanged）
- (void)changePage:(id)sender 
{
	/*
	 *	改变页面
	 */
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * pageControl.currentPage;
    frame.origin.y = 0;
	
    [scrollView scrollRectToVisible:frame animated:YES];
	
	/*
	 *	设置滚动标志，滚动（或称页面改变）完成时，会调用scrollViewDidEndDecelerating 方法，其中会将其置为off的
	 */
    pageControlIsChangingPage = YES;
}
@end
