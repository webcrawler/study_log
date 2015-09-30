//
//  UIKitPrjToolbarSystemItem.m
//
//  Created by Wang on 2011-08-16.
//

#import "UIKitPrjToolbarSystemItem.h"

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjToolbarSystemItem ()
- (UIBarButtonItem*)barButtonSystemItem:(UIBarButtonSystemItem)systemItem;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjToolbarSystemItem

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"UIBarButtonSystemItem列表";

  [self setToolbarItems:[NSArray arrayWithObjects:
          [self barButtonSystemItem:UIBarButtonSystemItemDone],
          [self barButtonSystemItem:UIBarButtonSystemItemCancel],
          [self barButtonSystemItem:UIBarButtonSystemItemEdit],
          [self barButtonSystemItem:UIBarButtonSystemItemSave],
          [self barButtonSystemItem:UIBarButtonSystemItemAdd],
          [self barButtonSystemItem:UIBarButtonSystemItemCompose],
          [self barButtonSystemItem:UIBarButtonSystemItemReply],
          [self barButtonSystemItem:UIBarButtonSystemItemAction],
          [self barButtonSystemItem:UIBarButtonSystemItemOrganize],
          [self barButtonSystemItem:UIBarButtonSystemItemBookmarks],
          [self barButtonSystemItem:UIBarButtonSystemItemSearch],
          [self barButtonSystemItem:UIBarButtonSystemItemRefresh],
          [self barButtonSystemItem:UIBarButtonSystemItemStop],
          [self barButtonSystemItem:UIBarButtonSystemItemCamera],
          [self barButtonSystemItem:UIBarButtonSystemItemTrash],
          [self barButtonSystemItem:UIBarButtonSystemItemPlay],
          [self barButtonSystemItem:UIBarButtonSystemItemPause],
          [self barButtonSystemItem:UIBarButtonSystemItemRewind],
          [self barButtonSystemItem:UIBarButtonSystemItemFastForward],
          [self barButtonSystemItem:UIBarButtonSystemItemUndo],
          [self barButtonSystemItem:UIBarButtonSystemItemRedo],
          nil]];

  // 追加标签
  UILabel* label = [[[UILabel alloc] init] autorelease];
  label.frame = self.view.bounds;
  label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label.numberOfLines = 3;
  label.textAlignment = UITextAlignmentCenter;
  label.text = @"点击画面后、工具条的按钮将移向左侧。";
  [self.view addSubview:label];
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
  // 准备移动后容纳工具条按钮的数组
  NSMutableArray* newItems =
    [[[NSMutableArray alloc] initWithCapacity:self.toolbarItems.count] autorelease];
  // 首先抽取左手第2个以后（包括第2）的按钮并追加
  NSRange range = NSMakeRange( 1, self.toolbarItems.count - 1 );
  [newItems addObjectsFromArray:[self.toolbarItems subarrayWithRange:range]];
  // 接着将左侧按钮追加到最后
  [newItems addObject:[self.toolbarItems objectAtIndex:0]];
  // 将移动后的工具条按钮集合设置到工具条中
  [self setToolbarItems:newItems animated:YES];
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
