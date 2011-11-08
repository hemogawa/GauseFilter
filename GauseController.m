//
//  Controller.m
//  GauseFilter
//
//  Created by 菊川 真理子 on 11/06/06.
//  Copyright 2011 北陸先端科学技術大学院大学. All rights reserved.
//

#import "GauseController.h"
#import "GauseView.h"
#import "GauseModel.h"

extern OSStatus CGSNewConnection(const void **attributes, CGSConnection * id);

@implementation GauseController

static CGSWindowFilterRef wfr;
static CGSConnection connection;

-(id)init{
	NSLog(@"launched");
	_radius = 0.0;
	_alreadyWindow = NO;
	NSLog(@"%2f",_radius);
	[self equipWindow:self];
<<<<<<< HEAD
=======
	_bar = [NSStatusBar systemStatusBar];	//ステータスバーを作成
	_sbItem = [_bar statusItemWithLength:NSVariableStatusItemLength];	//ステータスバーに載せるアイテムを作成
	[_sbItem retain];	//sbItemを保持
	[_sbItem setTitle:@"Start"];	//タイトルをセット
	[_sbItem setHighlightMode:YES];	//クリック時にハイライト表示
>>>>>>> add statusbar
	return self;
}
	

-(void)equipWindow:(id)sender{
	NSScreen *aScreen = [NSScreen mainScreen];
	NSRect aFrame;
	if(_alreadyWindow == YES){
		[_aWindow close];
	}
	NSLog(@"start:equipWindow");
	
	CGSNewConnection(NULL, &connection);
	CGSNewCIFilterByName(connection, (CFStringRef)@"CIGaussianBlur", &wfr);
	NSDictionary *optionDict = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:_radius] forKey:@"inputRadius"];
	CGSSetCIFilterValuesFromDictionary(connection, wfr, (CFDictionaryRef)optionDict);
		
	aFrame = [aScreen frame];	//スクリーンのフレームをNSRectで渡す
	_aWindow = [[NSWindow alloc] initWithContentRect:aFrame
										  styleMask:NSBorderlessWindowMask
											backing:NSBackingStoreBuffered
											  defer:NO];
	[_aWindow setReleasedWhenClosed:NO];
	[_aWindow setOpaque:NO];
	[_aWindow setAlphaValue:0.1];
	[_aWindow setHasShadow:NO];
	[_aWindow setIgnoresMouseEvents:YES];
	_gauseView = [[GauseView alloc] initWithFrame:aFrame];
	[_aWindow setContentView:_gauseView];
	[_gauseView release];
	[_aWindow orderFront:self];
	[_aWindow setLevel:NSScreenSaverWindowLevel -1];
	
	CGSAddWindowFilter(connection, [_aWindow windowNumber], wfr, 1);
	_alreadyWindow = YES;
}
-(IBAction)capture:(id)sender{
	[self equipWindow:self];
}

-(CGWindowID)getWindowId{
	return [_appWindow windowNumber];
}
-(IBAction)changeRadius:(id)sender{
	_radius = [sender floatValue];
	NSLog(@"%2.1f",_radius);
	//[self equipWindow:self];
	CGSNewConnection(NULL, &connection);
	CGSNewCIFilterByName(connection, (CFStringRef)@"CIGaussianBlur", &wfr);
	NSDictionary *optionDict = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:_radius] forKey:@"inputRadius"];
	CGSSetCIFilterValuesFromDictionary(connection, wfr, (CFDictionaryRef)optionDict);
	CGSAddWindowFilter(connection, [_aWindow windowNumber], wfr, 1);
<<<<<<< HEAD
=======
	char sbText[255];
	sprintf(sbText,"姿勢の悪さレベル:%d",(int)(_radius*10));
	[_sbItem setTitle:[NSString stringWithCString:sbText encoding:NSUTF8StringEncoding]];
>>>>>>> add statusbar
}

@end
