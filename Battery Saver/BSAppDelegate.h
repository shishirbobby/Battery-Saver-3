//
//  BSAppDelegate.h
//  Battery Saver
//
//  Created by Shishir Mishra on 16/12/12.
//  Copyright (c) 2012 Shishir Mishra. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BSViewController;

@interface BSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) BSViewController *viewController;

@end
