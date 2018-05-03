//
//  AppDelegate.m
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 26/04/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import "AppDelegate.h"
#import "UnifiedTabBarViewController.h"
#import "LeftSliderViewController.h"
#import "LGSideMenuController.h"
#import "SplashViewController.h"
@interface AppDelegate ()
@property (strong, nonatomic) LeftSliderViewController *leftVC;

@end

@implementation AppDelegate
@synthesize leftVC;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self registerNotification];
    [self checkUserAuthentication];
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}
-(void)registerNotification
{
    
    UIUserNotificationSettings* notificationSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:notificationSettings];
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkUserAuthentication) name:AUTHENTICATION_CHANGE object:nil];

}
-(void)checkUserAuthentication{
    if ([Helper isCheckAuthentication]){
        self.window.rootViewController = nil;
        UnifiedTabBarViewController *unifiedController = [[UnifiedTabBarViewController alloc] init];
        leftVC = [[LeftSliderViewController alloc] init];
        LGSideMenuController *sideMenuController = [LGSideMenuController sideMenuControllerWithRootViewController:unifiedController
                                leftViewController:leftVC
                               rightViewController:nil];
        sideMenuController.leftViewWidth = LEFT_SLIDER_VIEW_WIDTH;
        sideMenuController.leftViewPresentationStyle = LGSideMenuPresentationStyleSlideAbove;
        sideMenuController.delegate = leftVC;
        [sideMenuController setLeftViewSwipeGestureEnabled:NO];
        self.window.rootViewController = sideMenuController;
        

    } else {
        [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
        [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
        
        self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[SplashViewController alloc] init]];
    }
    [UIApplication sharedApplication].keyWindow.backgroundColor = HEADER_BAR;

}
@end
