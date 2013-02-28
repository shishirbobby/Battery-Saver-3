//
//  BSViewController.m
//  Battery Saver
//
//  Created by Shishir Mishra on 16/12/12.
//  Copyright (c) 2012 Shishir Mishra. All rights reserved.
//

#import "BSViewController.h"
#import "BSMainViewController.h"
#import "BSMaintananceViewController.h"
#import "BSTipsViewController.h"

//#import "Facebook.h"
#import <Twitter/TWTweetComposeViewController.h>
#import <Accounts/Accounts.h>
#import "Social/Social.h"


@interface BSViewController ()

@end

@implementation BSViewController
@synthesize fbWebView;
@synthesize fbView;

@synthesize menuButtonMenu,mainButtonMenu,unkeepButtonMenu,tipsButtonMenu;


BSViewController *viewController;
BSMainViewController* viewControllerOne;
BSMaintananceViewController* viewControllerTwo;
BSTipsViewController* viewControllerThree;

- (void)viewDidLoad
{
    [adViewMenu setDelegate:self];
    
    adViewMenu = [[ADBannerView alloc] initWithFrame:CGRectZero];
    adViewMenu.frame = CGRectOffset(adViewMenu.frame, 0, -50);
    adViewMenu.requiredContentSizeIdentifiers = [NSSet setWithObject:  ADBannerContentSizeIdentifier320x50];
    adViewMenu.currentContentSizeIdentifier = ADBannerContentSizeIdentifier320x50;
    [self.view addSubview:adViewMenu];
    adViewMenu.delegate=self;
    self.bannerIsVisibleMenu=NO;
    

    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if (!self.bannerIsVisibleMenu)
    {
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        // banner is invisible now and moved out of the screen on 50 px
        banner.frame = CGRectOffset(banner.frame, 0, 50);
        [UIView commitAnimations];
        self.bannerIsVisibleMenu = YES;
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if (self.bannerIsVisibleMenu)
    {
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        // banner is visible and we move it out of the screen, due to connection issue
        banner.frame = CGRectOffset(banner.frame, 0, -50);
        [UIView commitAnimations];
        self.bannerIsVisibleMenu = NO;
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


-(IBAction)upGradeView:(id)sender{
    iAPView.hidden=NO;
}

-(IBAction)closeUpGradeView:(id)sender{
    iAPView.hidden=YES;
}
#pragma mark -
#pragma mark Facebook Method

-(IBAction)facebookMethod:(id)sender{
    SLComposeViewController *fbController=[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewControllerCompletionHandler __block completionHandler=^(SLComposeViewControllerResult result){
            
            [fbController dismissViewControllerAnimated:YES completion:nil];
            
            switch(result){
                case SLComposeViewControllerResultCancelled:
                default:
                {
                    NSLog(@"Cancelled.....");
                    
                }
                    break;
                case SLComposeViewControllerResultDone:
                {
                    NSLog(@"Posted....");
                }
                    break;
            }};
        
        [fbController addImage:[UIImage imageNamed:@"Icon@2x.png"]];
        [fbController setInitialText:@"Hey,Check new app Battery Saver."];
        [fbController addURL:[NSURL URLWithString:@"http://www.google.com"]];
        [fbController setCompletionHandler:completionHandler];
        [self presentViewController:fbController animated:YES completion:nil];
    }
    
    
}

-(IBAction)openFBCall:(id)sender{
    fbView.hidden=NO;
    NSString *urlAddress = @"http://www.facebook.com/freshcabbage?fref=ts";
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [fbWebView loadRequest:requestObj];
}

-(IBAction)closeWebView:(id)sender{
    fbView.hidden=YES;
}
#pragma mark -
#pragma mark Twitter Method

-(IBAction)twitterMethod:(id)sender{
    
    if([TWTweetComposeViewController canSendTweet]) {
            NSString *imageString;
        imageString = @"icon@2x.png";
        
        TWTweetComposeViewController *controller = [[TWTweetComposeViewController alloc] init];
        [controller setInitialText:@"Posting Tweet from 'Batter Saver' iOS app"];
        [controller addImage:[UIImage imageNamed:imageString]];
        
        
        controller.completionHandler = ^(TWTweetComposeViewControllerResult result)  {
            
            [self dismissModalViewControllerAnimated:YES];
            
            switch (result) {
                case TWTweetComposeViewControllerResultCancelled:
                    break;
                    
                case TWTweetComposeViewControllerResultDone:
                    break;
                    
                default:
                    break;
            }
        };
        
        [self presentModalViewController:controller animated:YES];
    }
    else{
        NSLog(@"please login in");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Battery Saver!", @"AlertView")
                                                            message:NSLocalizedString(@"You have not logged into Twitter", @"AlertView")
                                                           delegate:self
                                                  cancelButtonTitle:NSLocalizedString(@"Cancel", @"AlertView")
                                                  otherButtonTitles:NSLocalizedString(@"Open Twitter", @"AlertView"), nil];
        [alertView show];
        
        // [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs://Twitter"]];
    }
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=Twitter"]];
    }
}



-(IBAction)rateAppMethod:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://itunes.apple.com/by/app/gympush/id507726096?mt=8"]];
}

@end
