//
//  UIKitPrjGroupTable.m
//
//  Created by wang on 2011-10-18.
//

#import "UIKitPrjGroupTable.h"

@implementation UIKitPrjGroupTable

- (id)init {
  if ( (self = [super initWithStyle:UITableViewStyleGrouped]) ) {
    self.title = @"GroupTable";//标题也修改一下
  }
  return self;
}

@end
