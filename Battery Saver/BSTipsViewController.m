//
//  BSTipsViewController.m
//  Battery Saver
//
//  Created by Shishir Mishra on 16/12/12.
//  Copyright (c) 2012 Shishir Mishra. All rights reserved.
//

#import "BSTipsViewController.h"
#import "BSViewController.h"
#import "BSMainViewController.h"
#import "BSMaintananceViewController.h"
#import <sys/utsname.h>

@interface BSTipsViewController ()

@end

@implementation BSTipsViewController
BSViewController *viewController;
BSMainViewController* viewControllerOne;
BSMaintananceViewController* viewControllerTwo;
BSTipsViewController* viewControllerThree;

@synthesize nagView;
@synthesize scrollView;
@synthesize tipsDeviceLabel;
@synthesize freeTipView;

const CGFloat kScrollObjHeight	= 460.0;
const CGFloat kScrollObjWidth	= 320.0;
const NSUInteger kNumImages		= 13;

- (void)layoutScrollImages
{
	UIImageView *view = nil;
	NSArray *subviews = [scrollView subviews];
    
	// reposition all image subviews in a horizontal serial fashion
	CGFloat curXLoc = 0;
	for (view in subviews)
	{
		if ([view isKindOfClass:[UIImageView class]] && view.tag > 0)
		{
			CGRect frame = view.frame;
			frame.origin = CGPointMake(curXLoc, 0);
			view.frame = frame;
			
			curXLoc += (kScrollObjWidth);
		}
	}
	
	// set the content size so it can be scrollable
	[scrollView setContentSize:CGSizeMake((kNumImages * kScrollObjWidth), [scrollView bounds].size.height)];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    [subNavCntlr viewWillAppear:animated];
    [adViewTips setDelegate:self];
    
    adViewTips = [[ADBannerView alloc] initWithFrame:CGRectZero];
    adViewTips.frame = CGRectOffset(adViewTips.frame, 0, -50);
    adViewTips.requiredContentSizeIdentifiers = [NSSet setWithObject:  ADBannerContentSizeIdentifier320x50];
    adViewTips.currentContentSizeIdentifier = ADBannerContentSizeIdentifier320x50;
    [self.view addSubview:adViewTips];
    adViewTips.delegate=self;
    self.bannerIsVisibleTips=NO;
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIDevice *currentDevice = [UIDevice currentDevice];
    
    
    NSString *model = [currentDevice model];
    NSString *systemVersion = [currentDevice systemVersion];
    
    
    NSLog(@"model %@",model);
    NSLog(@"systemVersion %@",systemVersion);
    //tipsDeviceLabel.text=[NSString stringWithFormat:@"Your Device : %@",model];
    
    
    NSString *deviceType = [UIDevice currentDevice].model;
    
    // iPhone : iPhone,iPhone1,2,iPhone2,1
    //iPhone 4 : iPhone3,1,iPhone3,3
    //iPhone 4S : iPhone4,1
    
    // deviceType = @"iPhone5,1";
    //iPhone
    if([deviceType isEqualToString:@"iPhone" ] || [deviceType isEqualToString:@"iPhone1,2"] || [deviceType isEqualToString:@"iPhone2,1"])
    {
        NSLog(@"iPhone old");
        tipsDeviceLabel.text=[NSString stringWithFormat:@"Your Device :iPhone 4" ];
    }
    
    //iPod touch
    else if([deviceType isEqualToString:@"iPod1,1" ] || [deviceType isEqualToString:@"iPod2,1"] || [deviceType isEqualToString:@"iPod3,1"] || [deviceType isEqualToString:@"iPod4,1"]  )
    {
        NSLog(@"iPod");
        tipsDeviceLabel.text=[NSString stringWithFormat:@"Your Device :iPod Touch" ];
    }
    
    //iPad
    else if([deviceType isEqualToString:@"iPad1,1" ] || [deviceType isEqualToString:@"iPad2,1"] || [deviceType isEqualToString:@"iPad2,2"] || [deviceType isEqualToString:@"iPad2,3"] || [deviceType isEqualToString:@"iPad3,1"]
            || [deviceType isEqualToString:@"iPad3,2"] || [deviceType isEqualToString:@"iPad3,3"])
    {
        NSLog(@"iPad");
        tipsDeviceLabel.text=[NSString stringWithFormat:@"Your Device :iPad" ];
    }
    
    
    
    //iPhone 4
    else if([deviceType isEqualToString:@"iPhone3,1" ] || [deviceType isEqualToString:@"iPhone3,3"] )
    {
        NSLog(@"iPhone new");
        tipsDeviceLabel.text=[NSString stringWithFormat:@"Your Device :iPhone 4" ];
    }
    //iPhone 4S
    else if([deviceType isEqualToString:@"iPhone4,1" ])
    {
        NSLog(@"iPhone 4S");
        tipsDeviceLabel.text=[NSString stringWithFormat:@"Your Device :iPhone 4S" ];
    }
    //iPhone 5
    else if([deviceType isEqualToString:@"iPhone5,1" ])
    {
        NSLog(@"iPhone 5");
        tipsDeviceLabel.text=[NSString stringWithFormat:@"Your Device :iPhone 5" ];
    }
    

    
    
    
    
    
    
    UIDevice *myDevice = [UIDevice currentDevice];
    [myDevice setBatteryMonitoringEnabled:YES];
    float batLeft = [myDevice batteryLevel];
    int i=[myDevice batteryState];
    
    int batinfo=(batLeft*100);
    
    [scrollView setBackgroundColor:[UIColor blackColor]];
	[scrollView setCanCancelContentTouches:NO];
	scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
	scrollView.clipsToBounds = YES;		// default is NO, we want to restrict drawing within our scrollview
	scrollView.scrollEnabled = YES;
	
	// pagingEnabled property default is NO, if set the scroller will stop or snap at each photo
	// if you want free-flowing scroll, don't set this property.
	scrollView.pagingEnabled = YES;
	
	// load all the images from our bundle and add them to the scroll view
	NSUInteger m;
    NSString *imageName = [NSString stringWithFormat:@"image0.png"];
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    // setup each frame to a default height and width, it will be properly placed when we call "updateScrollList"
    CGRect rect = imageView.frame;
    rect.size.height = kScrollObjHeight;
    rect.size.width = kScrollObjWidth;
    imageView.frame = rect;
    imageView.tag = m;	// tag our images for later use when we place them in serial fashion
    [scrollView addSubview:imageView];
    //  [imageView release];
    
	for (m = 0; m <= kNumImages; m++)
	{
        
		NSString *imageName = [NSString stringWithFormat:@"image%d.png", m];
		UIImage *image = [UIImage imageNamed:imageName];
		UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
		
		// setup each frame to a default height and width, it will be properly placed when we call "updateScrollList"
		CGRect rect = imageView.frame;
		rect.size.height = kScrollObjHeight;
		rect.size.width = kScrollObjWidth;
		imageView.frame = rect;
		imageView.tag = m;	// tag our images for later use when we place them in serial fashion
		[scrollView addSubview:imageView];
        //	[imageView release];
	}
	
	[self layoutScrollImages];
    

}

