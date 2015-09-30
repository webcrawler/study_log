//
//  UIKitPrjEditingAccessoryType.m
//
//  Created by wang on 2011-10-18.
//

#import "UIKitPrjEditingAccessoryType.h"

@implementation UIKitPrjEditingAccessoryType

- (void)viewDidLoad {
  [super viewDidLoad];
  // 设置详细信息的文本
  details_ = [[NSArray alloc] initWithObjects:@"13",
                                              @"1",
                                              @"0",
                                              @"255",
                                              nil];
  // 单元样式的默认设置
  cellStyle_ = UITableViewCellStyleValue1;
  // 在导航条中追加编辑按钮
  self.navigationItem.rightBarButtonItem = [self editButtonItem];

  self.tableView.allowsSelection = NO;
  self.tableView.allowsSelectionDuringEditing = YES;
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  UITableViewCell* cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
  cell.editingAccessoryType = UITableViewCellAccessoryDetailDisclosureButton;
  return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView*)tableView
  editingStyleForRowAtIndexPath:(NSIndexPath*)indexPath
{
  return UITableViewCellEditingStyleNone;
}

- (BOOL)tableView:(UITableView*)tableView
  shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath*)indexPath
{
  return NO;
}

- (void)tableView:(UITableView*)tableView
  accessoryButtonTappedForRowWithIndexPath:(NSIndexPath*)indexPath
{
//  UIViewController* viewController = [[DetailViewController alloc] init];
//  [self.navigationController pushViewController:viewController animated:YES];
//  [viewController release];
}

@end
