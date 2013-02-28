//
//  BSTipsViewController.h
//  Battery Saver
//
//  Created by Shishir Mishra on 16/12/12.
//  Copyright (c) 2012 Shishir Mishra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import "BSAppDelegate.h"

@interface BSTipsViewController : UIViewController<ADBannerViewDelegate>
{
    BSAppDelegate *delegate;
    
    ADBannerView *adViewTips;
    BOOL bannerIsVisibleTips;

    IBOutlet UIView *nagView;
    IBOutlet UIView *freeTipView;
    IBOutlet UILabel *tipsDeviceLabel;
    IBOutlet UIScrollView *scrollView;
}
@property (nonatomic,assign) BOOL bannerIsVisibleTips;

@property(nonatomic,retain) IBOutlet UILabel *tipsDeviceLabel;
@property(nonatomic,retain) IBOutlet UIScrollView *scrollView;
@property(nonatomic,retain) IBOutlet UIView *nagView;
@property(nonatomic,retain) IBOutlet UIView *freeTipView;
-(IBAction)menuCall:(id)sender;
-(IBAction)mainCall:(id)sender;
-(IBAction)maintenanceCall:(id)sender;
-(IBAction)tipsCall:(id)sender;

@end
