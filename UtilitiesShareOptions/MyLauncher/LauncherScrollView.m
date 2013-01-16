//
//  LauncherScrollView.m
//  UtilitiesShareOptions
//
//  Created by Dang Nguyen Van on 1/10/13.
//  Copyright (c) 2013 John Gedsted Hansen. All rights reserved.
//

#import "LauncherScrollView.h"

@implementation LauncherScrollView

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent *)event {
	[super touchesBegan:touches withEvent:event];
	[[self nextResponder] touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent *)event {
	[super touchesMoved:touches withEvent:event];
	[[self nextResponder] touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent *)event {
	[super touchesEnded:touches withEvent:event];
	[[self nextResponder] touchesEnded:touches withEvent:event];
}

@end
