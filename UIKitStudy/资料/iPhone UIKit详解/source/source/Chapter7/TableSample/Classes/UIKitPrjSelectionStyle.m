//
//  UIKitPrjSelectionStyle.m
//
//  Created by wang on 2011-10-18.
//

#import "UIKitPrjSelectionStyle.h"

@implementation UIKitPrjSelectionStyle

- (void)dealloc {
  [selectionStyles_ release];
  [dataSource_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  dataSource_ = [[NSArray alloc] initWithObjects:
                                  @"SelectionStyleBlue",
                                  @"SelectionStyleGray", 
                                  @"SelectionStyleNone", 
                                  nil];
  selectionStyles_ = [[NSArray alloc] initWithObjects:
                                        [NSNumber numberWithInteger:UITableViewCellSelectionStyleBlue],
                                        [NSNumber numberWithInteger:UITableViewCellSelectionStyleGray],
                                        [NSNumber numberWithInteger:UITableViewCellSelectionStyleNone],
                                        nil];
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
  cell.selectionStyle = [[selectionStyles_ objectAtIndex:indexPath.row] integerValue];
  //cell.textLabel.highlightedTextColor = [UIColor blackColor];
  return cell;
}

@end
