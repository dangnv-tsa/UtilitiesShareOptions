//
//  LauncherPageControl.m
//  UtilitiesShareOptions
//
//  Created by Dang Nguyen Van on 1/10/13.
//  Copyright (c) 2013 John Gedsted Hansen. All rights reserved.
//

#import "LauncherPageControl.h"

@implementation LauncherPageControl

@synthesize numberOfPages, maxNumberOfPages, hidesForSinglePage;
@synthesize inactivePageColor = _inactivePageColor;
@synthesize activePageColor = _activePageColor;
@dynamic currentPage;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        hidesForSinglePage = NO;
        maxNumberOfPages = 20; // Max before clipping
        
        [self setActivePageColor:[UIColor blueColor]];
		[self setInactivePageColor:[UIColor grayColor]];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
	if (hidesForSinglePage == NO || [self numberOfPages] > 1) {
		CGContextRef context = UIGraphicsGetCurrentContext();
		
		CGFloat dotSize = 8;
		CGFloat margin =  5;
		CGFloat dotWidth = dotSize + (2 * margin);
		CGFloat totalWidth = (dotWidth * [self numberOfPages]) + (2 * margin);

		CGRect contentRect = CGRectMake(round(self.frame.size.width/2 - totalWidth/2),
										round(self.frame.size.height/2 - dotSize/2),
										dotSize, dotSize);

		contentRect.origin.x += margin;
		for (NSInteger i = 0; i < [self numberOfPages]; i++) {
			contentRect.origin.x += margin;
			
			if (i == [self currentPage]) {
				CGContextSetFillColorWithColor(context, [self.activePageColor CGColor]);
			} else {
				CGContextSetFillColorWithColor(context, [self.inactivePageColor CGColor]);
			}
            
			CGContextFillEllipseInRect(context, contentRect);
			contentRect.origin.x += dotSize + margin;
		}
	}
}

- (NSInteger)currentPage {
	return currentPage;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
	if (self.touchInside) {
		CGPoint point = [touch locationInView:self];		
		NSInteger currentPageInt = self.currentPage;
		
		if (point.x <= self.frame.size.width/2)
			[self setCurrentPage:--currentPageInt];
		else 
			[self setCurrentPage:++currentPageInt];

		[self sendActionsForControlEvents:UIControlEventValueChanged];
	}
}

-(void)setNumberOfPages:(NSInteger)count {
	if (count > maxNumberOfPages) return;
	self.hidden = count <= 1 ? YES : NO;
	
	numberOfPages = count;
	if (currentPage > [self numberOfPages]-1) [self setCurrentPage:[self numberOfPages] - 1];
	
	[self setNeedsDisplay];
}

- (void)setCurrentPage:(NSInteger)page {
	if (page > [self numberOfPages]-1) page = [self numberOfPages] - 1;
    if (page < 0) page = 0;
	
	currentPage = page;
	[self setNeedsDisplay];
}

@end
