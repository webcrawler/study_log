//
//  UIKitPrjSearchDisplay.m
//
//  Created by wang on 2011-08-15.
//

#import "UIKitPrjSearchDisplay.h"

#pragma mark ----- Item -----

@implementation Item

@synthesize weapon = weapon_;
@synthesize armor = armor_;
@synthesize name = name_;

+ (id)weaponWithName:(NSString*)name {
  Item* item = [[[Item alloc] init] autorelease];
  item.name = name;
  item.weapon = YES;
  return item;
}

+ (id)armorWithName:(NSString*)name {
  Item* item = [[[Item alloc] init] autorelease];
  item.name = name;
  item.armor = YES;
  return item;
}

- (NSComparisonResult)compare:(Item*)aItem {
  if ( aItem == self ) {
    return NSOrderedSame;
  } 
  return [self.name compare:[aItem name]];
}

@end

#pragma mark ----- UIKitPrjSearchDisplay -----

@implementation UIKitPrjSearchDisplay

- (void)dealloc {
  [dataSource_ release];
  [searchResult_ release];
  [searchDisplay_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"装备检索";

  UISearchBar* searchBar = [[[UISearchBar alloc] init] autorelease];
  searchBar.frame = CGRectMake( 0, 0, self.tableView.bounds.size.width, 0 );
  [searchBar sizeToFit];
  searchBar.scopeButtonTitles = [NSArray arrayWithObjects:@"全部", @"武器", @"防护器具", nil];
  searchBar.showsScopeBar = YES;
  self.tableView.tableHeaderView = searchBar;
  //searchDisplay_是保存UISearchDisplayController的实例变量
  searchDisplay_ =
    [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
  searchDisplay_.delegate = self;
  searchDisplay_.searchResultsDataSource = self;
  searchDisplay_.searchResultsDelegate = self;

  NSArray* weapons = [NSArray arrayWithObjects:
                       @"陶瓷剑",
                       @"陶瓷菜刀",
                       @"陶瓷斧头",
                       @"圣尺",
                       nil];
  NSArray* armors = [NSArray arrayWithObjects:
                       @"陶瓷铠甲",
                       @"陶瓷盾牌",
                       @"陶瓷头盔",
                       @"魔法衣",
                       @"单衣",
                       nil];
  dataSource_ = [[NSMutableArray alloc] initWithCapacity:16];
  for ( id name in weapons ) {
    [dataSource_ addObject:[Item weaponWithName:name]];
  }
  for ( id name in armors ) {
    [dataSource_ addObject:[Item armorWithName:name]];
  }
  [dataSource_ sortUsingSelector:@selector(compare:)];

  searchResult_ = [[NSMutableArray alloc] initWithCapacity:dataSource_.count];
}

- (BOOL)searchDisplayController:(UISearchDisplayController*)controller
  shouldReloadTableForSearchString:(NSString*)searchString
{
  // 先删除所有数据
  [searchResult_ removeAllObjects];
  // 追加包含检索关键字的数据
  for ( Item* item in dataSource_ ) {
    if ( NSNotFound != [item.name rangeOfString:searchString].location ) {
      [searchResult_ addObject:item];
    } 
  }
  return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController*)controller
  shouldReloadTableForSearchScope:(NSInteger)searchOption
{
  // 先删除所有数据
  [searchResult_ removeAllObjects];
  // 追加包含检索关键字、且范围一致的数据
  NSString* searchString = controller.searchBar.text;
  for ( Item* item in dataSource_ ) {
	//此逻辑仅实用于dataSource为字符串的情况
	//根据dataSource的不同请替换为合适的判断逻辑
    if ( NSNotFound != [item.name rangeOfString:searchString].location ) {
      if ( 0 == searchOption ) {
		//范围为［全部］的情况下，追加包含检索字符串所有的元素
        [searchResult_ addObject:item];
      } else if ( 1 == searchOption ) {
		//范围为［武器］时
        if ( [item isWeapon] ) {
          [searchResult_ addObject:item];
        } 
      } else {
		//范围为［防护用具］时
        if ( [item isArmor] ) {
          [searchResult_ addObject:item];
        } 
      }
    }
  }
  return YES;
}

#pragma mark UITableView methods
//dataSource_是保存全部数据的实例变量
//searchResult_是保存检索结果的实例变量
- (NSInteger)tableView:(UITableView*)tableView
  numberOfRowsInSection:(NSInteger)section
{
  //tableView与UISearchDisplayController的searchResultsTableView一样时显示检索结果
  //否则显示全部数据
  if ( tableView == self.searchDisplayController.searchResultsTableView ) {
    return [searchResult_ count];
  } else {
    return [dataSource_ count];
  }
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
  //tableView与UISearchDisplayController的searchResultsTableView一样时显示检索结果中的数据
  //否则显示全部数据
  if ( tableView == self.searchDisplayController.searchResultsTableView ) {
    cell.textLabel.text = [[searchResult_ objectAtIndex:indexPath.row] name];
  } else {
    cell.textLabel.text = [[dataSource_ objectAtIndex:indexPath.row] name];
  }
  return cell;
}

@end
