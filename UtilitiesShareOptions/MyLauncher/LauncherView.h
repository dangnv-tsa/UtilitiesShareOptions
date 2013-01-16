//
//  LauncherView.h
//  UtilitiesShareOptions
//
//  Created by Dang Nguyen Van on 1/10/13.
//  Copyright (c) 2013 John Gedsted Hansen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TileItem.h"
#import "LauncherPageControl.h"
#import "LauncherScrollView.h"

@protocol LauncherViewDelegate <NSObject>
-(void)launcherViewItemSelected:(TileItem*)item;
-(void)launcherViewDidBeginEditing:(id)sender;
-(void)launcherViewDidEndEditing:(id)sender;
@end

@interface LauncherView : UIView <UIScrollViewDelegate, LauncherItemDelegate> {	
    UIDeviceOrientation currentOrientation;
    
	BOOL itemsAdded;
	BOOL editing;
	BOOL dragging;
    BOOL editingAllowed;
    
	NSInteger numberOfImmovableItems;
    
	int numberOfColumns;
	int numberOfRows;
    
	CGFloat tileItemWidth;
	CGFloat tileItemHeight;
    
    CGFloat xStartPadding;
    CGFloat yStartPadding;
    
    CGFloat xSpacing;
    CGFloat ySpacing;
}

@property (nonatomic) BOOL editingAllowed;
@property (nonatomic) NSInteger numberOfImmovableItems;
@property (nonatomic, strong) id <LauncherViewDelegate> delegate;
@property (nonatomic, strong) LauncherScrollView *pagesScrollView;
@property (nonatomic, strong) LauncherPageControl *pageControl;
@property (nonatomic, strong) NSMutableArray *pages;

// Default for animation below is YES

-(void)initLauncherItems:(NSMutableArray *)items;
-(void) addTile:(TileItem* )item;
-(void) removeTile:(TileItem* )item;

-(void)viewDidAppear:(BOOL)animated;
-(void)setCurrentOrientation:(UIInterfaceOrientation)newOrientation;
-(void)layoutLauncher;
-(void)layoutLauncherAnimated:(BOOL)animated;
-(int)maxItemsPerPage;
-(int)maxPages;
-(BOOL)isEditing;
-(void)endEditing;
-(int)getRequiredHeight;
@end
