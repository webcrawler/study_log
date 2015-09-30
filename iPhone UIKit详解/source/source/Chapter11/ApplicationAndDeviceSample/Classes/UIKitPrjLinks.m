//
//  UIKitPrjLinks.m
//
//  Created by wang on 2011-10-01.
//

#import "UIKitPrjLinks.h"

@implementation UIKitPrjLinks

- (void)dealloc {
  [dataSource_ release];
  [urls_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  dataSource_ = [[NSArray alloc] initWithObjects:
                              @"Web Links",
                              @"Mail Links",
                              @"Phone Links",
                              @"Text Links",
                              @"Map Links",
                              //@"YouTube Links",
                              @"iTunes Links",
                              @"Customize Links",
                              nil ];
  urls_ = [[NSArray alloc] initWithObjects:
                              @"http://www.apple.com/",
                              @"mailto:monster@n-i-l-x.example.com?subject=hello&body=hello%20mail!",
                              @"tel:139-0000-0000",
                              @"sms:139-0000-0000",
                              @"http://maps.google.com/maps?ll=31.143289%2C121.347239&z=15",
                              //@"http://www.tudou.com/v/jO7ei5KqCeA/&resourceId=0_04_05_99/v.swf",
                              @"http://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=441898703&mt=8",
                              @"sampleapp://sampleapp.yourcompany.com/?Hello",
                              nil ];
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
  return cell;
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
  NSString* urlString = [urls_ objectAtIndex:indexPath.row];
  NSURL* url = [NSURL URLWithString:urlString];
  UIApplication* application = [UIApplication sharedApplication];
  if ( [application canOpenURL:url] ) {
    [application openURL:url];
  }else {
	  //URL不正确时的处理
  }
 
}

@end
