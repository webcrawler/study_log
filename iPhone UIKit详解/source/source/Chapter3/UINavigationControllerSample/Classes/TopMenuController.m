//
//  TopMenuController.m
//
//  Created by wang on 2011-08-16.
//

#import "TopMenuController.h"

@implementation TopMenuController

- (void)dealloc {
  [items_ release];
  [super dealloc];
}

- (id)init {
  if ( (self = [super initWithStyle:UITableViewStylePlain]) ) {
    self.title = @"主菜单";
    // 初始化显示用的数组
    items_ = [[NSMutableArray alloc] initWithObjects:
                  @"ViewController1",
                  @"ViewController2",
                  nil ];
  }
  return self;
}

#pragma mark ----- UITableViewDataSource Methods -----

- (NSInteger)tableView:(UITableView*)tableView
numberOfRowsInSection:(NSInteger)section {

  return [items_ count];
}

- (UITableViewCell*)tableView:(UITableView*)tableView
cellForRowAtIndexPath:(NSIndexPath*)indexPath {

  // 检测单元类型是否已经登记
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"simple-cell"];
  if ( !cell ) {
    // 如果该单元类型没有登记，则新创建
    cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"simple-cell"] autorelease];
  } 
  // 设置单元标签中显示的文字
  cell.textLabel.text = [items_ objectAtIndex:indexPath.row];
  return cell;
}

#pragma mark ----- UITableViewDelegate Methods -----

- (void)tableView:(UITableView*)tableView
didSelectRowAtIndexPath:(NSIndexPath*)indexPath {

  Class class = NSClassFromString( [items_ objectAtIndex:indexPath.row] );
  id viewController = [[[class alloc] init] autorelease];
  if ( viewController ) {
    [self.navigationController pushViewController:viewController animated:YES];
  } 
}

@end
