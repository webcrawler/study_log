//
//  UIKitPrjViewForRow.h
//
//  Created by wang on 2011-10-03.
//

#import <UIKit/UIKit.h>

@interface UIKitPrjViewForRow : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
{
 @private
  UIPickerView* picker_;
  NSArray* dataSource_;
}
@end
