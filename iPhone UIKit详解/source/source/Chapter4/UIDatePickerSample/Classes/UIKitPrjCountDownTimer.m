//
//  UIKitPrjCountDownTimer.m
//
//  Created by wang on 2011-10-03.
//

#import "UIKitPrjCountDownTimer.h"

@implementation UIKitPrjCountDownTimer

- (void)dealloc {
  [timer_ release];
  [datePicker_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // 倒计时牌的创建与初始化
  datePicker_ = [[UIDatePicker alloc] init];
  datePicker_.datePickerMode = UIDatePickerModeCountDownTimer;
  // 初始显示为5 min 
  datePicker_.countDownDuration = 60*5;
  [self.view addSubview:datePicker_];
  // 创建每隔1秒重复调用的Timer
  timer_ = [[NSTimer timerWithTimeInterval:60.0
                                   target:self
                                 selector:@selector(timerFireMethod:)
                                 userInfo:nil
                                  repeats:YES] retain];
  // Timer运行开始
  NSRunLoop* runLoop = [NSRunLoop currentRunLoop];
  [runLoop addTimer:timer_ forMode:NSDefaultRunLoopMode];
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  // 画面隐藏时停止Timer
  if ( [timer_ isValid] ) {
    [timer_ invalidate];
  } 
}

- (void)timerFireMethod:(NSTimer*)theTimer {
  // Timer会在每隔１秒时调用此方法
  // 至计数为0.0为止，每间隔１分钟进行减算
  NSTimeInterval now = datePicker_.countDownDuration;
  if ( 0.0 < now ) {
    datePicker_.countDownDuration = now - 60.0;
  } 
}

@end
