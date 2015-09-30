//
//  UIKitPrjEditingButton.m
//
//  Created by wang on 2011-10-18.
//

#import "UIKitPrjEditingButton.h"

@implementation UIKitPrjEditingButton

- (void)viewDidLoad {
  [super viewDidLoad];
  dataSource_ = [[NSMutableArray alloc] initWithObjects:
                              @"ITEM 1", @"ITEM 2", @"ITEM 3",
                              nil ];
  self.navigationItem.rightBarButtonItem = [self editButtonItem];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  self.tableView.editing = NO;
}

- (void)tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath*)indexPath {
}

- (void)tableView:(UITableView*)tableView didEndEditingRowAtIndexPath:(NSIndexPath*)indexPath {
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
  if ( editing ) {
    // 编辑模式时追加「追加新单元」单元
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:dataSource_.count inSection:0];
    [dataSource_ addObject:@"追加新单元"];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                          withRowAnimation:UITableViewRowAnimationTop];
  } else {
    // 结束编辑模式时，删除「追加新单元」单元
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:dataSource_.count-1 inSection:0];
    [dataSource_ removeLastObject];
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                          withRowAnimation:UITableViewRowAnimationTop];
  }
  [super setEditing:editing animated:YES];
}

@end
