//
//  LauncherViewController.h
//  UtilitiesShareOptions
//
//  Created by Dang Nguyen Van on 1/10/13.
//  Copyright (c) 2013 John Gedsted Hansen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LauncherView.h"
#import "TileItem.h"

@interface LauncherViewController : UIViewController <LauncherViewDelegate> {
    
}

@property (nonatomic, strong) LauncherView *launcherView;
@property (nonatomic, strong) NSMutableDictionary *appControllers;

-(BOOL)hasSavedLauncherItems;
-(void)clearSavedLauncherItems;

-(void)launcherViewItemSelected:(TileItem*)item;
-(void)closeView;

@end