- (void)viewDidLoad
{
  //  nagView.hidden = NO;
//    [adViewTips setDelegate:self];
//    
//    adViewTips = [[ADBannerView alloc] initWithFrame:CGRectZero];
//    adViewTips.frame = CGRectOffset(adViewTips.frame, 0, -50);
//    adViewTips.requiredContentSizeIdentifiers = [NSSet setWithObject:  ADBannerContentSizeIdentifier320x50];
//    adViewTips.currentContentSizeIdentifier = ADBannerContentSizeIdentifier320x50;
//    [self.view addSubview:adViewTips];
//    adViewTips.delegate=self;
//    self.bannerIsVisibleTips=NO;
//    
//    
//    
//
//    [super viewDidLoad];
//    // Do any additional setup after loading the view from its nib.
//    UIDevice *currentDevice = [UIDevice currentDevice];
//    
//    
//    NSString *model = [currentDevice model];
//    NSString *systemVersion = [currentDevice systemVersion];
//    
//    
//    NSLog(@"model %@",model);
//    NSLog(@"systemVersion %@",systemVersion);
//    tipsDeviceLabel.text=[NSString stringWithFormat:@"Your Device : %@",model];
//    
//    UIDevice *myDevice = [UIDevice currentDevice];
//    [myDevice setBatteryMonitoringEnabled:YES];
//    float batLeft = [myDevice batteryLevel];
//    int i=[myDevice batteryState];
//    
//    int batinfo=(batLeft*100);
//    
//    [scrollView setBackgroundColor:[UIColor blackColor]];
//	[scrollView setCanCancelContentTouches:NO];
//	scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
//	scrollView.clipsToBounds = YES;		// default is NO, we want to restrict drawing within our scrollview
//	scrollView.scrollEnabled = YES;
//	
//	// pagingEnabled property default is NO, if set the scroller will stop or snap at each photo
//	// if you want free-flowing scroll, don't set this property.
//	scrollView.pagingEnabled = YES;
//	
//	// load all the images from our bundle and add them to the scroll view
//	NSUInteger m;
//    NSString *imageName = [NSString stringWithFormat:@"image0.png"];
//    UIImage *image = [UIImage imageNamed:imageName];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
//    
//    // setup each frame to a default height and width, it will be properly placed when we call "updateScrollList"
//    CGRect rect = imageView.frame;
//    rect.size.height = kScrollObjHeight;
//    rect.size.width = kScrollObjWidth;
//    imageView.frame = rect;
//    imageView.tag = m;	// tag our images for later use when we place them in serial fashion
//    [scrollView addSubview:imageView];
//  //  [imageView release];
//  
//	for (m = 0; m <= kNumImages; m++)
//	{
//        
//		NSString *imageName = [NSString stringWithFormat:@"image%d.png", m];
//		UIImage *image = [UIImage imageNamed:imageName];
//		UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
//		
//		// setup each frame to a default height and width, it will be properly placed when we call "updateScrollList"
//		CGRect rect = imageView.frame;
//		rect.size.height = kScrollObjHeight;
//		rect.size.width = kScrollObjWidth;
//		imageView.frame = rect;
//		imageView.tag = m;	// tag our images for later use when we place them in serial fashion
//		[scrollView addSubview:imageView];
//	//	[imageView release];
//	}
//	
//	[self layoutScrollImages];
//    
}

