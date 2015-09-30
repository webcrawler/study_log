//
//  HelloWorldAppDelegate.m
//  HelloWorld
//
//  Created by user00 on 8/15/11.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "HelloWorldAppDelegate.h"

@implementation HelloWorldAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
