//
//  RootViewController.m
//  UtilitiesShareOptions
//
//  Created by Dang Nguyen Van on 1/10/13.
//  Copyright (c) 2013 John Gedsted Hansen. All rights reserved.
//

#import "RootViewController.h"
#import "LauncherViewController.h"
#import "TileItem.h"

#define FRAME_MARGIN	10
#define MOVIE_MIN		1
#define MOVIE_MAX		5

static const int iPadWidthPortrait = 768;
static const int iPadHeightPortrait = 1004;
static const int iPadWidthLandscape = 1024;
static const int iPadHeightLanscpae = 748;
@implementation RootViewController
@synthesize headerView;
@synthesize btnStart;
@synthesize introductions;
@synthesize launcherViewContainer;


-(void)viewDidLoad{
    
	// Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
    self.view.gestureRecognizers = self.view.gestureRecognizers;
    
//    [btnStart addTarget:self.launcherView action:@selector(endEditing) forControlEvents:UIControlEventAllTouchEvents];
    
    [self initLauncherView];
    
}

-(UIStoryboard *) loadStoryBoard{
    
    UIStoryboard *storyboard;
    if(UIDeviceOrientationIsPortrait(self.interfaceOrientation)){
        storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard-portrait" bundle:[NSBundle mainBundle]];
    }else if(UIDeviceOrientationIsLandscape(self.interfaceOrientation)){
        storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard-landscape" bundle:[NSBundle mainBundle]];
    }
    return storyboard;
}


-(void)loadView
{
    [super loadView];
    [self.launcherViewContainer addSubview:self.launcherView];
    [self.launcherView setCurrentOrientation:self.interfaceOrientation];
    [self updateFrames];
    
	if(![self hasSavedLauncherItems])
	{
        //init items
        
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        TileItem* item1 = [[TileItem alloc] initWithTitle:@"1" iPadImage:@"7474" deletable:NO];
        TileItem* item2 = [[TileItem alloc] initWithTitle:@"2" iPadImage:@"7474" deletable:NO];
        TileItem* item3 = [[TileItem alloc] initWithTitle:@"3" iPadImage:@"7474" deletable:NO];
        TileItem* item4 = [[TileItem alloc] initWithTitle:@"4" iPadImage:@"7474" deletable:NO];
        TileItem* item5 = [[TileItem alloc] initWithTitle:@"5" iPadImage:@"7474" deletable:NO];
        TileItem* item6 = [[TileItem alloc] initWithTitle:@"6" iPadImage:@"7474" deletable:NO];
        TileItem* item7 = [[TileItem alloc] initWithTitle:@"7" iPadImage:@"7474" deletable:NO];
        TileItem* item8 = [[TileItem alloc] initWithTitle:@"8" iPadImage:@"7474" deletable:NO];
        TileItem* item9 = [[TileItem alloc] initWithTitle:@"9" iPadImage:@"7474" deletable:NO];
        TileItem* item10 = [[TileItem alloc] initWithTitle:@"10" iPadImage:@"7474" deletable:NO];
        TileItem* item11 = [[TileItem alloc] initWithTitle:@"11" iPadImage:@"7474" deletable:NO];
        TileItem* item12 = [[TileItem alloc] initWithTitle:@"12" iPadImage:@"7474" deletable:NO];
        TileItem* item13 = [[TileItem alloc] initWithTitle:@"13" iPadImage:@"7474" deletable:NO];
        TileItem* item14 = [[TileItem alloc] initWithTitle:@"14" iPadImage:@"7474" deletable:NO];
        TileItem* item15 = [[TileItem alloc] initWithTitle:@"15" iPadImage:@"7474" deletable:NO];
        TileItem* item16 = [[TileItem alloc] initWithTitle:@"16" iPadImage:@"7474" deletable:NO];
        TileItem* item17 = [[TileItem alloc] initWithTitle:@"17" iPadImage:@"7474" deletable:NO];
        TileItem* item18 = [[TileItem alloc] initWithTitle:@"18" iPadImage:@"7474" deletable:NO];
        TileItem* item19 = [[TileItem alloc] initWithTitle:@"19" iPadImage:@"7474" deletable:NO];
        TileItem* item20 = [[TileItem alloc] initWithTitle:@"20" iPadImage:@"7474" deletable:NO];
        TileItem* item21 = [[TileItem alloc] initWithTitle:@"21" iPadImage:@"7474" deletable:NO];
        TileItem* item22 = [[TileItem alloc] initWithTitle:@"22" iPadImage:@"7474" deletable:NO];
        
        [items addObject:item1];
        [items addObject:item2];
        [items addObject:item3];
        [items addObject:item4];
        [items addObject:item5];
        [items addObject:item6];
        [items addObject:item7];
        [items addObject:item8];
        [items addObject:item9];
        [items addObject:item10];
        [items addObject:item11];
        [items addObject:item12];
        [items addObject:item13];
        [items addObject:item14];
        [items addObject:item15];
        [items addObject:item16];
        [items addObject:item17];
        [items addObject:item18];
        [items addObject:item19];
        [items addObject:item20];
        [items addObject:item21];
        [items addObject:item22];
        
        [self.launcherView initLauncherItems:items];
	}
    
}


-(void) addTile{
    TileItem *newTile = [[TileItem alloc] initWithTitle:@"new item" image:@"new item added" deletable:TRUE];
    [self.launcherView addTile:newTile];
}


#pragma LauncherView
-(void) initLauncherView{
    self.launcherView.delegate = self;
}

-(void)launcherViewItemSelected:(TileItem *)item{
    clickedLauncherItem = item;
}

-(void)launcherViewDidBeginEditing:(id)sender{

}

-(void)launcherViewDidEndEditing:(id)sender{
    
}

#pragma Touch
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [[event allTouches] anyObject];
    CGPoint pos  = [touch locationInView: self.view];
    if(!CGRectContainsPoint(self.launcherViewContainer.frame, pos)){
        NSLog(@"touch to end editing launcher view");
            [self.launcherView endEditing];
    }
}

#pragma orientation
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
	//If you don't want to support multiple orientations uncomment the line below
    //    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
	return [super shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];

}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    [self updateFrames];
    
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
}

-(void) updateFrames{
    self.btnStart.frame = CGRectMake(20, 20, 100, 44);
    
    if(UIDeviceOrientationIsPortrait(self.interfaceOrientation)){
        NSLog(@"Portrait");
        self.introductions.frame = CGRectMake(20, 10, iPadWidthPortrait - 40, 250);
        self.launcherViewContainer.frame = CGRectMake(20, 210 , iPadWidthPortrait - 40, [self.launcherView getRequiredHeight]);
    }else if(UIDeviceOrientationIsLandscape(self.interfaceOrientation)){
        NSLog(@"Lansdcape");
        self.introductions.frame = CGRectMake(20, 0, iPadWidthLandscape - 40, 250);
        self.launcherViewContainer.frame = CGRectMake(20, 180 , iPadWidthLandscape - 40, [self.launcherView getRequiredHeight]);
    }
    
    self.launcherView.frame = CGRectMake(0, 0, self.launcherViewContainer.frame.size.width, self.launcherViewContainer.frame.size.height);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
