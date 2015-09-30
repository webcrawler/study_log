//
//  UIKitPrjCellWithAccessory.m
//
//  Created by wang on 2011-10-18.
//

#import "UIKitPrjCellWithAccessory.h"

@implementation UIKitPrjCellWithAccessory

- (void)viewDidLoad {
  [super viewDidLoad];
  // 向导航条中追加按钮
  UIBarButtonItem* button =
    [[[UIBarButtonItem alloc] initWithTitle:@"AccesoryType"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(buttonDidPush)] autorelease];
  self.navigationItem.rightBarButtonItem = button;
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  //如果父类中没有追加创建UITableViewCell实例代码时，需要在此追加相关代码
  //父类中已经追加了相关代码，因此此处将省略
  UITableViewCell* cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
  cell.accessoryType = accessoryType_;
  return cell;
}

- (void)buttonDidPush {
  if ( UITableViewCellAccessoryCheckmark < ++accessoryType_ ) {
    accessoryType_ = UITableViewCellAccessoryNone;
  } 
  [self.tableView reloadData];
}

- (void)tableView:(UITableView*)tableView
  accessoryButtonTappedForRowWithIndexPath:(NSIndexPath*)indexPath
{
  //UIKitPrjCellWithDetail是另外创建的详细画面
  UIViewController* viewController = [[UIKitPrjCellWithDetail alloc] init];
  [self.navigationController pushViewController:viewController animated:YES];
  [viewController release];
}

@end
