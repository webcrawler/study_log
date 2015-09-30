//
//  UIKitPrjScrollPaging.h
//  UIScrollViewSample
//
//  Created by tiger on 12-2-16.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIKitPrjScrollPaging : UIViewController
<UIScrollViewDelegate>
{
	//定义UIScrollView与UIPageControl实例变量
	UIScrollView* scrollView;
	UIPageControl* pageControl;
	//定义滚动标志
    BOOL pageControlIsChangingPage;

	//定义图片文件名数组
	NSMutableArray *images;

}

/* UIPageControll的响应方法 */
- (void)changePage:(id)sender;

/* 内部方法，导入图片并进行UIScrollView的相关设置 */
- (void)setupPage;
@end