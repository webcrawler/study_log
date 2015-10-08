//
//  UIKitPrjToolbarWithSpace.m
//
//  Created by Wang on 2011-08-16.
//

#import "UIKitPrjToolbarWithSpace.h"

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjToolbarWithSpace ()
- (UIBarButtonItem*)barButtonSystemItem:(UIBarButtonSystemItem)systemItem;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjToolbarWithSpace

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"工具条位置调整";

  // 追加标签
  UILabel* label = [[[UILabel alloc] init] autorelease];
  label.frame = self.view.bounds;
  label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label.numberOfLines = 3;
  label.textAlignment = UITextAlignmentCenter;
  label.text = @"触摸画面后、切换工具条。";
  [self.view addSubview:label];

  mode_ = 0;
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setToolbarHidden:NO animated:NO];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  if ( ++mode_ > 6 ) {
    mode_ = 0;
  } 
  switch ( mode_ ) {
    case 1:
      [self setToolbarItems:[NSArray arrayWithObjects:
              [self barButtonSystemItem:UIBarButtonSystemItemAction],
              [self barButtonSystemItem:UIBarButtonSystemItemCompose],
              [self barButtonSystemItem:UIBarButtonSystemItemBookmarks],
              [self barButtonSystemItem:UIBarButtonSystemItemReply],
              nil]];
      break;
    case 2:
      [self setToolbarItems:[NSArray arrayWithObjects:
              [self barButtonSystemItem:UIBarButtonSystemItemFlexibleSpace],
              [self barButtonSystemItem:UIBarButtonSystemItemAction],
              [self barButtonSystemItem:UIBarButtonSystemItemBookmarks],
              [self barButtonSystemItem:UIBarButtonSystemItemReply],
              [self barButtonSystemItem:UIBarButtonSystemItemCompose],
              nil]];
      break;
    case 3:
      [self setToolbarItems:[NSArray arrayWithObjects:
              [self barButtonSystemItem:UIBarButtonSystemItemFlexibleSpace],
              [self barButtonSystemItem:UIBarButtonSystemItemAction],
              [self barButtonSystemItem:UIBarButtonSystemItemBookmarks],
              [self barButtonSystemItem:UIBarButtonSystemItemReply],
              [self barButtonSystemItem:UIBarButtonSystemItemCompose],
              [self barButtonSystemItem:UIBarButtonSystemItemFlexibleSpace],
              nil]];
      break;
    case 4:
      [self setToolbarItems:[NSArray arrayWithObjects:
              [self barButtonSystemItem:UIBarButtonSystemItemAction],
              [self barButtonSystemItem:UIBarButtonSystemItemFlexibleSpace],
              [self barButtonSystemItem:UIBarButtonSystemItemBookmarks],
              [self barButtonSystemItem:UIBarButtonSystemItemFlexibleSpace],
              [self barButtonSystemItem:UIBarButtonSystemItemReply],
              [self barButtonSystemItem:UIBarButtonSystemItemFlexibleSpace],
              [self barButtonSystemItem:UIBarButtonSystemItemCompose],
              nil]];
      break;
    case 5:
      {
        UIBarButtonItem* fixedSpace = [self barButtonSystemItem:UIBarButtonSystemItemFixedSpace];
        fixedSpace.width = 35;
        [self setToolbarItems:[NSArray arrayWithObjects:
                [self barButtonSystemItem:UIBarButtonSystemItemAction],
                [self barButtonSystemItem:UIBarButtonSystemItemFlexibleSpace],
                [self barButtonSystemItem:UIBarButtonSystemItemBookmarks],
                [self barButtonSystemItem:UIBarButtonSystemItemFlexibleSpace],
                fixedSpace,
                [self barButtonSystemItem:UIBarButtonSystemItemFlexibleSpace],
                [self barButtonSystemItem:UIBarButtonSystemItemCompose],
                nil]];
      }
      break;
    default:
      [self setToolbarItems:[NSArray array] animated:YES];
      break;
  }
}

#pragma mark ----- Private Methods -----

- (UIBarButtonItem*)barButtonSystemItem:(UIBarButtonSystemItem)systemItem {
  UIBarButtonItem* button =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemItem
                                                   target:nil
                                                   action:nil] autorelease];
  return button;
}

@end
