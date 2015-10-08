//
//  RootViewController.m
//  UIViewSample
//
//  Created by user00 on 8/3/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

@synthesize menues = items_;

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"MENU";
  self.menues = [NSArray arrayWithObjects:
                            @"UIKitPrjFrame",
                            @"UIKitPrjHide",
                            @"UIKitPrjBackground",
                            @"UIKitPrjAlpha",
							@"UIKitPrjAlphaCompare",
                            @"UIKitPrjTransform",
                            @"UIKitPrjContentMode",
                            @"UIKitPrjContentStretch",
                            @"UIKitPrjFit",
                            @"UIKitPrjSubviews",
                            @"UIKitPrjInsert",
                            @"UIKitPrjSiblings",
                            @"UIKitPrjTransparent",
                            @"UIKitPrjTag",
                            @"UIKitPrjConvertPoint",
                            @"UIKitPrjObserving",
                            @"UIKitPrjLayoutSubviews",
                            @"UIKitPrjAutoResize",
                            nil ];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setNavigationBarHidden:YES animated:YES];
}

#pragma mark UITableViewDelegate and UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.menues count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
  
  NSString* title = [items_ objectAtIndex:indexPath.row];
  cell.textLabel.text = [title stringByReplacingOccurrencesOfString:@"UIKitPrj" withString:@""];

  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

  NSString* className = [items_ objectAtIndex:indexPath.row];
  Class class = NSClassFromString( className );
  id viewController = [[[class alloc] init] autorelease];
  if ( !viewController ) {
    NSLog( @"%@ was not found.", className );
    return;
  } 
  [self.navigationController pushViewController:viewController animated:YES];
}

- (void)dealloc {
  [items_ release];
  [super dealloc];
}


@end