-(IBAction)purchaseTipsCall:(id)sender{
    delegate = [[UIApplication sharedApplication] delegate];
    [delegate.iapManager purchaseNoAds];

}

-(IBAction)laterCall:(id)sender{
//    nagView.hidden = YES;
//    freeTipView.hidden=NO;
}


- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if (!self.bannerIsVisibleTips)
    {
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        // banner is invisible now and moved out of the screen on 50 px
        banner.frame = CGRectOffset(banner.frame, 0, 50);
        [UIView commitAnimations];
        self.bannerIsVisibleTips = YES;
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if (self.bannerIsVisibleTips)
    {
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        // banner is visible and we move it out of the screen, due to connection issue
        banner.frame = CGRectOffset(banner.frame, 0, -50);
        [UIView commitAnimations];
        self.bannerIsVisibleTips = NO;
    }
}

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
{
    NSLog(@"Banner view is beginning an ad action");
    BOOL shouldExecuteAction = YES;
    if (!willLeave && shouldExecuteAction)
    {
        // stop all interactive processes in the app
        // [video pause];
        // [audio pause];
    }
    return shouldExecuteAction;
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner
{
    // resume everything you've stopped
    // [video resume];
    // [audio resume];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma
#pragma Menu Call
-(IBAction)menuCall:(id)sender{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        viewController = [[BSViewController alloc] initWithNibName:@"BSViewController_iPhone" bundle:[NSBundle mainBundle]];
         [self.view addSubview:viewController.view];
//        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//        [self presentViewController:viewController animated:YES completion:nil];
        
    } else {
        viewController = [[BSViewController alloc] initWithNibName:@"BSViewController_iPad" bundle:[NSBundle mainBundle]];
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:viewController animated:YES completion:nil];
        
    }
    
    NSLog(@"Menu");
}


#pragma
#pragma Main Call
-(IBAction)mainCall:(id)sender{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        viewControllerOne = [[BSMainViewController alloc] initWithNibName:@"BSMainViewController" bundle:[NSBundle mainBundle]];
        [self.view addSubview:viewControllerOne.view];
        
    } else {
        viewControllerOne = [[BSMainViewController alloc] initWithNibName:@"BSMainViewController~iPad" bundle:[NSBundle mainBundle]];
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:viewControllerOne animated:YES completion:nil];
        
    }
    
    NSLog(@"Main");
}

#pragma
#pragma Mainenance Call
-(IBAction)maintenanceCall:(id)sender{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        viewControllerTwo = [[BSMaintananceViewController alloc] initWithNibName:@"BSMaintananceViewController" bundle:[NSBundle mainBundle]];
         [self.view addSubview:viewControllerTwo.view];
//        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//        //  [self presentModalViewController:viewController animated:YES];
//        [self presentViewController:viewControllerTwo animated:YES completion:nil];
        
    } else {
        viewControllerTwo = [[BSMaintananceViewController alloc] initWithNibName:@"BSMaintananceViewController~iPad" bundle:[NSBundle mainBundle]];
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:viewControllerTwo animated:YES completion:nil];
        
    }
    
    
    NSLog(@"maintenance");
}


#pragma
#pragma Tips Call
-(IBAction)tipsCall:(id)sender{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        viewControllerThree = [[BSTipsViewController alloc] initWithNibName:@"BSTipsViewController" bundle:[NSBundle mainBundle]];
         [self.view addSubview:viewControllerThree.view];
//        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//        //  [self presentModalViewController:viewController animated:YES];
//        [self presentViewController:viewControllerThree animated:YES completion:nil];
        
    } else {
        viewControllerThree = [[BSTipsViewController alloc] initWithNibName:@"BSTipsViewController~iPad" bundle:[NSBundle mainBundle]];
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:viewControllerThree animated:YES completion:nil];
        
    }
    
    NSLog(@"tips");
}

@end
