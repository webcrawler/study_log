//
//  UIKitPrjCustomizedCell.m
//
//  Created by wang on 2011-10-18.
//

#import "UIKitPrjCustomizedCell.h"

#pragma mark ----- Private Methods Definition -----
//定义私有方法
@interface UIKitPrjCustomizedCell ()
- (UIImageView*)imageViewForCell:(const UIView*)cell withFileName:(NSString*)fileName;
- (UISwitch*)switchForCell:(const UIView*)cell;
- (UISlider*)sliderForCell:(const UIView*)cell;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjCustomizedCell

- (void)dealloc {
  [sections_ release];
  [dataSource_ release];
  [super dealloc];
}

- (id)init {
  if ( (self = [super initWithStyle:UITableViewStyleGrouped]) ) {
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // 创建显示用数据数组
  sections_ = [[NSArray alloc] initWithObjects: @"姓名", @"必杀技", @"强弱", nil ];
  NSArray* rows1 = [NSArray arrayWithObjects: @"李小龙", nil ];
  NSArray* rows2 = [NSArray arrayWithObjects: @"截拳道", nil ];
  NSArray* rows3 = [NSArray arrayWithObjects: @"攻击力", @"防御力", nil ];
  dataSource_ = [[NSArray alloc] initWithObjects: rows1, rows2, rows3, nil ];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return [sections_ count];
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
  return [[dataSource_ objectAtIndex:section] count];
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
  cell.textLabel.text =
    [[dataSource_ objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
  switch ( indexPath.section ) {
    case 0: //< 向单元中追加UIImageView
      [cell.contentView addSubview:[self imageViewForCell:cell withFileName:@"brows.png"]];
      break;
    case 1: //< 向单元中追加UISwitch
      [cell.contentView addSubview:[self switchForCell:cell]];
      break;
    case 2: //< 向单元中追加UISlider
      [cell.contentView addSubview:[self sliderForCell:cell]];
      break;
    default:
      break;
  }
  return cell;
}

// 不同单元设置不同的高度
- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {
  if ( 0 == indexPath.section ) {
    return 100.0;
  } else {
    return 44.0;
  }
}

#pragma mark ----- Private Methods -----
//创建包含UIImageView实例的单元
- (UIImageView*)imageViewForCell:(const UITableViewCell*)cell withFileName:(NSString*)fileName {
  UIImage* image = [UIImage imageNamed:fileName];
  UIImageView* theImageView = [[[UIImageView alloc] initWithImage:image] autorelease];
  CGPoint newCenter = cell.contentView.center;
  newCenter.x += 80;
  theImageView.center = newCenter;
  theImageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                                  UIViewAutoresizingFlexibleRightMargin |
                                  UIViewAutoresizingFlexibleTopMargin |
                                  UIViewAutoresizingFlexibleBottomMargin;
  return theImageView;
}
//创建包含UISwitch实例的单元
- (UISwitch*)switchForCell:(const UITableViewCell*)cell {
  UISwitch* theSwitch = [[[UISwitch alloc] init] autorelease];
  theSwitch.on = YES;
  CGPoint newCenter = cell.contentView.center;
  newCenter.x += 80;
  theSwitch.center = newCenter;
  theSwitch.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                               UIViewAutoresizingFlexibleRightMargin |
                               UIViewAutoresizingFlexibleTopMargin |
                               UIViewAutoresizingFlexibleBottomMargin;
  return theSwitch;
}
//创建包含UISlider实例的单元
- (UISlider*)sliderForCell:(const UITableViewCell*)cell {
  UISlider* theSlider = [[[UISlider alloc] init] autorelease];
  theSlider.value = theSlider.maximumValue / 2;
  theSlider.frame = CGRectMake( 0, 0, cell.bounds.size.width / 2, cell.bounds.size.height );
  CGPoint newCenter = cell.contentView.center;
  newCenter.x += 50;
  theSlider.center = newCenter;
  theSlider.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                               UIViewAutoresizingFlexibleRightMargin |
                               UIViewAutoresizingFlexibleTopMargin |
                               UIViewAutoresizingFlexibleBottomMargin;
  return theSlider;
}

@end
