//
//  UIKitPrjWebViewLoadData.h
//
//  Created by wang on 2011-09-21.
//

#import <UIKit/UIKit.h>

@interface UIKitPrjWebViewLoadData : UIViewController <UIWebViewDelegate>
{
 @private
  UIWebView* webView_;
  UIActivityIndicatorView* activityIndicator_;
}
@end
