//
//  RootViewController.h
//  UtilitiesShareOptions
//
//  Created by Dang Nguyen Van on 1/10/13.
//  Copyright (c) 2013 John Gedsted Hansen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LauncherViewController.h"
#import "TileItem.h"

@interface RootViewController : LauncherViewController <LauncherViewDelegate>
{
    TileItem *clickedLauncherItem;
}

@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (strong, nonatomic) IBOutlet UIButton *btnStart;
@property (strong, nonatomic) IBOutlet UILabel *introductions;
@property (strong, nonatomic) IBOutlet UIView *launcherViewContainer;

@end
