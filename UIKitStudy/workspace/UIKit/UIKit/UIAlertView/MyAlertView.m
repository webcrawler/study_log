//
//  MyAlertView.m
//  UIKit
//
//  Created by admin on 15/10/10.
//  Copyright © 2015年 MyObjC. All rights reserved.
//

#import "MyAlertView.h"

@implementation MyAlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void) dealloc
{
    NSLog(@"alert dead : %d", self.tag);
    
}

@end
