//
//  UIKitPrjLocalizedIndexedCollation.m
//
//  Created by wang on 2011-10-18.
//

#import "UIKitPrjLocalizedIndexedCollation.h"

#pragma mark ----- Character -----

@implementation Character

@synthesize name = name_;
@synthesize job = job_;

@end

@implementation UIKitPrjLocalizedIndexedCollation

@synthesize dataSource = dataSource_;

- (void)viewDidLoad {
  [super viewDidLoad];

  NSMutableArray* dataSourceTemp = [NSMutableArray arrayWithCapacity:22];
  for ( int i = 0; i < 20; ++i ){
    Character* dummy = [[Character alloc] init];
    dummy.name = ( i % 2 ) ? @"Dummy" : @"测试";
    dummy.job = @"自由职业";
    [dataSourceTemp addObject:dummy];
    [dummy release];
  }
  Character* character1 = [[Character alloc] init];
  character1.name = @"王五";
  character1.job = @"教师";
  [dataSourceTemp addObject:character1];
  [character1 release];
  Character* character2 = [[Character alloc] init];
  character2.name = @"李六";
  character2.job = @"导游";
  [dataSourceTemp addObject:character2];
  [character2 release];

  UILocalizedIndexedCollation* theCollation = [UILocalizedIndexedCollation currentCollation];
  // 创建与Section数目相同的空数组，类型为NSMutableArray
  NSInteger sectionCount = [[theCollation sectionTitles] count];
  NSMutableArray* sectionArrays = [NSMutableArray arrayWithCapacity:sectionCount];
  for ( int i = 0; i <= sectionCount; ++i ) {
    [sectionArrays addObject:[NSMutableArray arrayWithCapacity:1]];
  }
  // 将数据放入上面创建的数组中
  for ( Character* character in dataSourceTemp ) {
    NSInteger sect = [theCollation sectionForObject:character
                            collationStringSelector:@selector(name)];
    [[sectionArrays objectAtIndex:sect] addObject:character];
  }
  // 将Section中数据追加到表格用数组中
  self.dataSource = [NSMutableArray arrayWithCapacity:sectionCount];
  for ( NSMutableArray* sectionArray in sectionArrays ) {
    NSArray* sortedSection = [theCollation sortedArrayFromArray:sectionArray
                                        collationStringSelector:@selector(name)];
    [self.dataSource addObject:sortedSection];
  }
}

- (NSArray*)sectionIndexTitlesForTableView:(UITableView*)tableView {
  return [[UILocalizedIndexedCollation currentCollation] sectionIndexTitles];
}

- (NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section {
  if ( [[self.dataSource objectAtIndex:section] count] < 1 ) {
    return nil;
  }
  return [[[UILocalizedIndexedCollation currentCollation] sectionTitles] objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView*)tableView
  sectionForSectionIndexTitle:(NSString*)title atIndex:(NSInteger)index
{
  return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
  return [self.dataSource count];
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
  return [[self.dataSource objectAtIndex:section] count];
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
  Character* character =
    [[self.dataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
  cell.textLabel.text = character.name;
  return cell;
}

@end
