//
//  BSMaintananceViewController.m
//  Battery Saver
//
//  Created by Shishir Mishra on 16/12/12.
//  Copyright (c) 2012 Shishir Mishra. All rights reserved.
//

#import "BSMaintananceViewController.h"
#import "BSViewController.h"
#import "BSMainViewController.h"

#import "BSTipsViewController.h"

@interface BSMaintananceViewController ()

@end

@implementation BSMaintananceViewController

BSViewController *viewController;
BSMainViewController* viewControllerOne;
BSMaintananceViewController* viewControllerTwo;
BSTipsViewController* viewControllerThree;

NSString *val;
NSDate *now;
NSDateFormatter *dateFormatter;
NSString *datesaved;
NSString *todaydatesaved;
NSUserDefaults *standardUserDefaults;

@synthesize numberOfDaysLabel;
@synthesize maintenancedeviceLabel;
@synthesize  menuButtonUnkeep,mainButtonUnkeep,unkeepButtonUnkeep,tipsButtonUnkeep;
@synthesize BatteryLevelImageView;
NSString *thisShouldBeSave;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [adViewUnkeep setDelegate:self];
    
    adViewUnkeep = [[ADBannerView alloc] initWithFrame:CGRectZero];
    adViewUnkeep.frame = CGRectOffset(adViewUnkeep.frame, 0, -50);
    adViewUnkeep.requiredContentSizeIdentifiers = [NSSet setWithObject:  ADBannerContentSizeIdentifier320x50];
    adViewUnkeep.currentContentSizeIdentifier = ADBannerContentSizeIdentifier320x50;
    [self.view addSubview:adViewUnkeep];
    adViewUnkeep.delegate=self;
    self.bannerIsVisibleUnkeep=NO;

    
    
    [super viewDidLoad];
  }



- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if (!self.bannerIsVisibleUnkeep)
    {
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        // banner is invisible now and moved out of the screen on 50 px
        banner.frame = CGRectOffset(banner.frame, 0, 50);
        [UIView commitAnimations];
        self.bannerIsVisibleUnkeep = YES;
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if (self.bannerIsVisibleUnkeep)
    {
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        // banner is visible and we move it out of the screen, due to connection issue
        banner.frame = CGRectOffset(banner.frame, 0, -50);
        [UIView commitAnimations];
        self.bannerIsVisibleUnkeep = NO;
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


-(IBAction)hideupgradeView:(id)sender{
    upgradeView.hidden=YES;

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
//        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//        //  [self presentModalViewController:viewController animated:YES];
//        [self presentViewController:viewControllerOne animated:YES completion:nil];
        
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
