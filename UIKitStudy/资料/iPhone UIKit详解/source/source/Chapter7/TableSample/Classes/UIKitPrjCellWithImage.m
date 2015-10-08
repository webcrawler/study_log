//
//  UIKitPrjCellWithImage.m
//
//  Created by wang on 2011-10-18.
//

#import "UIKitPrjCellWithImage.h"

@implementation UIKitPrjCellWithImage

- (void)dealloc {
  [images_ release];  
  [dataSource_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  dataSource_ = [[NSArray alloc] initWithObjects:@"Monkey", @"Dog", @"Lion", @"Elephant", nil];
  images_ = [[NSMutableArray alloc] initWithCapacity:8];
  //将与数据项同名的png图片导入并保存在数组中
  for ( NSString* name in dataSource_ ) {
    NSString* imageName = [NSString stringWithFormat:@"%@.png", name];
    UIImage* image = [UIImage imageNamed:imageName];
    [images_ addObject:image];
  }
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
  //在单元的imageView属性中设置图片
  cell.imageView.image = [images_ objectAtIndex:indexPath.row];
  return cell;
}

@end
