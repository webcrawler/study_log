//
//  UIKitPrjButtonWithType.m
//
//  Created by wang on 2011-08-15.
//

#import "UIKitPrjButtonWithType.h"

static const CGFloat kRowHeight = 80.0;

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjButtonWithType ()
- (UIButton*)buttonForThisSampleWithType:(UIButtonType)type;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjButtonWithType

- (void)dealloc {
  [dataSource_ release];
  [buttons_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.tableView.rowHeight = kRowHeight;

  dataSource_ = [[NSArray alloc] initWithObjects:
                     @"Custom",
                     @"RoundedRect",
                     @"DetailDisclosure",
                     @"InfoLight",
                     @"InfoDark",
                     @"ContactAdd",
                     nil ];
  UIButton* customButton = [self buttonForThisSampleWithType:UIButtonTypeCustom];
  UIImage* image = [UIImage imageNamed:@"frame.png"];
  UIImage* stretchableImage = [image stretchableImageWithLeftCapWidth:20 topCapHeight:20];
  [customButton setBackgroundImage:stretchableImage forState:UIControlStateNormal];
  customButton.frame = CGRectMake( 0, 0, 200, 60 );
	//self.tableView.backgroundColor = [UIColor lightGrayColor];
  buttons_ = [[NSArray alloc] initWithObjects:
                     customButton,
                     [self buttonForThisSampleWithType:UIButtonTypeRoundedRect],
                     [self buttonForThisSampleWithType:UIButtonTypeDetailDisclosure],
                     [self buttonForThisSampleWithType:UIButtonTypeInfoLight],
                     [self buttonForThisSampleWithType:UIButtonTypeInfoDark],
                     [self buttonForThisSampleWithType:UIButtonTypeContactAdd],
                     nil ];
}

- (void)viewDidUnload {
  [dataSource_ release];
  [super viewDidUnload];
}

- (NSInteger)tableView:(UITableView*)tableView
  numberOfRowsInSection:(NSInteger)section
{
  return [dataSource_ count];
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  static NSString* CellIdentifier = @"CellStyleDefault";
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if ( nil == cell ) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
  cell.textLabel.text = [dataSource_ objectAtIndex:indexPath.row];
  UIButton* button = [buttons_ objectAtIndex:indexPath.row];
  button.frame = CGRectMake( cell.contentView.bounds.size.width - button.bounds.size.width - 20,
                             ( kRowHeight - button.bounds.size.height ) / 2,
                             button.bounds.size.width,
                             button.bounds.size.height );
  [cell.contentView addSubview:button];
  return cell;
}

#pragma mark ----- Private Methods -----

- (UIButton*)buttonForThisSampleWithType:(UIButtonType)type {
  UIButton* button = [UIButton buttonWithType:type];
  [button setTitle:@"UIButton" forState:UIControlStateNormal];
  [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [button sizeToFit];
  return button;
}

@end
