//
//  UIKitPrjBlackCellTable.m
//
//  Created by wang on 2011-10-18.
//

#import "UIKitPrjBlackCellTable.h"

@implementation UIKitPrjBlackCellTable

- (void)viewDidLoad {
  [super viewDidLoad];
  self.tableView.backgroundColor = [UIColor blackColor]; //< 背景颜色
  self.tableView.rowHeight = 128.0; //< 单元的尺寸
  self.tableView.separatorColor = [UIColor redColor]; //< 红色分隔线
  //self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  static NSString* identifier = @"basis-cell";
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
  if ( nil == cell ) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:identifier];
    [cell autorelease];
    cell.textLabel.textColor = [UIColor whiteColor]; //< 文本颜色变成白色
    cell.textLabel.textAlignment = UITextAlignmentCenter; //< 中间对齐
    cell.textLabel.font = [UIFont systemFontOfSize:64]; //< 字体为64
  }
  NSString* text = [dataSource_ objectAtIndex:indexPath.row];
  cell.textLabel.text = text;
  return cell;
}

@end
