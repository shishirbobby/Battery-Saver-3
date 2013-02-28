//
//  BSMainViewController.h
//  Battery Saver
//
//  Created by Shishir Mishra on 16/12/12.
//  Copyright (c) 2012 Shishir Mishra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface BSMainViewController : UIViewController<ADBannerViewDelegate>
{
    ADBannerView *adView;
    BOOL bannerIsVisible;
    
    IBOutlet UILabel *deviceLabel;
    IBOutlet UILabel *BCStatus;
    IBOutlet UILabel *batteryPercentage;
    
    IBOutlet UIButton *menuButtonMain;
    IBOutlet UIButton *mainButtonMain;
    IBOutlet UIButton *unkeepButtonMain;
    IBOutlet UIButton *tipsButtonMain;
    
    IBOutlet UILabel *gInternetLabel;
    IBOutlet UILabel *dGamingLabel;
    IBOutlet UILabel *gTalkTime;
    IBOutlet UILabel *wifiInternetLabel;
    IBOutlet UILabel *twoGTimeLabel;
    IBOutlet UILabel *standByLabel;
    IBOutlet UILabel *videoLabel;
    IBOutlet UILabel *audioLabel;
    
    
    IBOutlet UIImageView *mainBatteryImageView;
    IBOutlet UIImageView *OneImageView;
    IBOutlet UIImageView *TwoImageView;
    IBOutlet UIImageView *ThreeImageView;
    IBOutlet UIImageView *FourImageView;
    IBOutlet UIImageView *FiveImageView;
    IBOutlet UIImageView *SixImageView;
    IBOutlet UIImageView *SevenImageView;
    IBOutlet UIImageView *EightImageView;
    
    
    IBOutlet UIView * gInternetView;
    IBOutlet UIView * dGamingView;
    IBOutlet UIView * gTalkTimeView;
    IBOutlet UIView * wifiInternetView;
    IBOutlet UIView * twoGTimeView;
    IBOutlet UIView * standByView;
    IBOutlet UIView * videoView;
    IBOutlet UIView * audioView;

    
    
    IBOutlet UILabel *remainingLabel;
    NSTimer *theTimer;
    NSDate *targetDate;
    NSCalendar *cal;
        NSDateComponents *components;
}
@property(nonatomic,retain)    IBOutlet UILabel *remainingLabel;
@property(nonatomic,retain)    IBOutlet UILabel *gInternetLabel;
@property(nonatomic,retain)    IBOutlet UILabel *dGamingLabel;
@property(nonatomic,retain)    IBOutlet UILabel *gTalkTime;
@property(nonatomic,retain)    IBOutlet UILabel *wifiInternetLabel;
@property(nonatomic,retain)    IBOutlet UILabel *twoGTimeLabel;
@property(nonatomic,retain)    IBOutlet UILabel *standByLabel;
@property(nonatomic,retain)    IBOutlet UILabel *videoLabel;
@property(nonatomic,retain)    IBOutlet UILabel *audioLabel;

@property(nonatomic,retain)    IBOutlet UIImageView *mainBatteryImageView;
@property(nonatomic,retain)     IBOutlet UIImageView *OneImageView;
@property(nonatomic,retain)     IBOutlet UIImageView *TwoImageView;
@property(nonatomic,retain)     IBOutlet UIImageView *ThreeImageView;
@property(nonatomic,retain)     IBOutlet UIImageView *FourImageView;
@property(nonatomic,retain)     IBOutlet UIImageView *FiveImageView;
@property(nonatomic,retain)     IBOutlet UIImageView *SixImageView;
@property(nonatomic,retain)     IBOutlet UIImageView *SevenImageView;
@property(nonatomic,retain)     IBOutlet UIImageView *EightImageView;




@property (nonatomic,assign) BOOL bannerIsVisible;
@property(nonatomic,retain)    IBOutlet UILabel *deviceLabel;
@property(nonatomic,retain)    IBOutlet UILabel *BCStatus;
@property(nonatomic,retain)    IBOutlet UILabel *batteryPercentage;

@property(nonatomic,retain)IBOutlet UIButton *menuButtonMain;
@property(nonatomic,retain)IBOutlet UIButton *mainButtonMain;
@property(nonatomic,retain)IBOutlet UIButton *unkeepButtonMain;
@property(nonatomic,retain)IBOutlet UIButton *tipsButtonMain;

-(IBAction)menuCall:(id)sender;
-(IBAction)mainCall:(id)sender;
-(IBAction)maintenanceCall:(id)sender;
-(IBAction)tipsCall:(id)sender;

@end
