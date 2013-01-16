//
//  LauncherPageControl.h
//  UtilitiesShareOptions
//
//  Created by Dang Nguyen Van on 1/10/13.
//  Copyright (c) 2013 John Gedsted Hansen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LauncherPageControl : UIPageControl {
	NSInteger currentPage;
	NSInteger numberOfPages;
    NSInteger maxNumberOfPages;
	BOOL hidesForSinglePage;
}

@property (nonatomic) NSInteger currentPage;
@property (nonatomic) NSInteger numberOfPages;
@property (nonatomic) NSInteger maxNumberOfPages;
@property (nonatomic) BOOL hidesForSinglePage;
@property (nonatomic, strong) UIColor *inactivePageColor;
@property (nonatomic, strong) UIColor *activePageColor;

@end
