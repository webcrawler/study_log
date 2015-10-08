//
//  UIKitPrjSectionTable.m
//
//  Created by wang on 2011-10-18.
//

#import "UIKitPrjSectionTable.h"

@implementation UIKitPrjSectionTable

- (void)dealloc {
  [keys_ release];
  [dataSource_ release];
  [super dealloc];
}

- (id)init {
  if ( (self = [super init]) ) {
    self.title = @"SectionTable"; //追加标题   
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // 创建显示用数据
  //首先创建段名
  keys_ = [[NSArray alloc] initWithObjects:@"哺乳类", @"爬虫类", @"两析类", @"鱼类", nil];
  //创建各段数据
  NSArray* object1 = [NSArray arrayWithObjects:@"Monkey", @"Dog", @"Lion", @"Elephant", nil];
  NSArray* object2 = [NSArray arrayWithObjects:@"Snake", @"Gecko", nil];
  NSArray* object3 = [NSArray arrayWithObjects:@"Frog", @"Newts", nil];
  NSArray* object4 = [NSArray arrayWithObjects:@"Shark", @"Salmon", nil];
  NSArray* objects = [NSArray arrayWithObjects:object1, object2, object3, object4, nil];
  //以段名数组，段数据为参数创建数据资源用的字典实例
  dataSource_ = [[NSDictionary alloc] initWithObjects:objects forKeys:keys_];
}
//返回各段的项目数
- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
  id key = [keys_ objectAtIndex:section];
  return [[dataSource_ objectForKey:key] count];
}
//创建indexPath中指定单元实例
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
  //首先取得单元格的段名
  id key = [keys_ objectAtIndex:indexPath.section];
  //返回对应段及对应位置的数据，并设置到单元中
  NSString* text = [[dataSource_ objectForKey:key] objectAtIndex:indexPath.row];
  cell.textLabel.text = text;
  return cell;
}
//返回段的数目
- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
  return [keys_ count];
}
//返回对应段的段名
- (NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section {
  return [keys_ objectAtIndex:section];
}

//- (NSString*)tableView:(UITableView*)tableView titleForFooterInSection:(NSInteger)section {
//  return [keys_ objectAtIndex:section];
//}

- (NSArray*)sectionIndexTitlesForTableView:(UITableView*)tableView {
  return keys_;
}

@end
