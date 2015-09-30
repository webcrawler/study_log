//
//  UIKitPrjDeleteableRow.m
//
//  Created by wang on 2011-10-18.
//

#import "UIKitPrjDeleteableRow.h"

@implementation UIKitPrjDeleteableRow

- (void)dealloc {
  [dataSource_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  dataSource_ = [[NSMutableArray alloc] initWithObjects:
                              @"ITEM 1", @"ITEM 2", @"ITEM 3",
                              @"ITEM 4", @"ITEM 5", @"ITEM 6",
                              @"ITEM 7", @"ITEM 8", @"ITEM 9",
                              @"ITEM 10", @"ITEM 11", @"ITEM 12",
                              nil ];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self.tableView setEditing:YES animated:YES];
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
  return [dataSource_ count];
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
  }
  cell.textLabel.text = [dataSource_ objectAtIndex:indexPath.row];
  return cell;
}

// 单元的追加/删除
- (void)tableView:(UITableView*)tableView
  commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
   forRowAtIndexPath:(NSIndexPath*)indexPath
{
  if ( UITableViewCellEditingStyleDelete == editingStyle ) {
    // 从datasource删除实际数据
    [dataSource_ removeObjectAtIndex:indexPath.row];
    // 删除表格中的单元
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                     withRowAnimation:UITableViewRowAnimationLeft];
  } 
}

//- (NSString *)tableView:(UITableView *)tableView 
//titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//  return @"垃圾站";
//}

@end
