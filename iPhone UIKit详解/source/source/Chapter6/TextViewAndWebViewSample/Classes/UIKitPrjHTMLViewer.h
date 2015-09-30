//
//  UIKitPrjHTMLViewer.h
//
//  Created by wang on 2011-09-21.
//

#import <UIKit/UIKit.h>

@interface UIKitPrjHTMLViewer : UIViewController <UIWebViewDelegate>
{
 @private
  UIWebView* webView_;
  UIActivityIndicatorView* activityIndicator_;
}

@end
