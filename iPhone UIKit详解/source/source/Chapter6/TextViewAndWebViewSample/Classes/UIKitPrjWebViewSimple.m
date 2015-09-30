//
//  UIKitPrjWebViewSimple.m
//
//  Created by wang on 2011-09-21.
//

#import "UIKitPrjWebViewSimple.h"

@implementation UIKitPrjWebViewSimple

- (void)dealloc {
  [activityIndicator_ release]; 
  if ( webView_.loading ) [webView_ stopLoading];
  webView_.delegate = nil; //< Apple文档中推荐，release前需要如此编写
  [webView_ release]; 
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"明确显示通信状态";
  // UIWebView的设置
  webView_ = [[UIWebView alloc] init];
  webView_.delegate = self;
  webView_.frame = self.view.bounds;
  webView_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  webView_.scalesPageToFit = YES;
  [self.view addSubview:webView_];
  // 在工具条中追加活动指示器
  activityIndicator_ = [[UIActivityIndicatorView alloc] init];
  activityIndicator_.frame = CGRectMake( 0, 0, 20, 20 );
  UIBarButtonItem* indicator =
    [[[UIBarButtonItem alloc] initWithCustomView:activityIndicator_] autorelease];
  UIBarButtonItem* adjustment =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                    target:nil
                                                    action:nil] autorelease];
  NSArray* buttons = [NSArray arrayWithObjects:adjustment, indicator, adjustment, nil];
  [self setToolbarItems:buttons animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
	
	/*NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
	
    NSArray *paths = NSSearchPathForDirectoriesInDomains(
														 NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    NSString *direcPath = [documentsDir stringByAppendingPathComponent:@"index.html"];
	

			
			
			
	
	
	//NSString *path = [[NSBundle mainBundle] bundlePath];
	NSString *imagePath = [[NSBundle mainBundle] resourcePath];
	imagePath = [imagePath stringByReplacingOccurrencesOfString:@"/" withString:@"//"];
	imagePath = [imagePath stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
	NSURL *baseURL = [NSURL URLWithString: [NSString stringWithFormat:@"file:/%@//",imagePath]];
	/*NSString *indexPath = [[[NSBundle mainBundle] resourcePath]
						   stringByAppendingPathComponent:@"index.html"];
	NSLog(indexPath);
	[webView_ loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:indexPath]]];
	NSString *templatePath = [[[NSBundle mainBundle] resourcePath]
								stringByAppendingPathComponent:@"index.html"];
	BOOL success = [fileManager fileExistsAtPath:direcPath];
	if(!success) {
				// 拷贝创建数据库文件
		success = [fileManager copyItemAtPath:templatePath
											   toPath:direcPath error:&error];
	}
	if (!success) {
		NSAssert1(0, @"Failed to create database :%@.",
				  [error localizedDescription]);
		NSLog(@"Failed to create database");
		return;
	}
	NSData *htmlStringData = [NSData dataWithContentsOfFile:direcPath];
	[webView_ loadHTMLString:[[NSString alloc] initWithData:htmlStringData encoding:NSUTF8StringEncoding] baseURL:baseURL];*/
  //Web页面显示
	NSURLRequest* request =
    [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.apple.com"]];
  [webView_ loadRequest:request];
   
	
}

- (void)webViewDidStartLoad:(UIWebView*)webView {
  [activityIndicator_ startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView*)webView {
  [activityIndicator_ stopAnimating];
}

- (void)webView:(UIWebView*)webView didFailLoadWithError:(NSError*)error {
  [activityIndicator_ stopAnimating];
}

@end
