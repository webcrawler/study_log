//
//  UIKitPrjBookmarkButton.h
//
//  Created by wang on 2011-10-06.
//

#import <UIKit/UIKit.h>
#import "UIKitPrjSearchBar.h"

@interface UIKitPrjBookmarkButton : UIKitPrjSearchBar
- (void)setCurrentText:(NSString*)text;
@end

@interface BookmarkDialog : UITableViewController
{
 @private
  NSArray* dataSource_;
  id parent_; //< weak
}
- (id)initWithParent:(UIViewController*)parent;
@end

