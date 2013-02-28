//
//  BSViewController.h
//  Battery Saver
//
//  Created by Shishir Mishra on 16/12/12.
//  Copyright (c) 2012 Shishir Mishra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
@interface BSViewController : UIViewController<ADBannerViewDelegate>
{
    ADBannerView *adViewMenu;
    BOOL bannerIsVisibleMenu;

    
    IBOutlet UIWebView *fbWebView;
    IBOutlet UIView *fbView;
    
    IBOutlet UIButton *menuButtonMenu;
    IBOutlet UIButton *mainButtonMenu;
    IBOutlet UIButton *unkeepButtonMenu;
    IBOutlet UIButton *tipsButtonMenu;
    
    IBOutlet UIView *iAPView;
    
}
@property (nonatomic,assign) BOOL bannerIsVisibleMenu;
@property(nonatomic,retain)    IBOutlet UIWebView *fbWebView;
@property(nonatomic,retain)    IBOutlet UIView *fbView;

@property(nonatomic,retain)IBOutlet UIButton *menuButtonMenu;
@property(nonatomic,retain)IBOutlet UIButton *mainButtonMenu;
@property(nonatomic,retain)IBOutlet UIButton *unkeepButtonMenu;
@property(nonatomic,retain)IBOutlet UIButton *tipsButtonMenu;

-(IBAction)menuCall:(id)sender;
-(IBAction)mainCall:(id)sender;
-(IBAction)maintenanceCall:(id)sender;
-(IBAction)tipsCall:(id)sender;

@end
