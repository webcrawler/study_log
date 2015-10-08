//
//  RootViewController.m
//
//  Created by wang on 2011-08-15.
//

#import "RootViewController.h"

@implementation RootViewController

- (void)dealloc {
  [items_ release];
  [super dealloc];
}

#pragma mark UIViewController methods

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"MENU";
  if ( !items_ ) {
    items_ = [[NSArray alloc] initWithObjects:
                                @"UIKitPrjActivityIndicator",
                                nil ];
  } 
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];

  [self.navigationController setNavigationBarHidden:NO animated:NO];
  [self.navigationController setToolbarHidden:NO animated:NO];

  // バーの色を元に戻しておく
  [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
  self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
  self.navigationController.navigationBar.translucent = NO;
  self.navigationController.navigationBar.tintColor = nil;
  self.navigationController.toolbar.barStyle = UIBarStyleDefault;
  self.navigationController.toolbar.translucent = NO;
  self.navigationController.toolbar.tintColor = nil;
}

#pragma mark UITableView methods

- (NSInteger)tableView:(UITableView*)tableView
  numberOfRowsInSection:(NSInteger)section
{
  return [items_ count];
}


- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
  
  NSString* title = [items_ objectAtIndex:indexPath.row];
  cell.textLabel.text = [title stringByReplacingOccurrencesOfString:@"UIKitPrj" withString:@""];

  return cell;
}

- (void)tableView:(UITableView*)tableView
  didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
  NSString* className = [items_ objectAtIndex:indexPath.row];
  Class class = NSClassFromString( className );
  UIViewController* viewController = [[[class alloc] init] autorelease];
  if ( !viewController ) {
    NSLog( @"%@ was not found.", className );
    return;
  } 
  [self.navigationController pushViewController:viewController animated:YES];
}

@end
