//
//  BSMainViewController.m
//  Battery Saver
//
//  Created by Shishir Mishra on 16/12/12.
//  Copyright (c) 2012 Shishir Mishra. All rights reserved.
//

#import "BSMainViewController.h"
#import "BSViewController.h"

#import "BSMaintananceViewController.h"
#import "BSTipsViewController.h"

@interface BSMainViewController ()

@end

@implementation BSMainViewController
BSViewController *viewController;
BSMainViewController* viewControllerOne;
BSMaintananceViewController* viewControllerTwo;
BSTipsViewController* viewControllerThree;

@synthesize  gInternetLabel,dGamingLabel,gTalkTime,wifiInternetLabel,twoGTimeLabel,standByLabel,videoLabel,audioLabel;
@synthesize OneImageView,TwoImageView,ThreeImageView,FourImageView,FiveImageView,SixImageView,SevenImageView,EightImageView;
@synthesize mainBatteryImageView;
@synthesize remainingLabel;
int batinfo;
float prevBatteryLev;
NSDate *startDate;

@synthesize deviceLabel;
@synthesize BCStatus;
@synthesize batteryPercentage;


@synthesize menuButtonMain,mainButtonMain,unkeepButtonMain,tipsButtonMain;

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
    
    [adView setDelegate:self];
    
    adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
    adView.frame = CGRectOffset(adView.frame, 0, -50);
    adView.requiredContentSizeIdentifiers = [NSSet setWithObject:  ADBannerContentSizeIdentifier320x50];
    adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifier320x50;
    [self.view addSubview:adView];
    adView.delegate=self;
    self.bannerIsVisible=YES;

    [super viewDidLoad];
   
    UIDevice *currentDevice = [UIDevice currentDevice];
    NSString *model = [currentDevice model];
    NSString *systemVersion = [currentDevice systemVersion];
    
    
    NSLog(@"model %@",model);
    NSLog(@"systemVersion %@",systemVersion);
    deviceLabel.text=[NSString stringWithFormat:@"Your Device : %@",model];

    // Do any additional setup after loading the view from its nib.
