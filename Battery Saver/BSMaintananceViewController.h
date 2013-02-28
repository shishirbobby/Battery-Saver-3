//
//  BSMaintananceViewController.h
//  Battery Saver
//
//  Created by Shishir Mishra on 16/12/12.
//  Copyright (c) 2012 Shishir Mishra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
@interface BSMaintananceViewController : UIViewController<ADBannerViewDelegate>
{
    ADBannerView *adViewUnkeep;
    BOOL bannerIsVisibleUnkeep;
    
    IBOutlet UILabel *maintenancedeviceLabel;
    IBOutlet UILabel *numberOfDaysLabel;
    
    IBOutlet UIButton *menuButtonUnkeep;
    IBOutlet UIButton *mainButtonUnkeep;
    IBOutlet UIButton *unkeepButtonUnkeep;
    IBOutlet UIButton *tipsButtonUnkeep;
    
    IBOutlet UIImageView *BatteryLevelImageView;
    IBOutlet UIView *upgradeView;
}
@property (nonatomic,assign) BOOL bannerIsVisibleUnkeep;
@property(nonatomic,retain)    IBOutlet UILabel *maintenancedeviceLabel;
@property(nonatomic,retain)    IBOutlet UILabel *numberOfDaysLabel;

@property(nonatomic,retain)IBOutlet UIButton *menuButtonUnkeep;
@property(nonatomic,retain)IBOutlet UIButton *mainButtonUnkeep;
@property(nonatomic,retain)IBOutlet UIButton *unkeepButtonUnkeep;
@property(nonatomic,retain)IBOutlet UIButton *tipsButtonUnkeep;
@property(nonatomic,retain)IBOutlet UIImageView *BatteryLevelImageView;


-(IBAction)menuCall:(id)sender;
-(IBAction)mainCall:(id)sender;
-(IBAction)maintenanceCall:(id)sender;
-(IBAction)tipsCall:(id)sender;

@end
