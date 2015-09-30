//
//  UIKitPrjWebViewSimple.h
//
//  Created by wang on 2011-09-21.
//

#import <UIKit/UIKit.h>

@interface UIKitPrjWebViewSimple : UIViewController <UIWebViewDelegate>
{
 @private
  UIWebView* webView_;
  UIActivityIndicatorView* activityIndicator_;
}
@end
