//
//  UIKitPrjScroll.m
//
//  Created by wang on 2011-10-18.
//

#import "UIKitPrjScroll.h"

@implementation UIKitPrjScroll

- (void)viewDidLoad {
  [super viewDidLoad];
  UIBarButtonItem* topButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"top"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(topDidPush)] autorelease];
  UIBarButtonItem* currentButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"current"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(currentDidPush)] autorelease];
  UIBarButtonItem* bottomButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"bottom"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(bottomDidPush)] autorelease];
  NSArray* buttons = [NSArray arrayWithObjects:topButton, currentButton, bottomButton, nil];
  [self setToolbarItems:buttons animated:YES];
}

- (void)topDidPush {
  //滚动到第1个单元格
  NSIndexPath* indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
  [self.tableView scrollToRowAtIndexPath:indexPath
                        atScrollPosition:UITableViewScrollPositionNone
                                animated:YES];
  //[self.tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop
  //													animated:YES];
}

- (void)currentDidPush {
  [self.tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionNone
                                                    animated:YES];
}

- (void)bottomDidPush {
  //滚动到最后一个单元格
  NSIndexPath* indexPath = [NSIndexPath indexPathForRow:dataSource_.count-1 inSection:0];
  [self.tableView scrollToRowAtIndexPath:indexPath
                        atScrollPosition:UITableViewScrollPositionNone
                                animated:YES];
  //[self.tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionBottom
  //													  animated:YES];
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
}

@end
