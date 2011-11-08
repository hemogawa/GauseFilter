//
//  Controller.h
//  GauseFilter
//
//  Created by 菊川 真理子 on 11/06/06.
//  Copyright 2011 北陸先端科学技術大学院大学. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>
#import <QuartzCore/QuartzCore.h>
#import "CGSPrivate.h"

@class GauseView;
@class GauseModel;
@interface GauseController : NSObject {
	GauseView *_gauseView;
	GauseModel *_gauseModel;
	IBOutlet NSWindow* _appWindow;
	IBOutlet NSImageView* _appView;
	IBOutlet id _sbMenu;
	NSImage* _image;
	NSWindow* _aWindow;
	float _radius;
	bool _alreadyWindow;
	NSStatusBar* _bar;
	NSStatusItem* _sbItem;
}
-(IBAction)capture:(id)sender;
-(IBAction)changeRadius:(id)sender;
-(void)equipWindow:(id)sender;
-(CGWindowID)getWindowId;

@end
