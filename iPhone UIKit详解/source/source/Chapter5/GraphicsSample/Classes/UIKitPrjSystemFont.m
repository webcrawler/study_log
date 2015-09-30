//
//  UIKitPrjSystemFont.m
//
//  Created by wang on 2011-09-24.
//

#import "UIKitPrjSystemFont.h"

@implementation UIKitPrjSystemFont

- (void)dealloc {
  [items_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  items_ = [[NSArray alloc] initWithObjects:
              @"System Font",
              @"Small Font",
              @"Bold Font",
              @"Italic Font",
              @"Button Font Size",
              @"Label Font Size",
              nil];
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
  
  NSString* labelCaption = [items_ objectAtIndex:indexPath.row];
  cell.textLabel.text = labelCaption;
  UIFont* font;
  if ( [labelCaption isEqualToString:@"System Font"] ) {
    font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
  } else if ( [labelCaption isEqualToString:@"Small Font"]) {
    font = [UIFont systemFontOfSize:[UIFont smallSystemFontSize]];
  } else if ( [labelCaption isEqualToString:@"Bold Font"]) {
    font = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
  } else if ( [labelCaption isEqualToString:@"Italic Font"]) {
    font = [UIFont italicSystemFontOfSize:[UIFont systemFontSize]];
  } else if ( [labelCaption isEqualToString:@"Button Font Size"]) {
    font = [UIFont systemFontOfSize:[UIFont buttonFontSize]];
  } else if ( [labelCaption isEqualToString:@"Label Font Size"]) {
    font = [UIFont systemFontOfSize:[UIFont labelFontSize]];
  } else {
    font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
  } 
  cell.textLabel.font = font;

  return cell;
}

@end
