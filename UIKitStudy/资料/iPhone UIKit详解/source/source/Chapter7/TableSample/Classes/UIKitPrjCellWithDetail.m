//
//  UIKitPrjCellWithDetail.m
//
//  Created by wang on 2011-10-18.
//

#import "UIKitPrjCellWithDetail.h"

@implementation UIKitPrjCellWithDetail

static NSString* kCellStyleDefault = @"style-default";
static NSString* kCellStyleValue1 = @"style-value1";
static NSString* kCellStyleValue2 = @"style-value2";
static NSString* kCellStyleSubtitle = @"style-subtitle";

- (void)dealloc {
  [details_ release];  
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // 详细信息文本
  details_ = [[NSArray alloc] initWithObjects:@"猿猴",
                                              @"猎狗",
                                              @"獅子",
                                              @"大象",
                                              nil];
  // 单元样式的默认设置
  cellStyle_ = UITableViewCellStyleSubtitle;
  // 导航条中追加按钮
  UIBarButtonItem* button =
    [[[UIBarButtonItem alloc] initWithTitle:@"CellStyle"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(buttonDidPush)] autorelease];
  self.navigationItem.rightBarButtonItem = button;
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  NSString* identifier;
  switch ( cellStyle_ ) {
    case UITableViewCellStyleValue1: identifier = kCellStyleValue1; break;
    case UITableViewCellStyleValue2: identifier = kCellStyleValue2; break;
    case UITableViewCellStyleSubtitle: identifier = kCellStyleSubtitle; break;
    default: identifier = kCellStyleDefault; break;
  }
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
  if ( nil == cell ) {
    cell = [[UITableViewCell alloc] initWithStyle:cellStyle_
                                  reuseIdentifier:identifier];
    [cell autorelease];
  }
  //dataSource_中保存有各单元显示用字符串
  cell.textLabel.text = [dataSource_ objectAtIndex:indexPath.row];
  //images_中保存了各单元中显示用图片
  cell.imageView.image = [images_ objectAtIndex:indexPath.row];
  //details_中保存了各单元详细信息用的字符串
  cell.detailTextLabel.text = [details_ objectAtIndex:indexPath.row];
  return cell;
}

- (void)buttonDidPush {
  if ( UITableViewCellStyleSubtitle < ++cellStyle_ ) {
    cellStyle_ = UITableViewCellStyleDefault;
  } 
  [self.tableView reloadData];
}

@end
