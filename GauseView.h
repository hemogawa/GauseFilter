//
//  View.h
//  GauseFilter
//
//  Created by 菊川 真理子 on 11/06/07.
//  Copyright 2011 北陸先端科学技術大学院大学. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class GauseController;
@class GauseModel;
@interface GauseView : NSView {
	GauseController *_gauseController;
	GauseModel *_gauseModel;
	NSImage* _image;
}

@end
