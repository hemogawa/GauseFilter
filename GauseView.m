//
//  View.m
//  GauseFilter
//
//  Created by 菊川 真理子 on 11/06/07.
//  Copyright 2011 北陸先端科学技術大学院大学. All rights reserved.
//

#import "GauseView.h"
#import "GauseController.h"
#import "GauseModel.h"

@implementation GauseView
/*-(id)initWithFrame:(NSRect)frameRect{
	//frameRect = [self bounds];
	return self;
}*/

-(void)drawRect:(NSRect)theRect{
	NSLog(@"start:drawRect");
	theRect = [self bounds];
	NSLog(@"width:%f",theRect.size.width);
	[[NSColor whiteColor] set];
	NSRectFill(theRect);
}

-(void)dealloc{
	[super dealloc];
}

@end
