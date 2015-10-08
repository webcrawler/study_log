//
//  UIKitPrjHighlighted.m
//
//  Created by wang on 2011-09-25.
//

#import "UIKitPrjHighlighted.h"

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjHighlighted ()
- (void)buttonDidPush;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjHighlighted

- (void)dealloc {
  [items_ release];
  [super dealloc];
}

- (id)init {
  if ( (self = [super initWithStyle:UITableViewStyleGrouped]) ) {
    self.title = @"MENU";
    if ( !items_ ) {
      items_ = [[NSArray alloc] initWithObjects:@"redColor",
                                                @"blueColor",
                                                @"greenColor",
                                                nil ];
    } 
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"Highlighted";
  self.view.backgroundColor = [UIColor blackColor];

  // 按钮追加
  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"higlighted切替" forState:UIControlStateNormal];
  [button sizeToFit];
  CGPoint newPoint = self.view.center;
  newPoint.y = self.view.frame.size.height - 120;
  button.center = newPoint;
  [button addTarget:self
             action:@selector(buttonDidPush)
   forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:button];
}

#pragma mark ----- Private Methods -----

- (void)buttonDidPush {
  NSInteger rows = [self.tableView numberOfRowsInSection:0];
  for ( int i = 0; i < rows; ++i ){
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:i inSection:0];
    UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.highlighted = !cell.textLabel.highlighted;
  }
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
  
  cell.textLabel.text = [items_ objectAtIndex:indexPath.row];
  SEL selector = NSSelectorFromString( cell.textLabel.text );
  UIColor* color = [UIColor performSelector:selector];
  cell.textLabel.highlightedTextColor = color;

  return cell;
}

- (NSIndexPath*)tableView:(UITableView*)tableView willSelectRowAtIndexPath:(NSIndexPath*)indexPath {
  UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
  NSLog( @"%d", cell.textLabel.highlighted );
  return indexPath;
}
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
  UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
  NSLog( @"%d", cell.textLabel.highlighted );
}

@end
