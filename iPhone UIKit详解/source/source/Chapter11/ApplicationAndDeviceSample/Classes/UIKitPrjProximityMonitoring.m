//
//  UIKitPrjProximityMonitoring.m
//
//  Created by wang on 2011-10-01.
//

#import "UIKitPrjProximityMonitoring.h"

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjProximityMonitoring ()
- (void)onDidPush;
- (void)offDidPush;
- (void)proximityStateDidChange;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjProximityMonitoring

- (void)dealloc {
  [label_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  label_ = [[UILabel alloc] init];
  label_.frame = self.view.bounds;
  label_.textAlignment = UITextAlignmentCenter;
  label_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label_.backgroundColor = [UIColor whiteColor];
  [self.view addSubview:label_];
}
//在画面显示后向NSNotificationCenter中注册检测到接近传感器变成ON／OFF时的处理方法
- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self onDidPush];
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(proximityStateDidChange)
                                               name:UIDeviceProximityStateDidChangeNotification
                                             object:nil];
}

#pragma mark ----- Private Methods -----

- (void)onDidPush {
  UIBarButtonItem* button =
    [[[UIBarButtonItem alloc] initWithTitle:@"接近OFF"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(offDidPush)] autorelease];
  self.navigationItem.rightBarButtonItem = button;
  // 接近传感器设置为ON
  [UIDevice currentDevice].proximityMonitoringEnabled = NO;
  label_.text = @"";
}

- (void)offDidPush {
  UIBarButtonItem* button =
    [[[UIBarButtonItem alloc] initWithTitle:@"接近ON"
                                      style:UIBarButtonItemStyleDone
                                     target:self
                                     action:@selector(onDidPush)] autorelease];
  self.navigationItem.rightBarButtonItem = button;
  // 接近传感器ON
  [UIDevice currentDevice].proximityMonitoringEnabled = YES;
}

- (void)proximityStateDidChange {
  if ( [UIDevice currentDevice].proximityState ) {
	//label_为预先在画面中追加的UILabel实例
    label_.text = @"已经变暗了ー";
  } 
}

@end
