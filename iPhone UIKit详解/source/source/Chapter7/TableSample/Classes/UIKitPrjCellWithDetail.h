//
//  UIKitPrjCellWithDetail.h
//
//  Created by wang on 2011-10-18.
//

#import <UIKit/UIKit.h>
#import "UIKitPrjCellWithImage.h"

@interface UIKitPrjCellWithDetail : UIKitPrjCellWithImage
{
 @protected
  NSArray* details_;
  UITableViewCellStyle cellStyle_;
}
@end
