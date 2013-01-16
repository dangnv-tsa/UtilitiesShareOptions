//
//  LauncherViewController.m
//  UtilitiesShareOptions
//
//  Created by Dang Nguyen Van on 1/10/13.
//  Copyright (c) 2013 John Gedsted Hansen. All rights reserved.
//

#import "LauncherViewController.h"

@interface LauncherViewController ()
-(NSMutableArray *)savedLauncherItems;
-(NSArray*)retrieveFromUserDefaults:(NSString *)key;
-(void)saveToUserDefaults:(id)object key:(NSString *)key;
@property (nonatomic, strong) UIView *overlayView;
@property (nonatomic, strong) UIViewController *currentViewController;
@property (nonatomic, assign) CGRect statusBarFrame;
@end

@implementation LauncherViewController

@synthesize launcherView = _launcherView;
@synthesize appControllers = _appControllers;
@synthesize overlayView = _overlayView;
@synthesize currentViewController = _currentViewController;
@synthesize statusBarFrame = _statusBarFrame;

#pragma mark - ViewController lifecycle

-(id)init {
	if((self = [super init])) { 
		self.title = @"myLauncher";
	}
	return self;
}

-(void)loadView {
	[super loadView];
	
	[self setLauncherView:[[LauncherView alloc] initWithFrame:self.view.bounds]];
    
    [self.launcherView setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Default@2x.png"]]];
	[self.launcherView setDelegate:self];
	
    [self.launcherView setPages:[self savedLauncherItems]];
    [self.launcherView setNumberOfImmovableItems:[(NSNumber *)[self retrieveFromUserDefaults:@"myLauncherViewImmovable"] intValue]];
    
    [self setAppControllers:[[NSMutableDictionary alloc] init]];
    [self setStatusBarFrame:[[UIApplication sharedApplication] statusBarFrame]];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [self.launcherView viewDidAppear:animated];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [self.launcherView setCurrentOrientation:toInterfaceOrientation];
   
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
	
	self.overlayView.frame = self.launcherView.frame;

    [self.launcherView layoutLauncher];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewDidLoad{

}

- (void)viewDidUnload {
    [super viewDidUnload];
  
}

#pragma mark - MyLauncherItem management

-(BOOL)hasSavedLauncherItems {
    return ([self retrieveFromUserDefaults:@"myLauncherView"] != nil);
}

-(void)launcherViewItemSelected:(TileItem*)item {
    NSLog(@"Item clicked !");
}

-(void)launcherViewDidBeginEditing:(id)sender {
	[self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]
												 initWithBarButtonSystemItem:UIBarButtonSystemItemDone
												 target:self.launcherView action:@selector(endEditing)] animated:YES];
}

-(void)launcherViewDidEndEditing:(id)sender {
	[self.navigationItem setRightBarButtonItem:nil];
}


-(void)closeView{
    
}

#pragma mark - myLauncher caching

-(NSMutableArray *)savedLauncherItems {
	NSArray *savedPages = (NSArray *)[self retrieveFromUserDefaults:@"myLauncherView"];
	
	if(savedPages)
	{
		NSMutableArray *savedLauncherItems = [[NSMutableArray alloc] init];
		
		for (NSArray *page in savedPages)
		{
			NSMutableArray *savedPage = [[NSMutableArray alloc] init];
			for(NSDictionary *item in page)
			{
                NSNumber *version;
                if ((version = [item objectForKey:@"myLauncherViewItemVersion"])) {
                    if ([version intValue] == 2) {
                        [savedPage addObject:[[TileItem alloc]
                                               initWithTitle:[item objectForKey:@"title"]
                                               iPadImage:[item objectForKey:@"iPadImage"]
                                               deletable:[[item objectForKey:@"deletable"] boolValue]]];
                    }
                } else {
                    [savedPage addObject:[[TileItem alloc]
                                           initWithTitle:[item objectForKey:@"title"]
                                           image:[item objectForKey:@"image"]
                                           deletable:[[item objectForKey:@"deletable"] boolValue]]];
                }
			}
			
			[savedLauncherItems addObject:savedPage];
		}
		
		return savedLauncherItems;
	}
    
	return nil;
}

-(void)clearSavedLauncherItems {
    [self saveToUserDefaults:nil key:@"myLauncherView"];
    [self saveToUserDefaults:nil key:@"myLauncherViewImmovable"];
}

-(id)retrieveFromUserDefaults:(NSString *)key {
	NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	
	if (standardUserDefaults) 
		return [standardUserDefaults objectForKey:key];
	return nil;
}

-(void)saveToUserDefaults:(id)object key:(NSString *)key {
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	
	if (standardUserDefaults) 
	{
		[standardUserDefaults setObject:object forKey:key];
		[standardUserDefaults synchronize];
	}
}

@end
