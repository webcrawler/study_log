
#import "MyUIViewBridge.h"
#include "MyUIView.h"

static MyViewBridge* instance_ = nullptr;

MyViewBridge* MyViewBridge::instance()
{
    if (instance_ == nullptr)
    {
        instance_ = new MyViewBridge;
    }
    return instance_;
}

void MyViewBridge::showMyView()
{
    UIWindow* window = [[UIApplication sharedApplication] keyWindow];
    MyUIView* myView = [[[MyUIView alloc] init] autorelease];
    [window.rootViewController presentModalViewController:myView animated:YES];
    //[window addSubview:myView.view];
    //[window bringSubviewToFront:myView.view];
}

void MyViewBridge::purgeMyView()
{
    
}