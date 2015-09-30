//
//  TitleAndBody.m
//  ApplicationAndDeviceSample
//
//  Created by tiger on 12-2-6.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "TitleAndBody.h"


@implementation TitleAndBody

@synthesize title = title_;
@synthesize body = body_;

-(void)dealloc{
	[title_ release];
	[body_ release];
	[super dealloc];
}

-(void)encodeWithCoder:(NSCoder *)coder{
	[coder encodeObject:self.title forKey:@"TITLE"];
	[coder encodeObject:self.body forKey:@"BODY"];
}

-(id)initWithCoder:(NSCoder *)coder{
	if (self = [super init]) {
		self.title = [coder decodeObjectForKey:@"TITLE"];
		self.body  = [coder decodeObjectForKey:@"BODY"];
	}
	return self;
}

@end
