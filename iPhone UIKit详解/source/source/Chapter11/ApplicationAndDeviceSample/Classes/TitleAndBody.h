//
//  TitleAndBody.h
//  ApplicationAndDeviceSample
//
//  Created by tiger on 12-2-6.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TitleAndBody : NSObject <NSCoding> {
	@private 
	NSString *title_;
	NSString *body_;
}

@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *body;

@end
