//
//  UIKitPrjSearchBar.m
//
//  Created by wang on 2011-10-06.
//

#import "UIKitPrjSearchBar.h"

@implementation UIKitPrjSearchBar

- (void)dealloc {
  [searchBar_ release];
  [dataSource_ release];
  [dataBase_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  searchBar_ = [[UISearchBar alloc] init];
  searchBar_.frame = CGRectMake( 0, 0, self.tableView.bounds.size.width, 0 );
  searchBar_.delegate = self;
  [searchBar_ sizeToFit];
  self.tableView.tableHeaderView = searchBar_;

  dataBase_ = [[NSMutableArray alloc] initWithCapacity:64];
  dataSource_ = [[NSMutableArray alloc] initWithCapacity:64];
  for ( int i = 0; i < 64; ++i ){
    [dataBase_ addObject:[NSString stringWithFormat:@"%d", i]];
    [dataSource_ addObject:[NSString stringWithFormat:@"%d", i]];
  }
}
//此处datasource_为NSArray类型的实例变量
//dataBase_为保持全部数据的NSArray类型变量
- (void)searchBarSearchButtonClicked:(UISearchBar*)searchBar {
  //首先删除数据资源中的内容
  [dataSource_ removeAllObjects];
  for ( NSString* data in dataBase_ ) {
    if ( [data hasPrefix:searchBar.text] ) {
	  //将满足检索条件的数据追加到数据资源变量中
      [dataSource_ addObject:data];
    } 
  }
  //表格更新
  [self.tableView reloadData];
  //隐藏键盘
  [searchBar resignFirstResponder];
}

#pragma mark UITableView methods

- (NSInteger)tableView:(UITableView*)tableView
  numberOfRowsInSection:(NSInteger)section
{
  return [dataSource_ count];
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
  
  cell.textLabel.text = [dataSource_ objectAtIndex:indexPath.row];

  return cell;
}

@end
