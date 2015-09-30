//
//  UIKitPrjModal.m
//
//  Created by Wang on 2011-08-16.
//

#import "UIKitPrjModal.h"

@implementation UIKitPrjModal

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor whiteColor];

  // 追加调用模态画面的按钮
  UIButton* modalButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [modalButton setTitle:@"调出模态对话框" forState:UIControlStateNormal];
  [modalButton sizeToFit];
  modalButton.center = self.view.center;
  [modalButton addTarget:self
                  action:@selector(modalDidPush)
        forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:modalButton];
}

- (void)modalDidPush {
  // 显示模态对话框
  ModalDialog* dialog = [[[ModalDialog alloc] init] autorelease];
  dialog.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
  [self presentModalViewController:dialog animated:YES];
}

@end

@implementation ModalDialog

- (void)viewDidLoad {
  [super viewDidLoad];

  // 追加1个标签
  UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
  label.backgroundColor = [UIColor blackColor];
  label.textColor = [UIColor whiteColor];
  label.textAlignment = UITextAlignmentCenter;
  label.text = @"您好。我是模态画面。";
  [self.view addSubview:label];

  // 追究关闭按钮
  UIButton* goodbyeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [goodbyeButton setTitle:@"Good-bye" forState:UIControlStateNormal];
  [goodbyeButton sizeToFit];
  CGPoint newPoint = self.view.center;
  newPoint.y += 80;
  goodbyeButton.center = newPoint;
  [goodbyeButton addTarget:self
                    action:@selector(goodbyeDidPush)
          forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:goodbyeButton];
}

- (void)goodbyeDidPush {
  // 关闭模态对话框
  [self dismissModalViewControllerAnimated:YES];
}

@end
