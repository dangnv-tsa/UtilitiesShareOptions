//
//  TileItem.h
//  UtilitiesShareOptions
//
//  Created by Dang Nguyen Van on 1/10/13.
//  Copyright (c) 2013 John Gedsted Hansen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LauncherItemDelegate <NSObject>
-(void)didDeleteItem:(id)item;
@end

@interface TileItem : UIControl {
	BOOL dragging;
	BOOL deletable;
}

@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *iPadImage;
@property (nonatomic, retain) UIButton *closeButton;

-(id)initWithTitle:(NSString *)title image:(NSString *)image deletable:(BOOL)_deletable;
-(id)initWithTitle:(NSString *)title iPadImage:(NSString *)iPadImage deletable:(BOOL)_deletable;

-(void)layoutItem;
-(void)setDragging:(BOOL)flag;
-(BOOL)dragging;
-(BOOL)deletable;

@end