//    [self update];
    [NSTimer scheduledTimerWithTimeInterval:0.1f
                                     target:self
                                   selector:@selector(update)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if (!self.bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        // banner is invisible now and moved out of the screen on 50 px
        banner.frame = CGRectOffset(banner.frame, 0, 50);
        [UIView commitAnimations];
        self.bannerIsVisible = YES;
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if (self.bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        // banner is visible and we move it out of the screen, due to connection issue
        banner.frame = CGRectOffset(banner.frame, 0, -50);
        [UIView commitAnimations];
        self.bannerIsVisible = NO;
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


-(void)iPhone5Call{


#pragma mark
#pragma mark iPhone 5
        NSLog(@"iPhone 5 Called");
    //----------------------3G Internet iPhone 5----------------//
    int minutes_3gInternet_iPhone5 = 480;//minutes of 8 hour (static)
    
    int gInternet_iPhone5=(minutes_3gInternet_iPhone5*batinfo)/100;
    int hour_3gInternet_iPhone5 = gInternet_iPhone5/60;
    int min_3gInternet_iPhone5 = gInternet_iPhone5%60;
    
    NSLog(@"3G internet time :  %d:%d",hour_3gInternet_iPhone5, min_3gInternet_iPhone5);
    gInternetLabel.text = [NSString stringWithFormat:@"%d:%d",hour_3gInternet_iPhone5, min_3gInternet_iPhone5 ];
    deviceLabel.text=[NSString stringWithFormat:@"Your Device : iPhone 5"];
    UIImage *hour3gInternet;
    UIImage *hour3Gtalktime;
    UIImage *hour3dGameing;
    UIImage *hourVideo;
    UIImage *hourwifi;
    UIImage *hourTwoGTalkTime;
    UIImage *hourstandby;
    UIImage *houraudio;
    
//    hour_3gInternet_iPhone5=10;
    
    if (hour_3gInternet_iPhone5 == 0) {
        hour3gInternet = [UIImage imageNamed:@"pin-0.png"];
        [OneImageView setImage:hour3gInternet];
    }
    else if (hour_3gInternet_iPhone5 ==1) {
        hour3gInternet = [UIImage imageNamed:@"pin-10.png"];
        [OneImageView setImage:hour3gInternet];
    }
    else if (hour_3gInternet_iPhone5 ==2) {
        hour3gInternet = [UIImage imageNamed:@"pin-20.png"];
        [OneImageView setImage:hour3gInternet];
    }
    else if (hour_3gInternet_iPhone5 ==3) {
        hour3gInternet = [UIImage imageNamed:@"pin-30.png"];
        [OneImageView setImage:hour3gInternet];
    }
    else if (hour_3gInternet_iPhone5 ==4) {
        hour3gInternet = [UIImage imageNamed:@"pin-40.png"];
        [OneImageView setImage:hour3gInternet];
    }
    else if (hour_3gInternet_iPhone5 ==5) {
        hour3gInternet = [UIImage imageNamed:@"pin-50.png"];
        [OneImageView setImage:hour3gInternet];
    }
    else if (hour_3gInternet_iPhone5 ==6) {
        hour3gInternet = [UIImage imageNamed:@"pin-60.png"];
        [OneImageView setImage:hour3gInternet];
    }
    else if (hour_3gInternet_iPhone5 ==7 ) {
        hour3gInternet = [UIImage imageNamed:@"pin-70.png"];
        [OneImageView setImage:hour3gInternet];
    }
    else if (hour_3gInternet_iPhone5 ==8 ) {
        hour3gInternet = [UIImage imageNamed:@"pin-80.png"];
        [OneImageView setImage:hour3gInternet];
    }
    else if (hour_3gInternet_iPhone5 ==9 ){
        hour3gInternet = [UIImage imageNamed:@"pin-90.png"];
        [OneImageView setImage:hour3gInternet];
    }
    else if (hour_3gInternet_iPhone5 >=10 ){
        hour3gInternet = [UIImage imageNamed:@"pin-100.png"];
        [OneImageView setImage:hour3gInternet];
    }
    
    
    
    //----------------------3D Games iPhone 5----------------//
    int minutes_games_iPhone5 = 600;//minutes of 10 hour (static)
    
    int games_iPhone5=(minutes_games_iPhone5*batinfo)/100;
    int hour_game_iPhone5 = games_iPhone5/60;
    int min_game_iPhone5 = games_iPhone5%60;
    
    NSLog(@"3d Game Hours :  %d:%d",hour_game_iPhone5, min_game_iPhone5);
    dGamingLabel.text = [NSString stringWithFormat:@"%d:%d",hour_game_iPhone5, min_game_iPhone5 ];
    
 //   hour_game_iPhone5=5;
    if (hour_game_iPhone5 == 0) {
        hour3dGameing = [UIImage imageNamed:@"pin-0.png"];
        [TwoImageView setImage:hour3dGameing];
    }
    else if (hour_game_iPhone5 ==1) {
        hour3dGameing = [UIImage imageNamed:@"pin-10.png"];
        [TwoImageView setImage:hour3dGameing];
    }
    else if (hour_game_iPhone5 ==2) {
        hour3dGameing = [UIImage imageNamed:@"pin-20.png"];
        [TwoImageView setImage:hour3dGameing];
    }
    else if (hour_game_iPhone5 ==3) {
        hour3dGameing = [UIImage imageNamed:@"pin-30.png"];
        [TwoImageView setImage:hour3dGameing];
    }
    else if (hour_game_iPhone5 ==4) {
        hour3dGameing = [UIImage imageNamed:@"pin-40.png"];
        [TwoImageView setImage:hour3dGameing];
    }
    else if (hour_game_iPhone5 ==5) {
        hour3dGameing = [UIImage imageNamed:@"pin-50.png"];
        [TwoImageView setImage:hour3dGameing];
    }
    else if (hour_game_iPhone5 ==6) {
        hour3dGameing = [UIImage imageNamed:@"pin-60.png"];
        [TwoImageView setImage:hour3dGameing];
    }
    else if (hour_game_iPhone5 ==7 ) {
        hour3dGameing = [UIImage imageNamed:@"pin-70.png"];
        [TwoImageView setImage:hour3dGameing];
    }
    else if (hour_game_iPhone5 ==8 ) {
        hour3dGameing = [UIImage imageNamed:@"pin-80.png"];
        [TwoImageView setImage:hour3dGameing];
    }
    else if (hour_game_iPhone5 ==9 ){
        hour3dGameing = [UIImage imageNamed:@"pin-90.png"];
        [TwoImageView setImage:hour3dGameing];
    }
    else if (hour_game_iPhone5 >=10 ){
        hour3dGameing = [UIImage imageNamed:@"pin-100.png"];
        [TwoImageView setImage:hour3dGameing];
    }
    
    
    
    
    
    //----------------------3G Talk time iPhone 5----------------//
    int minutes3G_iPhone5 = 480;//minutes of 8 hour (static)
    int talk3G_iPhone5=(minutes3G_iPhone5*batinfo)/100;
    int hour3g_iPhone5 = talk3G_iPhone5/60;
    int min3g_iPhone5 = talk3G_iPhone5%60;
    
    NSLog(@"this is  : %d", hour3g_iPhone5%100);
    
    NSLog(@"talk time :  %d:%d",hour3g_iPhone5, min3g_iPhone5);
    gTalkTime.text = [NSString stringWithFormat:@"%d:%d",hour3g_iPhone5, min3g_iPhone5 ];
    
    if (hour3g_iPhone5 == 0) {
        hour3Gtalktime = [UIImage imageNamed:@"pin-0.png"];
        [ThreeImageView setImage:hour3Gtalktime];
    }
    else if (hour3g_iPhone5 ==1) {
        hour3Gtalktime = [UIImage imageNamed:@"pin-10.png"];
        [ThreeImageView setImage:hour3Gtalktime];
    }
    else if (hour3g_iPhone5 ==2) {
        hour3Gtalktime = [UIImage imageNamed:@"pin-20.png"];
        [ThreeImageView setImage:hour3Gtalktime];
    }
    else if (hour3g_iPhone5 ==3) {
        hour3Gtalktime = [UIImage imageNamed:@"pin-30.png"];
        [ThreeImageView setImage:hour3Gtalktime];
    }
    else if (hour3g_iPhone5 ==4) {
        hour3Gtalktime = [UIImage imageNamed:@"pin-40.png"];
        [ThreeImageView setImage:hour3Gtalktime];
    }
    else if (hour3g_iPhone5 ==5) {
        hour3Gtalktime = [UIImage imageNamed:@"pin-50.png"];
        [ThreeImageView setImage:hour3Gtalktime];
    }
    else if (hour3g_iPhone5 ==6) {
        hour3Gtalktime = [UIImage imageNamed:@"pin-60.png"];
        [ThreeImageView setImage:hour3Gtalktime];
    }
    else if (hour3g_iPhone5 ==7 ) {
        hour3Gtalktime = [UIImage imageNamed:@"pin-70.png"];
        [ThreeImageView setImage:hour3Gtalktime];
    }
    else if (hour3g_iPhone5 ==8 ) {
        hour3Gtalktime = [UIImage imageNamed:@"pin-80.png"];
        [ThreeImageView setImage:hour3Gtalktime];
    }
    else if (hour3g_iPhone5 ==9 ){
        hour3Gtalktime = [UIImage imageNamed:@"pin-90.png"];
        [ThreeImageView setImage:hour3Gtalktime];
    }
    else if (hour3g_iPhone5 >=10 ){
        hour3Gtalktime = [UIImage imageNamed:@"pin-100.png"];
        [ThreeImageView setImage:hour3Gtalktime];
    }
    
    
    //----------------------Video Playback iPhone 5----------------//
    int minutes_video_iPhone5 = 600;//minutes of 10 hour (static)
    
    int video_iPhone5=(minutes_video_iPhone5*batinfo)/100;
    int hour_video_iPhone5 = video_iPhone5/60;
    int min_video_iPhone5 = video_iPhone5%60;
    
    NSLog(@"Video time :  %d:%d",hour_video_iPhone5, min_video_iPhone5);
    videoLabel.text = [NSString stringWithFormat:@"%d:%d",hour_video_iPhone5, min_video_iPhone5 ];
    
    if (hour_video_iPhone5 == 0) {
        hourVideo = [UIImage imageNamed:@"pin-0.png"];
        [FourImageView setImage:hourVideo];
    }
    else if (hour_video_iPhone5 ==1) {
        hourVideo = [UIImage imageNamed:@"pin-10.png"];
        [FourImageView setImage:hourVideo];
    }
    else if (hour_video_iPhone5 ==2) {
        hourVideo = [UIImage imageNamed:@"pin-20.png"];
        [FourImageView setImage:hourVideo];
    }
    else if (hour_video_iPhone5 ==3) {
        hourVideo = [UIImage imageNamed:@"pin-30.png"];
        [FourImageView setImage:hourVideo];
    }
    else if (hour_video_iPhone5 ==4) {
        hourVideo = [UIImage imageNamed:@"pin-40.png"];
        [FourImageView setImage:hourVideo];
    }
    else if (hour_video_iPhone5 ==5) {
        hourVideo = [UIImage imageNamed:@"pin-50.png"];
        [FourImageView setImage:hourVideo];
    }
    else if (hour_video_iPhone5 ==6) {
        hourVideo = [UIImage imageNamed:@"pin-60.png"];
        [FourImageView setImage:hourVideo];
    }
    else if (hour_video_iPhone5 ==7 ) {
        hourVideo = [UIImage imageNamed:@"pin-70.png"];
        [FourImageView setImage:hourVideo];
    }
    else if (hour_video_iPhone5 ==8 ) {
        hourVideo = [UIImage imageNamed:@"pin-80.png"];
        [FourImageView setImage:hourVideo];
    }
    else if (hour_video_iPhone5 ==9 ){
        hourVideo = [UIImage imageNamed:@"pin-90.png"];
        [FourImageView setImage:hourVideo];
    }
    else if (hour_video_iPhone5 >=10 ){
        hourVideo = [UIImage imageNamed:@"pin-100.png"];
        [FourImageView setImage:hourVideo];
    }
    
    
    //----------------------wifi iPhone 5----------------//
    int minutes_wifi_iPhone5 = 600;//minutes of 10 hour (static)
    
    int wifi_iPhone5=(minutes_wifi_iPhone5*batinfo)/100;
    int hour_wifi_iPhone5 = wifi_iPhone5/60;
    int min_wifi_iPhone5 = wifi_iPhone5%60;
    
    NSLog(@"wifi time :  %d:%d",hour_wifi_iPhone5, min_wifi_iPhone5);
    wifiInternetLabel.text = [NSString stringWithFormat:@"%d:%d",hour_wifi_iPhone5, min_wifi_iPhone5 ];
    if (hour_wifi_iPhone5 == 0) {
        hourwifi = [UIImage imageNamed:@"pin-0.png"];
        [FiveImageView setImage:hourwifi];
    }
    else if (hour_wifi_iPhone5 ==1) {
        hourwifi = [UIImage imageNamed:@"pin-10.png"];
        [FiveImageView setImage:hourwifi];
    }
    else if (hour_wifi_iPhone5 ==2) {
        hourwifi = [UIImage imageNamed:@"pin-20.png"];
        [FiveImageView setImage:hourwifi];
    }
    else if (hour_wifi_iPhone5 ==3) {
        hourwifi = [UIImage imageNamed:@"pin-30.png"];
        [FiveImageView setImage:hourwifi];
    }
    else if (hour_wifi_iPhone5 ==4) {
        hourwifi = [UIImage imageNamed:@"pin-40.png"];
        [FiveImageView setImage:hourwifi];
    }
    else if (hour_wifi_iPhone5 ==5) {
        hourwifi = [UIImage imageNamed:@"pin-50.png"];
        [FiveImageView setImage:hourwifi];
    }
    else if (hour_wifi_iPhone5 ==6) {
        hourwifi = [UIImage imageNamed:@"pin-60.png"];
        [FiveImageView setImage:hourwifi];
    }
    else if (hour_wifi_iPhone5 ==7 ) {
        hourwifi = [UIImage imageNamed:@"pin-70.png"];
        [FiveImageView setImage:hourwifi];
    }
    else if (hour_wifi_iPhone5 ==8 ) {
        hourwifi = [UIImage imageNamed:@"pin-80.png"];
        [FiveImageView setImage:hourwifi];
    }
    else if (hour_wifi_iPhone5 ==9 ){
        hourwifi = [UIImage imageNamed:@"pin-90.png"];
        [FiveImageView setImage:hourwifi];
    }
    else if (hour_wifi_iPhone5 >=10 ){
        hourwifi = [UIImage imageNamed:@"pin-100.png"];
        [FiveImageView setImage:hourwifi];
    }
    
    
    //----------------------2G talk time iPhone 5----------------//
    
    int minutes_2GTalkT_iPhone5 = 600;//minutes of 10 hour (static)
    
    int twoGTalkTime_iPhone5=(minutes_2GTalkT_iPhone5*batinfo)/100;
    int hour_twoGTalkTime_iPhone5 = twoGTalkTime_iPhone5/60;
    int min_twoGTalkTime_iPhone5 = twoGTalkTime_iPhone5%60;
    
    NSLog(@"standby Time :  %d:%d",hour_twoGTalkTime_iPhone5, min_twoGTalkTime_iPhone5);
    standByLabel.text = [NSString stringWithFormat:@"%d:%d",hour_twoGTalkTime_iPhone5, min_twoGTalkTime_iPhone5 ];
    
    if (hour_twoGTalkTime_iPhone5 == 0) {
        hourTwoGTalkTime = [UIImage imageNamed:@"pin-0.png"];
        [SixImageView setImage:hourTwoGTalkTime];
    }
    else if (hour_twoGTalkTime_iPhone5 ==1) {
        hourTwoGTalkTime = [UIImage imageNamed:@"pin-10.png"];
        [SixImageView setImage:hourTwoGTalkTime];
    }
    else if (hour_twoGTalkTime_iPhone5 ==2) {
        hourTwoGTalkTime = [UIImage imageNamed:@"pin-20.png"];
        [SixImageView setImage:hourTwoGTalkTime];
    }
    else if (hour_twoGTalkTime_iPhone5 ==3) {
        hourTwoGTalkTime = [UIImage imageNamed:@"pin-30.png"];
        [SixImageView setImage:hourTwoGTalkTime];
    }
    else if (hour_twoGTalkTime_iPhone5 ==4) {
        hourTwoGTalkTime = [UIImage imageNamed:@"pin-40.png"];
        [SixImageView setImage:hourTwoGTalkTime];
    }
    else if (hour_twoGTalkTime_iPhone5 ==5) {
        hourTwoGTalkTime = [UIImage imageNamed:@"pin-50.png"];
        [SixImageView setImage:hourTwoGTalkTime];
    }
    else if (hour_twoGTalkTime_iPhone5 ==6) {
        hourTwoGTalkTime = [UIImage imageNamed:@"pin-60.png"];
        [SixImageView setImage:hourTwoGTalkTime];
    }
    else if (hour_twoGTalkTime_iPhone5 ==7 ) {
        hourTwoGTalkTime = [UIImage imageNamed:@"pin-70.png"];
        [SixImageView setImage:hourTwoGTalkTime];
    }
    else if (hour_twoGTalkTime_iPhone5 ==8 ) {
        hourTwoGTalkTime = [UIImage imageNamed:@"pin-80.png"];
        [SixImageView setImage:hourTwoGTalkTime];
    }
    else if (hour_twoGTalkTime_iPhone5 ==9 ){
        hourTwoGTalkTime = [UIImage imageNamed:@"pin-90.png"];
        [SixImageView setImage:hourTwoGTalkTime];
    }
    else if (hour_twoGTalkTime_iPhone5 >=10 ){
        hourTwoGTalkTime = [UIImage imageNamed:@"pin-100.png"];
        [SixImageView setImage:hourTwoGTalkTime];
    }
    
    
    
    
    //----------------------Standby time iPhone 5----------------//
    int minutes_standby_iPhone5 = 13500;//minutes of 225 hour (static)
    
    int standby_iPhone5=(minutes_standby_iPhone5*batinfo)/100;
    int hour_standby_iPhone5 = standby_iPhone5/60;
    int min_standby_iPhone5 = standby_iPhone5%60;
    
    NSLog(@"standby Time :  %d:%d",hour_standby_iPhone5, min_standby_iPhone5);
    standByLabel.text = [NSString stringWithFormat:@"%d:%d",hour_standby_iPhone5, min_standby_iPhone5 ];
   

    if (hour_standby_iPhone5 <= 0 && hour_standby_iPhone5 <= 20) {
        hourstandby = [UIImage imageNamed:@"pin-0.png"];
        [SevenImageView setImage:hourstandby];
    }
    else if (hour_standby_iPhone5 >= 16 && hour_standby_iPhone5 <= 40) {
        hourstandby = [UIImage imageNamed:@"pin-10.png"];
        [SevenImageView setImage:hourstandby];
    }
    else if (hour_standby_iPhone5 >= 41 && hour_standby_iPhone5 <= 60 ) {
        hourstandby = [UIImage imageNamed:@"pin-20.png"];
        [SevenImageView setImage:hourstandby];
    }
    else if (hour_standby_iPhone5 >= 61 && hour_standby_iPhone5 <= 80) {
        hourstandby = [UIImage imageNamed:@"pin-30.png"];
        [SevenImageView setImage:hourstandby];
    }
    else if (hour_standby_iPhone5 >= 81 && hour_standby_iPhone5 <= 100) {
        hourstandby = [UIImage imageNamed:@"pin-40.png"];
        [SevenImageView setImage:hourstandby];
    }
    else if (hour_standby_iPhone5 >= 101 && hour_standby_iPhone5 <= 120) {
        hourstandby = [UIImage imageNamed:@"pin-50.png"];
        [SevenImageView setImage:hourstandby];
    }
    else if (hour_standby_iPhone5 >= 121 && hour_standby_iPhone5 <= 140) {
        hourstandby = [UIImage imageNamed:@"pin-60.png"];
        [SevenImageView setImage:hourstandby];
    }
    else if (hour_standby_iPhone5 >= 141 && hour_standby_iPhone5 <= 160 ) {
        hourstandby = [UIImage imageNamed:@"pin-70.png"];
        [SevenImageView setImage:hourstandby];
    }
    else if (hour_standby_iPhone5 >= 161 && hour_standby_iPhone5 <= 180 ) {
        hourstandby = [UIImage imageNamed:@"pin-80.png"];
        [SevenImageView setImage:hourstandby];
    }
    else if (hour_standby_iPhone5 >= 181 && hour_standby_iPhone5 <= 200 ){
        hourstandby = [UIImage imageNamed:@"pin-90.png"];
        [SevenImageView setImage:hourstandby];
    }
    else if (hour_standby_iPhone5 >=200 ){
        hourstandby = [UIImage imageNamed:@"pin-100.png"];
        [SevenImageView setImage:hourstandby];
    }
    
    
    
    
    
    //----------------------Audio Playback iPhone 5----------------//
    int minutes_audio_iPhone5 = 2400;//minutes of 40 hour (static)
    
    int audio_iPhone5=(minutes_audio_iPhone5*batinfo)/100;
    int hour_audio_iPhone5 = audio_iPhone5/60;
    int min_audio_iPhone5 = audio_iPhone5%60;
    
    NSLog(@"Audio time :  %d:%d",hour_audio_iPhone5, min_audio_iPhone5);
    audioLabel.text = [NSString stringWithFormat:@"%d:%d",hour_audio_iPhone5, min_audio_iPhone5 ];
    
    if (hour_3gInternet_iPhone5 == 0) {
        houraudio = [UIImage imageNamed:@"pin-0.png"];
        [EightImageView setImage:houraudio];
    }
    else if (hour_3gInternet_iPhone5 ==1) {
        houraudio = [UIImage imageNamed:@"pin-10.png"];
        [EightImageView setImage:houraudio];
    }
    else if (hour_3gInternet_iPhone5 ==2) {
        houraudio = [UIImage imageNamed:@"pin-20.png"];
        [EightImageView setImage:houraudio];
    }
    else if (hour_3gInternet_iPhone5 ==3) {
        houraudio = [UIImage imageNamed:@"pin-30.png"];
        [EightImageView setImage:houraudio];
    }
    else if (hour_3gInternet_iPhone5 ==4) {
        houraudio = [UIImage imageNamed:@"pin-40.png"];
        [EightImageView setImage:houraudio];
    }
    else if (hour_3gInternet_iPhone5 ==5) {
        houraudio = [UIImage imageNamed:@"pin-50.png"];
        [EightImageView setImage:houraudio];
    }
    else if (hour_3gInternet_iPhone5 ==6) {
        houraudio = [UIImage imageNamed:@"pin-60.png"];
        [EightImageView setImage:houraudio];
    }
    else if (hour_3gInternet_iPhone5 ==7 ) {
        houraudio = [UIImage imageNamed:@"pin-70.png"];
        [EightImageView setImage:houraudio];
    }
    else if (hour_3gInternet_iPhone5 ==8 ) {
        houraudio = [UIImage imageNamed:@"pin-80.png"];
        [EightImageView setImage:houraudio];
    }
    else if (hour_3gInternet_iPhone5 ==9 ){
        houraudio = [UIImage imageNamed:@"pin-90.png"];
        [EightImageView setImage:houraudio];
    }
    else if (hour_3gInternet_iPhone5 >=10 ){
        houraudio = [UIImage imageNamed:@"pin-100.png"];
        [EightImageView setImage:houraudio];
    }
    

}
-(void)iPhone4SCall{
#pragma mark
#pragma mark iPhone 4S
    NSLog(@"iPhone 4S Called");
    //----------------------3G Internet iPhone 4S----------------//
    int minutes_3gInternet_iPhone4S = 360;//minutes of 6 hour (static)
    
    int gInternet_iPhone4S=(minutes_3gInternet_iPhone4S*batinfo)/100;
    int hour_3gInternet_iPhone4S = gInternet_iPhone4S/60;
    int min_3gInternet_iPhone4S = gInternet_iPhone4S%60;
    
    NSLog(@"3G internet time :  %d:%d",hour_3gInternet_iPhone4S, min_3gInternet_iPhone4S);
    gInternetLabel.text = [NSString stringWithFormat:@"%d:%d",hour_3gInternet_iPhone4S, min_3gInternet_iPhone4S ];
    deviceLabel.text=[NSString stringWithFormat:@"Your Device : iPhone 2S"];
    UIImage *hour3gInternet4S;
    UIImage *hour3Gtalktime4S;
    UIImage *hour3dGameing4S;
    UIImage *hourVideo4S;
    UIImage *hourwifi4S;
    UIImage *hourTwoGTalkTime4S;
    UIImage *hourstandby4S;
    UIImage *houraudio4S;
    
    if (hour_3gInternet_iPhone4S == 0) {
        hour3gInternet4S = [UIImage imageNamed:@"pin-0.png"];
        [OneImageView setImage:hour3gInternet4S];
    }
    else if (hour_3gInternet_iPhone4S ==1) {
        hour3gInternet4S = [UIImage imageNamed:@"pin-10.png"];
        [OneImageView setImage:hour3gInternet4S];
    }
    else if (hour_3gInternet_iPhone4S ==2) {
        hour3gInternet4S = [UIImage imageNamed:@"pin-20.png"];
        [OneImageView setImage:hour3gInternet4S];
    }
    else if (hour_3gInternet_iPhone4S ==3) {
        hour3gInternet4S = [UIImage imageNamed:@"pin-30.png"];
        [OneImageView setImage:hour3gInternet4S];
    }
    else if (hour_3gInternet_iPhone4S ==4) {
        hour3gInternet4S = [UIImage imageNamed:@"pin-40.png"];
        [OneImageView setImage:hour3gInternet4S];
    }
    else if (hour_3gInternet_iPhone4S ==5) {
        hour3gInternet4S = [UIImage imageNamed:@"pin-50.png"];
        [OneImageView setImage:hour3gInternet4S];
    }
    else if (hour_3gInternet_iPhone4S ==6) {
        hour3gInternet4S = [UIImage imageNamed:@"pin-60.png"];
        [OneImageView setImage:hour3gInternet4S];
    }
    else if (hour_3gInternet_iPhone4S ==7 ) {
        hour3gInternet4S = [UIImage imageNamed:@"pin-70.png"];
        [OneImageView setImage:hour3gInternet4S];
    }
    else if (hour_3gInternet_iPhone4S ==8 ) {
        hour3gInternet4S = [UIImage imageNamed:@"pin-80.png"];
        [OneImageView setImage:hour3gInternet4S];
    }
    else if (hour_3gInternet_iPhone4S ==9 ){
        hour3gInternet4S = [UIImage imageNamed:@"pin-90.png"];
        [OneImageView setImage:hour3gInternet4S];
    }
    else if (hour_3gInternet_iPhone4S >=10 ){
        hour3gInternet4S = [UIImage imageNamed:@"pin-100.png"];
        [OneImageView setImage:hour3gInternet4S];
    }
    
    
    
    //----------------------3D Games iPhone 4S----------------//
    int minutes_games_iPhone4S = 480;//minutes of 8 hour (static)
    
    int games_iPhone4S=(minutes_games_iPhone4S*batinfo)/100;
    int hour_game_iPhone4S = games_iPhone4S/60;
    int min_game_iPhone4S = games_iPhone4S%60;
    
    NSLog(@"3d Game Hours :  %d:%d",hour_game_iPhone4S, min_game_iPhone4S);
    dGamingLabel.text = [NSString stringWithFormat:@"%d:%d",hour_game_iPhone4S, min_game_iPhone4S ];
    
    
    if (hour_game_iPhone4S == 0) {
        hour3dGameing4S = [UIImage imageNamed:@"pin-0.png"];
        [TwoImageView setImage:hour3dGameing4S];
    }
    else if (hour_game_iPhone4S ==1) {
        hour3dGameing4S = [UIImage imageNamed:@"pin-10.png"];
        [TwoImageView setImage:hour3dGameing4S];
    }
    else if (hour_game_iPhone4S ==2) {
        hour3dGameing4S = [UIImage imageNamed:@"pin-20.png"];
        [TwoImageView setImage:hour3dGameing4S];
    }
    else if (hour_game_iPhone4S ==3) {
        hour3dGameing4S = [UIImage imageNamed:@"pin-30.png"];
        [TwoImageView setImage:hour3dGameing4S];
    }
    else if (hour_game_iPhone4S ==4) {
        hour3dGameing4S = [UIImage imageNamed:@"pin-40.png"];
        [TwoImageView setImage:hour3dGameing4S];
    }
    else if (hour_game_iPhone4S ==5) {
        hour3dGameing4S = [UIImage imageNamed:@"pin-50.png"];
        [TwoImageView setImage:hour3dGameing4S];
    }
    else if (hour_game_iPhone4S ==6) {
        hour3dGameing4S = [UIImage imageNamed:@"pin-60.png"];
        [TwoImageView setImage:hour3dGameing4S];
    }
    else if (hour_game_iPhone4S ==7 ) {
        hour3dGameing4S = [UIImage imageNamed:@"pin-70.png"];
        [TwoImageView setImage:hour3dGameing4S];
    }
    else if (hour_game_iPhone4S ==8 ) {
        hour3dGameing4S = [UIImage imageNamed:@"pin-80.png"];
        [TwoImageView setImage:hour3dGameing4S];
    }
    else if (hour_game_iPhone4S ==9 ){
        hour3dGameing4S = [UIImage imageNamed:@"pin-90.png"];
        [TwoImageView setImage:hour3dGameing4S];
    }
    else if (hour_game_iPhone4S >=10 ){
        hour3dGameing4S = [UIImage imageNamed:@"pin-100.png"];
        [TwoImageView setImage:hour3dGameing4S];
    }
    
    
    
    
    
    //----------------------3G Talk time iPhone 4S----------------//
    int minutes3G_iPhone4S = 480;//minutes of 8 hour (static)
    int talk3G_iPhone4S=(minutes3G_iPhone4S*batinfo)/100;
    int hour3g_iPhone4S = talk3G_iPhone4S/60;
    int min3g_iPhone4S = talk3G_iPhone4S%60;
    
    NSLog(@"this is  : %d", hour3g_iPhone4S%100);
    
    NSLog(@"talk time :  %d:%d",hour3g_iPhone4S, min3g_iPhone4S);
    gTalkTime.text = [NSString stringWithFormat:@"%d:%d",hour3g_iPhone4S, min3g_iPhone4S ];
    
    if (hour3g_iPhone4S == 0) {
        hour3Gtalktime4S = [UIImage imageNamed:@"pin-0.png"];
        [ThreeImageView setImage:hour3Gtalktime4S];
    }
    else if (hour3g_iPhone4S ==1) {
        hour3Gtalktime4S = [UIImage imageNamed:@"pin-10.png"];
        [ThreeImageView setImage:hour3Gtalktime4S];
    }
    else if (hour3g_iPhone4S ==2) {
        hour3Gtalktime4S = [UIImage imageNamed:@"pin-20.png"];
        [ThreeImageView setImage:hour3Gtalktime4S];
    }
    else if (hour3g_iPhone4S ==3) {
        hour3Gtalktime4S = [UIImage imageNamed:@"pin-30.png"];
        [ThreeImageView setImage:hour3Gtalktime4S];
    }
    else if (hour3g_iPhone4S ==4) {
        hour3Gtalktime4S = [UIImage imageNamed:@"pin-40.png"];
        [ThreeImageView setImage:hour3Gtalktime4S];
    }
    else if (hour3g_iPhone4S ==5) {
        hour3Gtalktime4S = [UIImage imageNamed:@"pin-50.png"];
        [ThreeImageView setImage:hour3Gtalktime4S];
    }
    else if (hour3g_iPhone4S ==6) {
        hour3Gtalktime4S = [UIImage imageNamed:@"pin-60.png"];
        [ThreeImageView setImage:hour3Gtalktime4S];
    }
    else if (hour3g_iPhone4S ==7 ) {
        hour3Gtalktime4S = [UIImage imageNamed:@"pin-70.png"];
        [ThreeImageView setImage:hour3Gtalktime4S];
    }
    else if (hour3g_iPhone4S ==8 ) {
        hour3Gtalktime4S = [UIImage imageNamed:@"pin-80.png"];
        [ThreeImageView setImage:hour3Gtalktime4S];
    }
    else if (hour3g_iPhone4S ==9 ){
        hour3Gtalktime4S = [UIImage imageNamed:@"pin-90.png"];
        [ThreeImageView setImage:hour3Gtalktime4S];
    }
    else if (hour3g_iPhone4S >=10 ){
        hour3Gtalktime4S = [UIImage imageNamed:@"pin-100.png"];
        [ThreeImageView setImage:hour3Gtalktime4S];
    }
    
    
    //----------------------Video Playback iPhone 4S----------------//
    int minutes_video_iPhone4S = 600;//minutes of 10 hour (static)
    
    int video_iPhone4S=(minutes_video_iPhone4S*batinfo)/100;
    int hour_video_iPhone4S = video_iPhone4S/60;
    int min_video_iPhone4S = video_iPhone4S%60;
    
    NSLog(@"Video time :  %d:%d",hour_video_iPhone4S, min_video_iPhone4S);
    videoLabel.text = [NSString stringWithFormat:@"%d:%d",hour_video_iPhone4S, min_video_iPhone4S ];
    
    if (hour_video_iPhone4S == 0) {
        hourVideo4S = [UIImage imageNamed:@"pin-0.png"];
        [FourImageView setImage:hourVideo4S];
    }
    else if (hour_video_iPhone4S ==1) {
        hourVideo4S = [UIImage imageNamed:@"pin-10.png"];
        [FourImageView setImage:hourVideo4S];
    }
    else if (hour_video_iPhone4S ==2) {
        hourVideo4S = [UIImage imageNamed:@"pin-20.png"];
        [FourImageView setImage:hourVideo4S];
    }
    else if (hour_video_iPhone4S ==3) {
        hourVideo4S = [UIImage imageNamed:@"pin-30.png"];
        [FourImageView setImage:hourVideo4S];
    }
    else if (hour_video_iPhone4S ==4) {
        hourVideo4S = [UIImage imageNamed:@"pin-40.png"];
        [FourImageView setImage:hourVideo4S];
    }
    else if (hour_video_iPhone4S ==5) {
        hourVideo4S = [UIImage imageNamed:@"pin-50.png"];
        [FourImageView setImage:hourVideo4S];
    }
    else if (hour_video_iPhone4S ==6) {
        hourVideo4S = [UIImage imageNamed:@"pin-60.png"];
        [FourImageView setImage:hourVideo4S];
    }
    else if (hour_video_iPhone4S ==7 ) {
        hourVideo4S = [UIImage imageNamed:@"pin-70.png"];
        [FourImageView setImage:hourVideo4S];
    }
    else if (hour_video_iPhone4S ==8 ) {
        hourVideo4S = [UIImage imageNamed:@"pin-80.png"];
        [FourImageView setImage:hourVideo4S];
    }
    else if (hour_video_iPhone4S ==9 ){
        hourVideo4S = [UIImage imageNamed:@"pin-90.png"];
        [FourImageView setImage:hourVideo4S];
    }
    else if (hour_video_iPhone4S >=10 ){
        hourVideo4S = [UIImage imageNamed:@"pin-100.png"];
        [FourImageView setImage:hourVideo4S];
    }
    
    
    //----------------------wifi iPhone 4S----------------//
    int minutes_wifi_iPhone4S = 540;//minutes of 10 hour (static)
    
    int wifi_iPhone4S=(minutes_wifi_iPhone4S*batinfo)/100;
    int hour_wifi_iPhone4S = wifi_iPhone4S/60;
    int min_wifi_iPhone4S = wifi_iPhone4S%60;
    
    NSLog(@"wifi time :  %d:%d",hour_wifi_iPhone4S, min_wifi_iPhone4S);
    wifiInternetLabel.text = [NSString stringWithFormat:@"%d:%d",hour_wifi_iPhone4S, min_wifi_iPhone4S ];
    if (hour_wifi_iPhone4S == 0) {
        hourwifi4S = [UIImage imageNamed:@"pin-0.png"];
        [FiveImageView setImage:hourwifi4S];
    }
    else if (hour_wifi_iPhone4S ==1) {
        hourwifi4S = [UIImage imageNamed:@"pin-10.png"];
        [FiveImageView setImage:hourwifi4S];
    }
    else if (hour_wifi_iPhone4S ==2) {
        hourwifi4S = [UIImage imageNamed:@"pin-20.png"];
        [FiveImageView setImage:hourwifi4S];
    }
    else if (hour_wifi_iPhone4S ==3) {
        hourwifi4S = [UIImage imageNamed:@"pin-30.png"];
        [FiveImageView setImage:hourwifi4S];
    }
    else if (hour_wifi_iPhone4S ==4) {
        hourwifi4S = [UIImage imageNamed:@"pin-40.png"];
        [FiveImageView setImage:hourwifi4S];
    }
    else if (hour_wifi_iPhone4S ==5) {
        hourwifi4S = [UIImage imageNamed:@"pin-50.png"];
        [FiveImageView setImage:hourwifi4S];
    }
    else if (hour_wifi_iPhone4S ==6) {
        hourwifi4S = [UIImage imageNamed:@"pin-60.png"];
        [FiveImageView setImage:hourwifi4S];
    }
    else if (hour_wifi_iPhone4S ==7 ) {
        hourwifi4S = [UIImage imageNamed:@"pin-70.png"];
        [FiveImageView setImage:hourwifi4S];
    }
    else if (hour_wifi_iPhone4S ==8 ) {
        hourwifi4S = [UIImage imageNamed:@"pin-80.png"];
        [FiveImageView setImage:hourwifi4S];
    }
    else if (hour_wifi_iPhone4S ==9 ){
        hourwifi4S = [UIImage imageNamed:@"pin-90.png"];
        [FiveImageView setImage:hourwifi4S];
    }
    else if (hour_wifi_iPhone4S >=10 ){
        hourwifi4S = [UIImage imageNamed:@"pin-100.png"];
        [FiveImageView setImage:hourwifi4S];
    }
    
    
    //----------------------2G talk time iPhone 4S----------------//
    
    int minutes_2GTalkT_iPhone4S = 840;//minutes of 10 hour (static)
    
    int twoGTalkTime_iPhone4S=(minutes_2GTalkT_iPhone4S*batinfo)/100;
    int hour_twoGTalkTime_iPhone4S = twoGTalkTime_iPhone4S/60;
    int min_twoGTalkTime_iPhone4S = twoGTalkTime_iPhone4S%60;
    
    NSLog(@"standby Time :  %d:%d",hour_twoGTalkTime_iPhone4S, min_twoGTalkTime_iPhone4S);
    standByLabel.text = [NSString stringWithFormat:@"%d:%d",hour_twoGTalkTime_iPhone4S, min_twoGTalkTime_iPhone4S ];
    
    if (hour_twoGTalkTime_iPhone4S == 0) {
        hourTwoGTalkTime4S = [UIImage imageNamed:@"pin-0.png"];
        [SixImageView setImage:hourTwoGTalkTime4S];
    }
    else if (hour_twoGTalkTime_iPhone4S ==1) {
        hourTwoGTalkTime4S = [UIImage imageNamed:@"pin-10.png"];
        [SixImageView setImage:hourTwoGTalkTime4S];
    }
    else if (hour_twoGTalkTime_iPhone4S ==2) {
        hourTwoGTalkTime4S = [UIImage imageNamed:@"pin-20.png"];
        [SixImageView setImage:hourTwoGTalkTime4S];
    }
    else if (hour_twoGTalkTime_iPhone4S ==3) {
        hourTwoGTalkTime4S = [UIImage imageNamed:@"pin-30.png"];
        [SixImageView setImage:hourTwoGTalkTime4S];
    }
    else if (hour_twoGTalkTime_iPhone4S ==4) {
        hourTwoGTalkTime4S = [UIImage imageNamed:@"pin-40.png"];
        [SixImageView setImage:hourTwoGTalkTime4S];
    }
    else if (hour_twoGTalkTime_iPhone4S ==5) {
        hourTwoGTalkTime4S = [UIImage imageNamed:@"pin-50.png"];
        [SixImageView setImage:hourTwoGTalkTime4S];
    }
    else if (hour_twoGTalkTime_iPhone4S ==6) {
        hourTwoGTalkTime4S = [UIImage imageNamed:@"pin-60.png"];
        [SixImageView setImage:hourTwoGTalkTime4S];
    }
    else if (hour_twoGTalkTime_iPhone4S ==7 ) {
        hourTwoGTalkTime4S = [UIImage imageNamed:@"pin-70.png"];
        [SixImageView setImage:hourTwoGTalkTime4S];
    }
    else if (hour_twoGTalkTime_iPhone4S ==8 ) {
        hourTwoGTalkTime4S = [UIImage imageNamed:@"pin-80.png"];
        [SixImageView setImage:hourTwoGTalkTime4S];
    }
    else if (hour_twoGTalkTime_iPhone4S ==9 ){
        hourTwoGTalkTime4S = [UIImage imageNamed:@"pin-90.png"];
        [SixImageView setImage:hourTwoGTalkTime4S];
    }
    else if (hour_twoGTalkTime_iPhone4S >=10 ){
        hourTwoGTalkTime4S = [UIImage imageNamed:@"pin-100.png"];
        [SixImageView setImage:hourTwoGTalkTime4S];
    }
    
    
    
    
    //----------------------Standby time iPhone 4S----------------//
    int minutes_standby_iPhone4S = 12000;//minutes of 225 hour (static)
    
    int standby_iPhone4S=(minutes_standby_iPhone4S*batinfo)/100;
    int hour_standby_iPhone4S = standby_iPhone4S/60;
    int min_standby_iPhone4S = standby_iPhone4S%60;
    
    NSLog(@"standby Time :  %d:%d",hour_standby_iPhone4S, min_standby_iPhone4S);
    standByLabel.text = [NSString stringWithFormat:@"%d:%d",hour_standby_iPhone4S, min_standby_iPhone4S ];
    if (hour_standby_iPhone4S <= 0 && hour_standby_iPhone4S <= 20) {
        hourstandby4S = [UIImage imageNamed:@"pin-0.png"];
        [SevenImageView setImage:hourstandby4S];
    }
    else if (hour_standby_iPhone4S >= 16 && hour_standby_iPhone4S <= 40) {
        hourstandby4S = [UIImage imageNamed:@"pin-10.png"];
        [SevenImageView setImage:hourstandby4S];
    }
    else if (hour_standby_iPhone4S >= 41 && hour_standby_iPhone4S <= 60 ) {
        hourstandby4S = [UIImage imageNamed:@"pin-20.png"];
        [SevenImageView setImage:hourstandby4S];
    }
    else if (hour_standby_iPhone4S >= 61 && hour_standby_iPhone4S <= 80) {
        hourstandby4S = [UIImage imageNamed:@"pin-30.png"];
        [SevenImageView setImage:hourstandby4S];
    }
    else if (hour_standby_iPhone4S >= 81 && hour_standby_iPhone4S <= 100) {
        hourstandby4S = [UIImage imageNamed:@"pin-40.png"];
        [SevenImageView setImage:hourstandby4S];
    }
    else if (hour_standby_iPhone4S >= 101 && hour_standby_iPhone4S <= 120) {
        hourstandby4S = [UIImage imageNamed:@"pin-50.png"];
        [SevenImageView setImage:hourstandby4S];
    }
    else if (hour_standby_iPhone4S >= 121 && hour_standby_iPhone4S <= 140) {
        hourstandby4S = [UIImage imageNamed:@"pin-60.png"];
        [SevenImageView setImage:hourstandby4S];
    }
    else if (hour_standby_iPhone4S >= 141 && hour_standby_iPhone4S <= 160 ) {
        hourstandby4S = [UIImage imageNamed:@"pin-70.png"];
        [SevenImageView setImage:hourstandby4S];
    }
    else if (hour_standby_iPhone4S >= 161 && hour_standby_iPhone4S <= 180 ) {
        hourstandby4S = [UIImage imageNamed:@"pin-80.png"];
        [SevenImageView setImage:hourstandby4S];
    }
    else if (hour_standby_iPhone4S >= 181 && hour_standby_iPhone4S <= 200 ){
        hourstandby4S = [UIImage imageNamed:@"pin-90.png"];
        [SevenImageView setImage:hourstandby4S];
    }
    else if (hour_standby_iPhone4S >=200 ){
        hourstandby4S = [UIImage imageNamed:@"pin-100.png"];
        [SevenImageView setImage:hourstandby4S];
    }
    
    
    
    
    
    //----------------------Audio Playback iPhone 4S----------------//
    int minutes_audio_iPhone4S = 2400;//minutes of 40 hour (static)
    
    int audio_iPhone4S=(minutes_audio_iPhone4S*batinfo)/100;
    int hour_audio_iPhone4S = audio_iPhone4S/60;
    int min_audio_iPhone4S = audio_iPhone4S%60;
    
    NSLog(@"Audio time :  %d:%d",hour_audio_iPhone4S, min_audio_iPhone4S);
    audioLabel.text = [NSString stringWithFormat:@"%d:%d",hour_audio_iPhone4S, min_audio_iPhone4S ];
    
    if (hour_3gInternet_iPhone4S == 0) {
        houraudio4S = [UIImage imageNamed:@"pin-0.png"];
        [EightImageView setImage:houraudio4S];
    }
    else if (hour_3gInternet_iPhone4S ==1) {
        houraudio4S = [UIImage imageNamed:@"pin-10.png"];
        [EightImageView setImage:houraudio4S];
    }
    else if (hour_3gInternet_iPhone4S ==2) {
        houraudio4S = [UIImage imageNamed:@"pin-20.png"];
        [EightImageView setImage:houraudio4S];
    }
    else if (hour_3gInternet_iPhone4S ==3) {
        houraudio4S = [UIImage imageNamed:@"pin-30.png"];
        [EightImageView setImage:houraudio4S];
    }
    else if (hour_3gInternet_iPhone4S ==4) {
        houraudio4S = [UIImage imageNamed:@"pin-40.png"];
        [EightImageView setImage:houraudio4S];
    }
    else if (hour_3gInternet_iPhone4S ==5) {
        houraudio4S = [UIImage imageNamed:@"pin-50.png"];
        [EightImageView setImage:houraudio4S];
    }
    else if (hour_3gInternet_iPhone4S ==6) {
        houraudio4S = [UIImage imageNamed:@"pin-60.png"];
        [EightImageView setImage:houraudio4S];
    }
    else if (hour_3gInternet_iPhone4S ==7 ) {
        houraudio4S = [UIImage imageNamed:@"pin-70.png"];
        [EightImageView setImage:houraudio4S];
    }
    else if (hour_3gInternet_iPhone4S ==8 ) {
        houraudio4S = [UIImage imageNamed:@"pin-80.png"];
        [EightImageView setImage:houraudio4S];
    }
    else if (hour_3gInternet_iPhone4S ==9 ){
        houraudio4S = [UIImage imageNamed:@"pin-90.png"];
        [EightImageView setImage:houraudio4S];
    }
    else if (hour_3gInternet_iPhone4S >=10 ){
        houraudio4S = [UIImage imageNamed:@"pin-100.png"];
        [EightImageView setImage:houraudio4S];
    }
    
    
}
-(void)iPhone4Call{
#pragma mark
#pragma mark iPhone 4
        NSLog(@"iPhone 4 Called");
    //----------------------3G Internet iPhone 4----------------//
    int minutes_3gInternet_iPhone4 = 360;//minutes of 6 hour (static)
    
    int gInternet_iPhone4=(minutes_3gInternet_iPhone4*batinfo)/100;
    int hour_3gInternet_iPhone4 = gInternet_iPhone4/60;
    int min_3gInternet_iPhone4 = gInternet_iPhone4%60;
    
    NSLog(@"3G internet time :  %d:%d",hour_3gInternet_iPhone4, min_3gInternet_iPhone4);
    gInternetLabel.text = [NSString stringWithFormat:@"%d:%d",hour_3gInternet_iPhone4, min_3gInternet_iPhone4 ];
    deviceLabel.text=[NSString stringWithFormat:@"Your Device : iPhone 4"];
    UIImage *hour3gInternet4;
    UIImage *hour3Gtalktime4;
    UIImage *hour3dGameing4;
    UIImage *hourVideo4;
    UIImage *hourwifi4;
    UIImage *hourTwoGTalkTime4;
    UIImage *hourstandby4;
    UIImage *houraudio4;
    
    if (hour_3gInternet_iPhone4 == 0) {
        hour3gInternet4 = [UIImage imageNamed:@"pin-0.png"];
        [OneImageView setImage:hour3gInternet4];
    }
    else if (hour_3gInternet_iPhone4 ==1) {
        hour3gInternet4 = [UIImage imageNamed:@"pin-10.png"];
        [OneImageView setImage:hour3gInternet4];
    }
    else if (hour_3gInternet_iPhone4 ==2) {
        hour3gInternet4 = [UIImage imageNamed:@"pin-20.png"];
        [OneImageView setImage:hour3gInternet4];
    }
    else if (hour_3gInternet_iPhone4 ==3) {
        hour3gInternet4 = [UIImage imageNamed:@"pin-30.png"];
        [OneImageView setImage:hour3gInternet4];
    }
    else if (hour_3gInternet_iPhone4 ==4) {
        hour3gInternet4 = [UIImage imageNamed:@"pin-40.png"];
        [OneImageView setImage:hour3gInternet4];
    }
    else if (hour_3gInternet_iPhone4 ==5) {
        hour3gInternet4 = [UIImage imageNamed:@"pin-50.png"];
        [OneImageView setImage:hour3gInternet4];
    }
    else if (hour_3gInternet_iPhone4 ==6) {
        hour3gInternet4 = [UIImage imageNamed:@"pin-60.png"];
        [OneImageView setImage:hour3gInternet4];
    }
    else if (hour_3gInternet_iPhone4 ==7 ) {
        hour3gInternet4 = [UIImage imageNamed:@"pin-70.png"];
        [OneImageView setImage:hour3gInternet4];
    }
    else if (hour_3gInternet_iPhone4 ==8 ) {
        hour3gInternet4 = [UIImage imageNamed:@"pin-80.png"];
        [OneImageView setImage:hour3gInternet4];
    }
    else if (hour_3gInternet_iPhone4 ==9 ){
        hour3gInternet4 = [UIImage imageNamed:@"pin-90.png"];
        [OneImageView setImage:hour3gInternet4];
    }
    else if (hour_3gInternet_iPhone4 >=10 ){
        hour3gInternet4 = [UIImage imageNamed:@"pin-100.png"];
        [OneImageView setImage:hour3gInternet4];
    }
    
    
    
    //----------------------3D Games iPhone 4----------------//
    int minutes_games_iPhone4 = 480;//minutes of 8 hour (static)
    
    int games_iPhone4=(minutes_games_iPhone4*batinfo)/100;
    int hour_game_iPhone4 = games_iPhone4/60;
    int min_game_iPhone4 = games_iPhone4%60;
    
    NSLog(@"3d Game Hours :  %d:%d",hour_game_iPhone4, min_game_iPhone4);
    dGamingLabel.text = [NSString stringWithFormat:@"%d:%d",hour_game_iPhone4, min_game_iPhone4 ];
    
    
    if (hour_game_iPhone4 == 0) {
        hour3dGameing4 = [UIImage imageNamed:@"pin-0.png"];
        [TwoImageView setImage:hour3dGameing4];
    }
    else if (hour_game_iPhone4 ==1) {
        hour3dGameing4 = [UIImage imageNamed:@"pin-10.png"];
        [TwoImageView setImage:hour3dGameing4];
    }
    else if (hour_game_iPhone4 ==2) {
        hour3dGameing4 = [UIImage imageNamed:@"pin-20.png"];
        [TwoImageView setImage:hour3dGameing4];
    }
    else if (hour_game_iPhone4 ==3) {
        hour3dGameing4 = [UIImage imageNamed:@"pin-30.png"];
        [TwoImageView setImage:hour3dGameing4];
    }
    else if (hour_game_iPhone4 ==4) {
        hour3dGameing4 = [UIImage imageNamed:@"pin-40.png"];
        [TwoImageView setImage:hour3dGameing4];
    }
    else if (hour_game_iPhone4 ==5) {
        hour3dGameing4 = [UIImage imageNamed:@"pin-50.png"];
        [TwoImageView setImage:hour3dGameing4];
    }
    else if (hour_game_iPhone4 ==6) {
        hour3dGameing4  = [UIImage imageNamed:@"pin-60.png"];
        [TwoImageView setImage:hour3dGameing4 ];
    }
    else if (hour_game_iPhone4  ==7 ) {
        hour3dGameing4  = [UIImage imageNamed:@"pin-70.png"];
        [TwoImageView setImage:hour3dGameing4 ];
    }
    else if (hour_game_iPhone4  ==8 ) {
        hour3dGameing4  = [UIImage imageNamed:@"pin-80.png"];
        [TwoImageView setImage:hour3dGameing4 ];
    }
    else if (hour_game_iPhone4  ==9 ){
        hour3dGameing4  = [UIImage imageNamed:@"pin-90.png"];
        [TwoImageView setImage:hour3dGameing4 ];
    }
    else if (hour_game_iPhone4  >=10 ){
        hour3dGameing4  = [UIImage imageNamed:@"pin-100.png"];
        [TwoImageView setImage:hour3dGameing4 ];
    }
    
    
    
    
    
    //----------------------3G Talk time iPhone 4----------------//
    int minutes3G_iPhone4 = 420;//minutes of 8 hour (static)
    int talk3G_iPhone4=(minutes3G_iPhone4*batinfo)/100;
    int hour3g_iPhone4  = talk3G_iPhone4/60;
    int min3g_iPhone4  = talk3G_iPhone4%60;
    
    
    NSLog(@"talk time :  %d:%d",hour3g_iPhone4 , min3g_iPhone4 );
    gTalkTime.text = [NSString stringWithFormat:@"%d:%d",hour3g_iPhone4, min3g_iPhone4 ];
    
    if (hour3g_iPhone4  == 0) {
        hour3Gtalktime4  = [UIImage imageNamed:@"pin-0.png"];
        [ThreeImageView setImage:hour3Gtalktime4 ];
    }
    else if (hour3g_iPhone4  ==1) {
        hour3Gtalktime4  = [UIImage imageNamed:@"pin-10.png"];
        [ThreeImageView setImage:hour3Gtalktime4 ];
    }
    else if (hour3g_iPhone4 ==2) {
        hour3Gtalktime4  = [UIImage imageNamed:@"pin-20.png"];
        [ThreeImageView setImage:hour3Gtalktime4 ];
    }
    else if (hour3g_iPhone4  ==3) {
        hour3Gtalktime4  = [UIImage imageNamed:@"pin-30.png"];
        [ThreeImageView setImage:hour3Gtalktime4 ];
    }
    else if (hour3g_iPhone4  ==4) {
        hour3Gtalktime4  = [UIImage imageNamed:@"pin-40.png"];
        [ThreeImageView setImage:hour3Gtalktime4 ];
    }
    else if (hour3g_iPhone4  ==5) {
        hour3Gtalktime4  = [UIImage imageNamed:@"pin-50.png"];
        [ThreeImageView setImage:hour3Gtalktime4 ];
    }
    else if (hour3g_iPhone4  ==6) {
        hour3Gtalktime4  = [UIImage imageNamed:@"pin-60.png"];
        [ThreeImageView setImage:hour3Gtalktime4 ];
    }
    else if (hour3g_iPhone4  ==7 ) {
        hour3Gtalktime4  = [UIImage imageNamed:@"pin-70.png"];
        [ThreeImageView setImage:hour3Gtalktime4 ];
    }
    else if (hour3g_iPhone4  ==8 ) {
        hour3Gtalktime4  = [UIImage imageNamed:@"pin-80.png"];
        [ThreeImageView setImage:hour3Gtalktime4 ];
    }
    else if (hour3g_iPhone4  ==9 ){
        hour3Gtalktime4  = [UIImage imageNamed:@"pin-90.png"];
        [ThreeImageView setImage:hour3Gtalktime4 ];
    }
    else if (hour3g_iPhone4  >=10 ){
        hour3Gtalktime4  = [UIImage imageNamed:@"pin-100.png"];
        [ThreeImageView setImage:hour3Gtalktime4 ];
    }
    
    
    //----------------------Video Playback iPhone 4 ----------------//
    int minutes_video_iPhone4  = 600;//minutes of 10 hour (static)
    
    int video_iPhone4 =(minutes_video_iPhone4*batinfo)/100;
    int hour_video_iPhone4 = video_iPhone4/60;
    int min_video_iPhone4 = video_iPhone4%60;
    
    NSLog(@"Video time :  %d:%d",hour_video_iPhone4, min_video_iPhone4);
    videoLabel.text = [NSString stringWithFormat:@"%d:%d",hour_video_iPhone4, min_video_iPhone4 ];
    
    if (hour_video_iPhone4 == 0) {
        hourVideo4  = [UIImage imageNamed:@"pin-0.png"];
        [FourImageView setImage:hourVideo4];
    }
    else if (hour_video_iPhone4 ==1) {
        hourVideo4 = [UIImage imageNamed:@"pin-10.png"];
        [FourImageView setImage:hourVideo4];
    }
    else if (hour_video_iPhone4 ==2) {
        hourVideo4 = [UIImage imageNamed:@"pin-20.png"];
        [FourImageView setImage:hourVideo4];
    }
    else if (hour_video_iPhone4 ==3) {
        hourVideo4 = [UIImage imageNamed:@"pin-30.png"];
        [FourImageView setImage:hourVideo4];
    }
    else if (hour_video_iPhone4 ==4) {
        hourVideo4 = [UIImage imageNamed:@"pin-40.png"];
        [FourImageView setImage:hourVideo4];
    }
    else if (hour_video_iPhone4 ==5) {
        hourVideo4 = [UIImage imageNamed:@"pin-50.png"];
        [FourImageView setImage:hourVideo4];
    }
    else if (hour_video_iPhone4 ==6) {
        hourVideo4 = [UIImage imageNamed:@"pin-60.png"];
        [FourImageView setImage:hourVideo4];
    }
    else if (hour_video_iPhone4 ==7 ) {
        hourVideo4 = [UIImage imageNamed:@"pin-70.png"];
        [FourImageView setImage:hourVideo4];
    }
    else if (hour_video_iPhone4 ==8 ) {
        hourVideo4 = [UIImage imageNamed:@"pin-80.png"];
        [FourImageView setImage:hourVideo4];
    }
    else if (hour_video_iPhone4 ==9 ){
        hourVideo4 = [UIImage imageNamed:@"pin-90.png"];
        [FourImageView setImage:hourVideo4];
    }
    else if (hour_video_iPhone4 >=10 ){
        hourVideo4 = [UIImage imageNamed:@"pin-100.png"];
        [FourImageView setImage:hourVideo4];
    }
    
    
    //----------------------wifi iPhone 4----------------//
    int minutes_wifi_iPhone4 = 600;//minutes of 10 hour (static)
    
    int wifi_iPhone4=(minutes_wifi_iPhone4*batinfo)/100;
    int hour_wifi_iPhone4 = wifi_iPhone4/60;
    int min_wifi_iPhone4 = wifi_iPhone4%60;
    
    NSLog(@"wifi time :  %d:%d",hour_wifi_iPhone4, min_wifi_iPhone4);
    wifiInternetLabel.text = [NSString stringWithFormat:@"%d:%d",hour_wifi_iPhone4, min_wifi_iPhone4];
    if (hour_wifi_iPhone4 == 0) {
        hourwifi4 = [UIImage imageNamed:@"pin-0.png"];
        [FiveImageView setImage:hourwifi4];
    }
    else if (hour_wifi_iPhone4 ==1) {
        hourwifi4 = [UIImage imageNamed:@"pin-10.png"];
        [FiveImageView setImage:hourwifi4];
    }
    else if (hour_wifi_iPhone4 ==2) {
        hourwifi4 = [UIImage imageNamed:@"pin-20.png"];
        [FiveImageView setImage:hourwifi4];
    }
    else if (hour_wifi_iPhone4 ==3) {
        hourwifi4 = [UIImage imageNamed:@"pin-30.png"];
        [FiveImageView setImage:hourwifi4];
    }
    else if (hour_wifi_iPhone4 ==4) {
        hourwifi4 = [UIImage imageNamed:@"pin-40.png"];
        [FiveImageView setImage:hourwifi4];
    }
    else if (hour_wifi_iPhone4 ==5) {
        hourwifi4 = [UIImage imageNamed:@"pin-50.png"];
        [FiveImageView setImage:hourwifi4];
    }
    else if (hour_wifi_iPhone4 ==6) {
        hourwifi4 = [UIImage imageNamed:@"pin-60.png"];
        [FiveImageView setImage:hourwifi4];
    }
    else if (hour_wifi_iPhone4 ==7 ) {
        hourwifi4 = [UIImage imageNamed:@"pin-70.png"];
        [FiveImageView setImage:hourwifi4];
    }
    else if (hour_wifi_iPhone4 ==8 ) {
        hourwifi4 = [UIImage imageNamed:@"pin-80.png"];
        [FiveImageView setImage:hourwifi4];
    }
    else if (hour_wifi_iPhone4 ==9 ){
        hourwifi4 = [UIImage imageNamed:@"pin-90.png"];
        [FiveImageView setImage:hourwifi4];
    }
    else if (hour_wifi_iPhone4 >=10 ){
        hourwifi4 = [UIImage imageNamed:@"pin-100.png"];
        [FiveImageView setImage:hourwifi4];
    }
    
    
    //----------------------2G talk time iPhone 4----------------//
    
    int minutes_2GTalkT_iPhone4 = 840;//minutes of 10 hour (static)
    
    int twoGTalkTime_iPhone4=(minutes_2GTalkT_iPhone4*batinfo)/100;
    int hour_twoGTalkTime_iPhone4 = twoGTalkTime_iPhone4/60;
    int min_twoGTalkTime_iPhone4 = twoGTalkTime_iPhone4%60;
    
    NSLog(@"standby Time :  %d:%d",hour_twoGTalkTime_iPhone4, min_twoGTalkTime_iPhone4);
    standByLabel.text = [NSString stringWithFormat:@"%d:%d",hour_twoGTalkTime_iPhone4, min_twoGTalkTime_iPhone4 ];
    
    if (hour_twoGTalkTime_iPhone4 == 0) {
        hourTwoGTalkTime4 = [UIImage imageNamed:@"pin-0.png"];
        [SixImageView setImage:hourTwoGTalkTime4];
    }
    else if (hour_twoGTalkTime_iPhone4 ==1) {
        hourTwoGTalkTime4 = [UIImage imageNamed:@"pin-10.png"];
        [SixImageView setImage:hourTwoGTalkTime4];
    }
    else if (hour_twoGTalkTime_iPhone4 ==2) {
        hourTwoGTalkTime4 = [UIImage imageNamed:@"pin-20.png"];
        [SixImageView setImage:hourTwoGTalkTime4];
    }
    else if (hour_twoGTalkTime_iPhone4 ==3) {
        hourTwoGTalkTime4 = [UIImage imageNamed:@"pin-30.png"];
        [SixImageView setImage:hourTwoGTalkTime4];
    }
    else if (hour_twoGTalkTime_iPhone4 ==4) {
        hourTwoGTalkTime4 = [UIImage imageNamed:@"pin-40.png"];
        [SixImageView setImage:hourTwoGTalkTime4];
    }
    else if (hour_twoGTalkTime_iPhone4 ==5) {
        hourTwoGTalkTime4 = [UIImage imageNamed:@"pin-50.png"];
        [SixImageView setImage:hourTwoGTalkTime4];
    }
    else if (hour_twoGTalkTime_iPhone4 ==6) {
        hourTwoGTalkTime4 = [UIImage imageNamed:@"pin-60.png"];
        [SixImageView setImage:hourTwoGTalkTime4];
    }
    else if (hour_twoGTalkTime_iPhone4 ==7 ) {
        hourTwoGTalkTime4 = [UIImage imageNamed:@"pin-70.png"];
        [SixImageView setImage:hourTwoGTalkTime4];
    }
    else if (hour_twoGTalkTime_iPhone4 ==8 ) {
        hourTwoGTalkTime4 = [UIImage imageNamed:@"pin-80.png"];
        [SixImageView setImage:hourTwoGTalkTime4];
    }
    else if (hour_twoGTalkTime_iPhone4 ==9 ){
        hourTwoGTalkTime4 = [UIImage imageNamed:@"pin-90.png"];
        [SixImageView setImage:hourTwoGTalkTime4];
    }
    else if (hour_twoGTalkTime_iPhone4 >=10 ){
        hourTwoGTalkTime4 = [UIImage imageNamed:@"pin-100.png"];
        [SixImageView setImage:hourTwoGTalkTime4];
    }
    
    
    
    
    //----------------------Standby time iPhone 4----------------//
    int minutes_standby_iPhone4 = 18000;//minutes of 225 hour (static)
    
    int standby_iPhone4 = (minutes_standby_iPhone4*batinfo)/100;
    int hour_standby_iPhone4 = standby_iPhone4/60;
    int min_standby_iPhone4 = standby_iPhone4%60;
    
    NSLog(@"standby Time :  %d:%d",hour_standby_iPhone4, min_standby_iPhone4);
    standByLabel.text = [NSString stringWithFormat:@"%d:%d",hour_standby_iPhone4, min_standby_iPhone4 ];
    if (hour_standby_iPhone4 <= 0 && hour_standby_iPhone4 <= 20) {
        hourstandby4 = [UIImage imageNamed:@"pin-0.png"];
        [SevenImageView setImage:hourstandby4];
    }
    else if (hour_standby_iPhone4 >= 16 && hour_standby_iPhone4 <= 40) {
        hourstandby4 = [UIImage imageNamed:@"pin-10.png"];
        [SevenImageView setImage:hourstandby4];
    }
    else if (hour_standby_iPhone4 >= 41 && hour_standby_iPhone4 <= 60 ) {
        hourstandby4 = [UIImage imageNamed:@"pin-20.png"];
        [SevenImageView setImage:hourstandby4];
    }
    else if (hour_standby_iPhone4 >= 61 && hour_standby_iPhone4 <= 80) {
        hourstandby4 = [UIImage imageNamed:@"pin-30.png"];
        [SevenImageView setImage:hourstandby4];
    }
    else if (hour_standby_iPhone4 >= 81 && hour_standby_iPhone4 <= 100) {
        hourstandby4 = [UIImage imageNamed:@"pin-40.png"];
        [SevenImageView setImage:hourstandby4];
    }
    else if (hour_standby_iPhone4 >= 101 && hour_standby_iPhone4 <= 120) {
        hourstandby4 = [UIImage imageNamed:@"pin-50.png"];
        [SevenImageView setImage:hourstandby4];
    }
    else if (hour_standby_iPhone4 >= 121 && hour_standby_iPhone4 <= 140) {
        hourstandby4 = [UIImage imageNamed:@"pin-60.png"];
        [SevenImageView setImage:hourstandby4];
    }
    else if (hour_standby_iPhone4 >= 141 && hour_standby_iPhone4 <= 160 ) {
        hourstandby4 = [UIImage imageNamed:@"pin-70.png"];
        [SevenImageView setImage:hourstandby4];
    }
    else if (hour_standby_iPhone4 >= 161 && hour_standby_iPhone4 <= 180 ) {
        hourstandby4 = [UIImage imageNamed:@"pin-80.png"];
        [SevenImageView setImage:hourstandby4];
    }
    else if (hour_standby_iPhone4 >= 181 && hour_standby_iPhone4 <= 200 ){
        hourstandby4 = [UIImage imageNamed:@"pin-90.png"];
        [SevenImageView setImage:hourstandby4];
    }
    else if (hour_standby_iPhone4 >=200 ){
        hourstandby4 = [UIImage imageNamed:@"pin-100.png"];
        [SevenImageView setImage:hourstandby4];
    }
    
    
    
    
    
    //----------------------Audio Playback iPhone 4----------------//
    int minutes_audio_iPhone4 = 2400;//minutes of 40 hour (static)
    
    int audio_iPhone4 = (minutes_audio_iPhone4*batinfo)/100;
    int hour_audio_iPhone4 = audio_iPhone4/60;
    int min_audio_iPhone4 = audio_iPhone4%60;
    
    NSLog(@"Audio time :  %d:%d",hour_audio_iPhone4, min_audio_iPhone4);
    audioLabel.text = [NSString stringWithFormat:@"%d:%d",hour_audio_iPhone4, min_audio_iPhone4 ];
    
    if (hour_3gInternet_iPhone4 == 0) {
        houraudio4 = [UIImage imageNamed:@"pin-0.png"];
        [EightImageView setImage:houraudio4];
    }
    else if (hour_3gInternet_iPhone4 ==1) {
        houraudio4 = [UIImage imageNamed:@"pin-10.png"];
        [EightImageView setImage:houraudio4];
    }
    else if (hour_3gInternet_iPhone4 ==2) {
        houraudio4 = [UIImage imageNamed:@"pin-20.png"];
        [EightImageView setImage:houraudio4];
    }
    else if (hour_3gInternet_iPhone4 ==3) {
        houraudio4 = [UIImage imageNamed:@"pin-30.png"];
        [EightImageView setImage:houraudio4];
    }
    else if (hour_3gInternet_iPhone4 ==4) {
        houraudio4 = [UIImage imageNamed:@"pin-40.png"];
        [EightImageView setImage:houraudio4];
    }
    else if (hour_3gInternet_iPhone4 ==5) {
        houraudio4 = [UIImage imageNamed:@"pin-50.png"];
        [EightImageView setImage:houraudio4];
    }
    else if (hour_3gInternet_iPhone4 ==6) {
        houraudio4 = [UIImage imageNamed:@"pin-60.png"];
        [EightImageView setImage:houraudio4];
    }
    else if (hour_3gInternet_iPhone4 ==7 ) {
        houraudio4 = [UIImage imageNamed:@"pin-70.png"];
        [EightImageView setImage:houraudio4];
    }
    else if (hour_3gInternet_iPhone4 ==8 ) {
        houraudio4 = [UIImage imageNamed:@"pin-80.png"];
        [EightImageView setImage:houraudio4];
    }
    else if (hour_3gInternet_iPhone4 ==9 ){
        houraudio4 = [UIImage imageNamed:@"pin-90.png"];
        [EightImageView setImage:houraudio4];
    }
    else if (hour_3gInternet_iPhone4 >=10 ){
        houraudio4 = [UIImage imageNamed:@"pin-100.png"];
        [EightImageView setImage:houraudio4];
    }
    
    
}


- (void)batteryCharged
{
    float currBatteryLev = [UIDevice currentDevice].batteryLevel;
    // calculate speed of chargement
    float avgChgSpeed = (prevBatteryLev - currBatteryLev) / [startDate timeIntervalSinceNow];
    // get how much the battery needs to be charged yet
    float remBatteryLev = 1.0 - currBatteryLev;
    // divide the two to obtain the remaining charge time
    NSTimeInterval remSeconds = remBatteryLev / avgChgSpeed;
    // convert/format `remSeconds' as appropriate
    NSLog(@"remSeconds : %f",remSeconds);
}

-(void)update{
    
    NSLog(@"Called");
    //Your update methods here
 //   [self performSelector:@selector(update) withObject:nil afterDelay:3.0];

    
    
    
    UIDevice *myDevice = [UIDevice currentDevice];
    [myDevice setBatteryMonitoringEnabled:YES];
    float batLeft = [myDevice batteryLevel];
    int i=[myDevice batteryState];
    
    batinfo=(batLeft*100);
    UIImage *mainBattery;
    batinfo = 50;
    if (batinfo >=0 && batinfo <=10) {
        NSLog(@"batinfo at 0: %d ",batinfo);
        mainBattery = [UIImage imageNamed:@"battery10.png"];
        [mainBatteryImageView setImage:mainBattery];

    }
    else if (batinfo >= 11 && batinfo <= 20) {
        NSLog(@"batinfo at 11: %d ",batinfo);
        mainBattery = [UIImage imageNamed:@"battery20.png"];
        [mainBatteryImageView setImage:mainBattery];
    }
    else if (batinfo >= 21 && batinfo <= 30) {
        NSLog(@"batinfo at 21: %d ",batinfo);
        mainBattery = [UIImage imageNamed:@"battery30.png"];
        [mainBatteryImageView setImage:mainBattery];
    }
    else if (batinfo >=31 && batinfo <= 40) {
        NSLog(@"batinfo at 31: %d ",batinfo);
        mainBattery = [UIImage imageNamed:@"battery40.png"];
        [mainBatteryImageView setImage:mainBattery];
    }
    else if (batinfo >=41 && batinfo <= 50) {
        NSLog(@"batinfo at 41: %d ",batinfo);
        mainBattery = [UIImage imageNamed:@"battery50.png"];
        [mainBatteryImageView setImage:mainBattery];
    }
    else if (batinfo >=51 && batinfo <= 60) {
        NSLog(@"batinfo at 51: %d ",batinfo);
        mainBattery = [UIImage imageNamed:@"battery60.png"];
        [mainBatteryImageView setImage:mainBattery];
    }
    else if (batinfo >=61 && batinfo <= 70) {
        NSLog(@"batinfo at 61: %d ",batinfo);
        mainBattery = [UIImage imageNamed:@"battery70.png"];
        [mainBatteryImageView setImage:mainBattery];
    }
    else if (batinfo >=71 && batinfo <= 80) {
        NSLog(@"batinfo at 71: %d ",batinfo);
        mainBattery = [UIImage imageNamed:@"battery80.png"];
        [mainBatteryImageView setImage:mainBattery];
    }
    else if (batinfo >=81 && batinfo <= 90) {
        NSLog(@"batinfo at 81: %d ",batinfo);
        mainBattery = [UIImage imageNamed:@"battery90.png"];
        [mainBatteryImageView setImage:mainBattery];
    }
    else if (batinfo >=91 && batinfo <= 100) {
        NSLog(@"batinfo at 91: %d ",batinfo);
        mainBattery = [UIImage imageNamed:@"battery100.png"];
        [mainBatteryImageView setImage:mainBattery];
    }
    
    NSString *deviceType = [UIDevice currentDevice].model;

    // iPhone : iPhone,iPhone1,2,iPhone2,1
    //iPhone 4 : iPhone3,1,iPhone3,3
    //iPhone 4S : iPhone4,1

    deviceType = @"iPhone";
    //iPhone
  
    if([deviceType isEqualToString:@"iPhone" ] || [deviceType isEqualToString:@"iPhone1,2"] || [deviceType isEqualToString:@"iPhone2,1"])
    {
        NSLog(@"iPhone old");
       [self iPhone4Call];
    }
    
    //iPod touch
    else if([deviceType isEqualToString:@"iPod1,1" ] || [deviceType isEqualToString:@"iPod2,1"] || [deviceType isEqualToString:@"iPod3,1"] || [deviceType isEqualToString:@"iPod4,1"]  )
    {
        NSLog(@"iPod");
 [self iPhone4Call];
    }
    
    //iPad
    else if([deviceType isEqualToString:@"iPad1,1" ] || [deviceType isEqualToString:@"iPad2,1"] || [deviceType isEqualToString:@"iPad2,2"] || [deviceType isEqualToString:@"iPad2,3"] || [deviceType isEqualToString:@"iPad3,1"]
            || [deviceType isEqualToString:@"iPad3,2"] || [deviceType isEqualToString:@"iPad3,3"])
    {
        NSLog(@"iPad");
        deviceLabel.text=@"iPad";
        [self iPhone4Call];
    }
    
    
    
    //iPhone 4
    else if([deviceType isEqualToString:@"iPhone3,1" ] || [deviceType isEqualToString:@"iPhone3,3"] )
    {
        NSLog(@"iPhone new");
         [self iPhone4Call];
    }
    //iPhone 4S
    else if([deviceType isEqualToString:@"iPhone4,1" ])
    {
        NSLog(@"iPhone 4S");
   [self iPhone4SCall];
    }
    //iPhone 5
    else if([deviceType isEqualToString:@"iPhone5,1" ])
    {
        NSLog(@"iPhone 5");
        [self iPhone5Call];
    }
    

    
    
    
    
    

    
    
    
//------------------------------------------//

    
    
    NSString *percantageSting = @"%";
    batteryPercentage.text= [NSString stringWithFormat:@"%d%@",batinfo,percantageSting];
    
    NSLog(@"Battry Level is :%d and Battery Status is :%d ",batinfo,i);
    
    switch (i)
    {
        case UIDeviceBatteryStateUnplugged:
        { remainingLabel.hidden=YES;
            [BCStatus setText:NSLocalizedString(@"Unplugged", @"")];
            break;
        }
        case UIDeviceBatteryStateCharging:
        {
            int h = 2;
            int m = 60;
            remainingLabel.text=[NSString stringWithFormat:@"Remaining Charge : %d:%d", h,m];
            remainingLabel.hidden=NO;
            //Check if we're already running
            if (theTimer != nil) {
                return;
            }
            
            
            NSString *input = @"02:00";
            NSArray *timeSplit = [input componentsSeparatedByString:@":"];
            NSUInteger hours =  [[timeSplit objectAtIndex:0] intValue];
            NSUInteger minutes =  [[timeSplit objectAtIndex:1] intValue];
            NSDate *now = [NSDate date];
            NSDateComponents *dateComponents = [cal components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:now];
            [dateComponents setHour:hours];
            [dateComponents setMinute:minutes];
            
            if (!targetDate) {
                targetDate = [[cal dateFromComponents:dateComponents] retain];
            }
            else {
                targetDate = nil;
                targetDate = [[cal dateFromComponents:dateComponents] retain];
            }
            
            if ([targetDate timeIntervalSinceNow] > 0) {
                theTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
            //    [self hideKeyboard];
            }
            else {
                targetDate = nil;
  //              UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Cannot countdown because time is before now" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
               // [alert show];
                //[alert release];
            }

            
            
           
            [BCStatus setText:NSLocalizedString(@"Charging", @"")];
            break;
        }
        case UIDeviceBatteryStateFull:
        {
             remainingLabel.hidden=YES;
            [BCStatus setText:NSLocalizedString(@"Full", @"")];
            break;
        }
        default:
        {
             remainingLabel.hidden=YES;
            [BCStatus setText:NSLocalizedString(@"Unknown", @"")];
            break;
            
            remainingLabel.hidden=NO;
        }
    }
    
    
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    prevBatteryLev = [UIDevice currentDevice].batteryLevel;
    startDate = [NSDate date];
    
    
    float currBatteryLev = [UIDevice currentDevice].batteryLevel;
    // calculate speed of chargement
    float avgChgSpeed = (prevBatteryLev - currBatteryLev) / [startDate timeIntervalSinceNow];
    // get how much the battery needs to be charged yet
    float remBatteryLev = 1.0 - currBatteryLev;
    // divide the two to obtain the remaining charge time
    NSTimeInterval remSeconds = remBatteryLev / avgChgSpeed;
    // convert/format `remSeconds' as appropriate
    
    NSString *   foo = [NSString stringWithFormat: @"%f", remSeconds];
    NSLog(@"remSeconds : %@",foo);
    

}
- (void)tick {
    if ([targetDate timeIntervalSinceNow] <= 0) {
        //Checks if the countdown completed
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Countdown Completed" message:@"YAY! The countdown has complete" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
       // [self reset];
        return;
    }
    components = [cal components:(NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:[NSDate date] toDate:targetDate options:0];
    
    NSInteger hours = [components hour];
    NSInteger minutes = [components minute];
    NSInteger seconds = [components second];
    
    NSString *output = [NSString stringWithFormat:@"%i Hours\n%i Minutes\n%i Seconds\n", hours, minutes, seconds];
    remainingLabel.text = output;
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
            [self.view addSubview:viewController.view];
//        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//        //  [self presentModalViewController:viewController animated:YES];
//        [self presentViewController:viewControllerOne animated:YES completion:nil];
//        
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

-(IBAction)onePopUpCalled:(id)sender{
        gInternetView.hidden=NO;
    
        dGamingView.hidden=YES;
        gTalkTimeView.hidden=YES;
        videoView.hidden=YES;
        wifiInternetView.hidden=YES;
        twoGTimeView.hidden=YES;
        standByView.hidden=YES;
        audioView.hidden=YES;
}

-(IBAction)twoPopUpCalled:(id)sender{
    
    dGamingView.hidden=NO;
    gInternetView.hidden=YES;
    gTalkTimeView.hidden=YES;
    videoView.hidden=YES;
    wifiInternetView.hidden=YES;
    twoGTimeView.hidden=YES;
    standByView.hidden=YES;
    audioView.hidden=YES;

}

-(IBAction)threePopUpCalled:(id)sender{
    gInternetView.hidden=YES;
    
    dGamingView.hidden=YES;
    gTalkTimeView.hidden=NO;
    videoView.hidden=YES;
    wifiInternetView.hidden=YES;
    twoGTimeView.hidden=YES;
    standByView.hidden=YES;
    audioView.hidden=YES;

}

-(IBAction)fourPopUpCalled:(id)sender{
    gInternetView.hidden=YES;
    
    dGamingView.hidden=YES;
    gTalkTimeView.hidden=YES;
    videoView.hidden=NO;
    wifiInternetView.hidden=YES;
    twoGTimeView.hidden=YES;
    standByView.hidden=YES;
    audioView.hidden=YES;
}

-(IBAction)fivePopUpCalled:(id)sender{
    gInternetView.hidden=YES;
    
    dGamingView.hidden=YES;
    gTalkTimeView.hidden=YES;
    videoView.hidden=YES;
    wifiInternetView.hidden=NO;
    twoGTimeView.hidden=YES;
    standByView.hidden=YES;
    audioView.hidden=YES;
}

-(IBAction)sixPopUpCalled:(id)sender{
    gInternetView.hidden=YES;
    
    dGamingView.hidden=YES;
    gTalkTimeView.hidden=YES;
    videoView.hidden=YES;
    wifiInternetView.hidden=YES;
    twoGTimeView.hidden=NO;
    standByView.hidden=YES;
    audioView.hidden=YES;
}

-(IBAction)sevenPopUpCalled:(id)sender{
    gInternetView.hidden=YES;
    
    dGamingView.hidden=YES;
    gTalkTimeView.hidden=YES;
    videoView.hidden=YES;
    wifiInternetView.hidden=YES;
    twoGTimeView.hidden=YES;
    standByView.hidden=NO;
    audioView.hidden=YES;
}

-(IBAction)eightPopUpCalled:(id)sender{
    gInternetView.hidden=YES;
    
    dGamingView.hidden=YES;
    gTalkTimeView.hidden=YES;
    videoView.hidden=YES;
    wifiInternetView.hidden=YES;
    twoGTimeView.hidden=YES;
    standByView.hidden=YES;
    audioView.hidden=NO;
}

#pragma
#pragma Tips Call
-(IBAction)tipsCall:(id)sender{
    
    viewControllerThree = [[BSTipsViewController alloc]
                           initWithNibName:@"BSTipsViewController"
                           bundle:nil];
    [self.view addSubview:viewControllerThree.view];
    
    
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
//        viewControllerThree = [[BSTipsViewController alloc] initWithNibName:@"BSTipsViewController" bundle:[NSBundle mainBundle]];
//        self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//        //  [self presentModalViewController:viewController animated:YES];
//        [self presentViewController:viewControllerThree animated:YES completion:nil];
//        
//    } else {
//        viewControllerThree = [[BSTipsViewController alloc] initWithNibName:@"BSTipsViewController~iPad" bundle:[NSBundle mainBundle]];
//        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//        [self presentViewController:viewControllerThree animated:YES completion:nil];
//        
//    }
    
    NSLog(@"tips");
}


@end
