//
//  UIKitPrjWebView.h
//
//  Created by wang on 2011-09-21.
//

#import <UIKit/UIKit.h>

@interface UIKitPrjWebView : UIViewController <UIWebViewDelegate>
{
 @private
  UIWebView* webView_;
  UIBarButtonItem* reloadButton_;
  UIBarButtonItem* stopButton_;
  UIBarButtonItem* backButton_;
  UIBarButtonItem* forwardButton_;
}
@end
