//
//  UIKitPrjWebView.m
//
//  Created by wang on 2011-09-21.
//

#import "UIKitPrjWebView.h"

@implementation UIKitPrjWebView

- (void)dealloc {
  if ( webView_.loading ) [webView_ stopLoading];
  webView_.delegate = nil;
  [webView_ release]; 
  [reloadButton_ release]; 
  [stopButton_ release]; 
  [backButton_ release]; 
  [forwardButton_ release]; 
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"UIWebView测试";
  // UIWebView的设置
  webView_ = [[UIWebView alloc] init];
  webView_.delegate = self;
  webView_.frame = self.view.bounds;
  webView_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  webView_.scalesPageToFit = YES;
  [self.view addSubview:webView_];
  // 工具条中追加按钮
  reloadButton_ =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                  target:self
                                                  action:@selector(reloadDidPush)];
  stopButton_ =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop
                                                  target:self
                                                  action:@selector(stopDidPush)];
  backButton_ =
    [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                     style:UIBarButtonItemStyleBordered
                                    target:self
                                    action:@selector(backDidPush)];
  forwardButton_ =
    [[UIBarButtonItem alloc] initWithTitle:@"Forward"
                                     style:UIBarButtonItemStyleBordered
                                    target:self
                                    action:@selector(forwardDidPush)];
  NSArray* buttons =
    [NSArray arrayWithObjects:backButton_, forwardButton_, reloadButton_, stopButton_, nil];
  [self setToolbarItems:buttons animated:YES];

}

- (void)reloadDidPush {
  [webView_ reload]; //< 重新读入页面
}

- (void)stopDidPush {
  if ( webView_.loading ) {
    [webView_ stopLoading]; //< 读入停止
  } 
}

- (void)backDidPush {
  if ( webView_.canGoBack ) {
    [webView_ goBack]; //< 返回前一画面
  } 
}

- (void)forwardDidPush {
  if ( webView_.canGoForward ) {
    [webView_ goForward]; //< 进入下一画面
  } 
}

- (void)updateControlEnabled {
  // 统一更新活动指示已经按钮状态
  [UIApplication sharedApplication].networkActivityIndicatorVisible = webView_.loading;
  stopButton_.enabled = webView_.loading;
  backButton_.enabled = webView_.canGoBack;
  forwardButton_.enabled = webView_.canGoForward;
}

- (void)viewDidAppear:(BOOL)animated {
  // 画面显示结束后读入Web页面画面
  [super viewDidAppear:animated];
  NSURLRequest* request =
    [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.apple.com/"]];
  [webView_ loadRequest:request];
  [self updateControlEnabled];
}

- (void)viewWillDisappear:(BOOL)animated {
  // 画面关闭时状态条的活动指示器设置成OFF
  [super viewWillDisappear:animated];
  [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)webViewDidStartLoad:(UIWebView*)webView {
  [self updateControlEnabled];
}

- (void)webViewDidFinishLoad:(UIWebView*)webView {
  [self updateControlEnabled];
}

- (void)webView:(UIWebView*)webView didFailLoadWithError:(NSError*)error {
  [self updateControlEnabled];
}

@end
