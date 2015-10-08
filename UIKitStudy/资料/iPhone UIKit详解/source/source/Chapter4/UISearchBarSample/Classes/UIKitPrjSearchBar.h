//
//  UIKitPrjSearchBar.h
//
//  Created by wang on 2011-10-06.
//

#import <UIKit/UIKit.h>

@interface UIKitPrjSearchBar : UITableViewController <UISearchBarDelegate>
{
 @protected
  UISearchBar* searchBar_;
  NSMutableArray* dataBase_;
  NSMutableArray* dataSource_;
}
@end
