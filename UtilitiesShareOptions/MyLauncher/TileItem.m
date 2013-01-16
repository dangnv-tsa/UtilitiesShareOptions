//
//  TileItem.m
//  UtilitiesShareOptions
//
//  Created by Dang Nguyen Van on 1/10/13.
//  Copyright (c) 2013 John Gedsted Hansen. All rights reserved.
//

#import "TileItem.h"

@implementation TileItem

@synthesize delegate = _delegate;
@synthesize title = _title;
@synthesize iPadImage = _iPadImage;
@synthesize closeButton = _closeButton;

#pragma mark - Lifecycle

-(id)initWithTitle:(NSString *)title image:(NSString *)image deletable:(BOOL)_deletable {
	return [self initWithTitle:title 
                     iPadImage:image 
                     deletable:_deletable];
}

-(id)initWithTitle:(NSString *)title iPadImage:(NSString *)iPadImage deletable:(BOOL)_deletable {
    
    if((self = [super init])) {   
		dragging = NO;
		deletable = _deletable;
		
		[self setTitle:title];
        [self setIPadImage:iPadImage];
		
		[self setCloseButton:[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)]];
		self.closeButton.hidden = YES;
        
        [self setBackgroundColor:[UIColor whiteColor]];

	}
	return self;
}

#pragma mark - Layout

-(void)layoutItem {
	for(id subview in [self subviews]) 
		[subview removeFromSuperview];
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height / 2 - 10, self.frame.size.width, 20)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = self.title;
    [self addSubview:label];
    [label setBackgroundColor:[UIColor clearColor]];
    
	if(deletable){
		self.closeButton.frame = CGRectMake(0, 0, 30, 30);
		[self.closeButton setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
		self.closeButton.backgroundColor = [UIColor clearColor];
		[self.closeButton addTarget:self action:@selector(closeItem:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:self.closeButton];
	}
    
}

#pragma mark - Touch

-(void)closeItem:(id)sender {
	[UIView animateWithDuration:0.1 
						  delay:0 
						options:UIViewAnimationOptionCurveEaseIn 
					 animations:^{	
						 self.alpha = 0;
						 self.transform = CGAffineTransformMakeScale(0.00001, 0.00001);
					 }
					 completion:nil];
	
	[[self delegate] didDeleteItem:self];
}

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

#pragma mark - Setters and Getters

-(void)setFrame:(CGRect)frame {
	[super setFrame:frame];
}

-(void)setDragging:(BOOL)flag {
	if(dragging == flag)
		return;
	
	dragging = flag;
	
	[UIView animateWithDuration:0.1
						  delay:0 
						options:UIViewAnimationOptionCurveEaseIn 
					 animations:^{
						 if(dragging) {
							 self.transform = CGAffineTransformMakeScale(1.05, 1.05);
							 self.alpha = 0.5;
						 }
						 else {
							 self.transform = CGAffineTransformIdentity;
							 self.alpha = 1;
						 }
					 }
					 completion:nil];
}

-(BOOL)dragging {
	return dragging;
}

-(BOOL)deletable {
	return deletable;
}

@end
