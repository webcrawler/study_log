//
//  UIKitPrjCellWithBackgroundView.m
//
//  Created by wang on 2011-10-18.
//

#import "UIKitPrjCellWithBackgroundView.h"

@implementation UIKitPrjCellWithBackgroundView

- (void)dealloc {
  [dataSource_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  //将背景设置为透明
  self.tableView.backgroundColor = [UIColor clearColor];
  //隐藏单元分隔线
  self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  dataSource_ = [[NSArray alloc] initWithObjects:@"ITEM 1", @"ITEM 2", @"ITEM 3", nil];
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
    UIImage* image = [UIImage imageNamed:@"frame.png"];
    UIImage* stretchableImage = [image stretchableImageWithLeftCapWidth:30 topCapHeight:30];
    UIImageView* imageView = [[[UIImageView alloc] initWithImage:stretchableImage] autorelease];
    cell.backgroundView = imageView;
    [cell autorelease];
  }
  cell.textLabel.text = [dataSource_ objectAtIndex:indexPath.row];
  return cell;
}

@end
