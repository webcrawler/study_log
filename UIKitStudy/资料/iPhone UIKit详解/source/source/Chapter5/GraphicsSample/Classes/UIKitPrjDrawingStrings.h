//
//  UIKitPrjDrawingStrings.h
//
//  Created by wang on 2011-09-24.
//

#import <UIKit/UIKit.h>
//定义UIView的子类
@interface DrawStrings : UIView
@property(nonatomic,retain,readwrite) NSString *message;
@end
//画面类（UIViewController子类）
@interface UIKitPrjDrawingStrings : UIViewController
@end
