//
//  UIKitPrjBookmarkButton.m
//
//  Created by wang on 2011-10-06.
//

#import "UIKitPrjBookmarkButton.h"

@implementation UIKitPrjBookmarkButton

- (void)viewDidLoad {
  [super viewDidLoad];
  //显示书签按钮
  searchBar_.showsBookmarkButton = YES;
}
//触摸书签按钮后，以模态画面的形式显示书签列表
- (void)searchBarBookmarkButtonClicked:(UISearchBar*)searchBar {
  id rootViewController = [[BookmarkDialog alloc] initWithParent:self];
  id navi = [[UINavigationController alloc] initWithRootViewController:rootViewController];
  [rootViewController release];
  [self presentModalViewController:navi animated:YES];
  [navi release];
}

- (void)setCurrentText:(NSString*)text {
  searchBar_.text = text;
  [self searchBarSearchButtonClicked:searchBar_];
}

@end

#pragma mark ----- BookmarkDialog -----

@implementation BookmarkDialog

- (void)dealloc {
  [dataSource_ release];
  [super dealloc];
}

- (id)initWithParent:(UIViewController*)parent {
  if ( (self = [super init]) ) {
    parent_ = parent;    
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  dataSource_ = [[NSArray alloc] initWithObjects:@"11",
                                                 @"22",
                                                 @"33",
                                                 nil ];
  self.title = @"Bookmarks";
  UIBarButtonItem* barButton =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                   target:self
                                                   action:@selector(doneDidPush)] autorelease];
  self.navigationItem.rightBarButtonItem = barButton;
}

- (void)doneDidPush {
  [self dismissModalViewControllerAnimated:YES];
}

- (void)tableView:(UITableView*)tableView
  didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
  [parent_ setCurrentText:[dataSource_ objectAtIndex:indexPath.row]];
  [self dismissModalViewControllerAnimated:YES];
}

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
